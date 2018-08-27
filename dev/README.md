# Development Environment

A Docker image that builds a standard CivilCode development environment.

STATUS: This is not currently being used as the host is configured for non-specific language tools
such as `git.` It is provided as an example only.

To build:

    docker build -t civilcode/dev:0.1.0 ./dev

To run:

    docker run -it --rm --name my-dev \
    -v $HOME/Development/dotfiles.local:/opt/app/Development/dotfiles.local \
    -u $(id -u):$(id -g) \
    civilcode/dev:0.1.0 \
    /bin/zsh -c "set -e && rcup -f && /bin/zsh"

## Updating dotfiles

If you wish to update the dotfiles on start, merge the following with the
project's `docker-compose.yml`:

```yaml
application:
  volumes:
    - ~/Development/dotfiles.local:/opt/app/Development/dotfiles.local
  command: >
    /bin/zsh -c "
      set -e
      git -C ~/Development/dotfiles pull && rcup -f
      /bin/zsh
