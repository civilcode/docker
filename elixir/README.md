# Elixir

These Dockerfiles are used as base images for local development and CI.

Commands for managing the images are in the Makefile.

## Setup

    git clone https://github.com/civilcode/docker.git
    cd docker

Please see the sub-directories for specific languages and platforms.

## Update a version
     make upgrade VERSION=1.9.0 SUFFIX=a
