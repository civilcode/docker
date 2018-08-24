# CivilCode's Elixir Base Docker Images

These Dockerfiles are used as base images for local development and CI.

## Development

  git clone https://github.com/civilcode/docker-elixir.git
  cd docker
  docker build --no-cache -t civilcode/elixir-dev:1.6.5a -f Dockerfile.dev .
  docker run -i --name elixir-dev-runtime -t --rm civilcode/elixir-dev:1.6.5a zsh
  docker push civilcode/elixir-dev:1.6.5a

## Versioning

*  branch is created for each new version, i.e. `1.6.5-stable` -> `1.6.6-stable`
*  updates to a version

## Updating dotfiles

If you wish to update the dotfiles on start, merge the following with project's `docker-compose.yml`:

```yaml
application:
  volumes:
    - ~/Development/dotfiles.local:/opt/app/Development/dotfiles.local
  command: >
    /bin/zsh -c "
      set -e
      git -C ~/Development/dotfiles pull && rcup -f
      /bin/zsh
```
