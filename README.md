# CivilCode's Docker Images

## Setup

    git clone https://github.com/civilcode/docker.git
    cd docker

Please see the sub-directories for specific languages and platforms.

## Update a version
     make upgrade VERSION=1.9.0
     git add . && git commit

The commit is not done automatically as there can be adjustment to make to the Dockefiles (eg: upgrade postgresql-client)

## About CivilCode Inc

[CivilCode Inc.](http://www.civilcode.io) develops tailored business applications in
[Elixir](http://elixir-lang.org/) and [Phoenix](http://www.phoenixframework.org/) in Montreal, Canada.
