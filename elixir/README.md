# Elixir

These Dockerfiles are used as base images for local development and CI.

## Development

    git clone https://github.com/civilcode/docker.git
    cd docker
    docker build --no-cache -t civilcode/elixir-dev:1.6.5a -f elixir/Dockerfile.dev .
    docker run -i --name elixir-dev-runtime -t --rm civilcode/elixir-dev:1.6.5a zsh
    docker push civilcode/elixir-dev:1.6.5a

## Versioning

*  branch is created for each new version, i.e. `elixir-1.6.5_stable` -> `elixir-1.6.6_stable`
*  updates to a version
```
