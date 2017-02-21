#!/bin/bash

set -ex

generate_docker_files() {
    mkdir -p $1
    cat Dockerfile \
        | sed s/__PY_VER__/$1/ \
        > $1/Dockerfile
}

build_docker_images() {
    docker build --no-cache --force-rm --pull -t mrupgrade/deadsnakes-dev:$1 $1/
}

test_image() {
    docker run -it --rm mrupgrade/deadsnakes-dev:$1 python --version
}

for VER in 2.6 2.7 3.3 3.4 3.5 3.6
do
    if [ "$1" = 'gen' ]
    then
        generate_docker_files $VER
    else
        generate_docker_files $VER
        build_docker_images $VER
        test_image $VER
    fi
done
