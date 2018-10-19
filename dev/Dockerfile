# As our primary development platform is Elixir, let's use that as our base image. This also
# includes a lot of the base dependencies required.
FROM bitwalker/alpine-elixir-phoenix:1.7.3

LABEL maintainer="bonjour@civilcode.io"

# update package manager
# install development dependencies
RUN apk update \
    apk upgrade --no-cache \
    apk add git git-perl less

# install zsh
RUN apk add zsh
RUN sed -i -e "s/bin\/ash/bin\/zsh/" /etc/passwd
ENV SHELL /bin/zsh
RUN sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install hub
RUN apk add musl-dev
RUN wget https://github.com/github/hub/releases/download/v2.5.0/hub-linux-386-2.5.0.tgz && \
   tar zvxvf hub-linux-386-2.5.0.tgz && \
   ./hub-linux-386-2.5.0/install && \
   rm -rf ./hub-linux-386-2.5.0 && \
   rm -rf ./hub-linux-386-2.5.0.tgz

# install rcm (dotfiles manager)
RUN curl -LO https://thoughtbot.github.io/rcm/dist/rcm-1.3.3.tar.gz && \
    tar -xvf rcm-1.3.3.tar.gz && \
    cd rcm-1.3.3 && \
    ./configure && \
    make install && \
    cd .. && \
    rm -rf rcm-1.3.3.tar.gz && \
    rm -rf rcm-1.3.3

# install dotfiles
RUN mkdir ~/Development && \
    cd ~/Development && \
    git clone https://github.com/civilcode/dotfiles.git && \
    env RCRC=$HOME/Development/dotfiles/rcrc rcup && \
    echo "source $HOME/.civilcode.zshrc" >> ~/.zshrc && \
    lsrc

# Ignore security warnings for aliases included by local dotfiles
ENV ZSH_DISABLE_COMPFIX true

# install watchman
RUN apk add autoconf automake libtool python-dev linux-headers
RUN git clone https://github.com/facebook/watchman.git && \
    cd watchman && \
    git checkout v4.9.0 && \
    ./autogen.sh && \
    ./configure && \
    make && \
    make install

# use fixuid to ensure the same user/group on host and container
# https://github.com/boxboat/fixuid
RUN apk add sudo shadow && \
    addgroup -g 1000 dev && \
    adduser -u 1000 -G dev -H -s /bin/sh -D dev && \
    echo 'dev ALL=NOPASSWD: ALL' >> /etc/sudoers.d/50-dev

RUN USER=dev && \
    GROUP=dev && \
    curl -SsL https://github.com/boxboat/fixuid/releases/download/v0.4/fixuid-0.4-linux-amd64.tar.gz | tar -C /usr/local/bin -xzf - && \
    chown root:root /usr/local/bin/fixuid && \
    chmod 4755 /usr/local/bin/fixuid && \
    mkdir -p /etc/fixuid && \
    printf "user: $USER\ngroup: $GROUP\n" > /etc/fixuid/config.yml

WORKDIR /app
RUN chown dev:dev /app

USER dev:dev

ENTRYPOINT ["fixuid"]
