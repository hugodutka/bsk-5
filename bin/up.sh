#!/bin/bash

PROJECT_DIR=$(dirname $(dirname "$0"))

# These env variables help with caching
export COMPOSE_DOCKER_CLI_BUILD=1
export DOCKER_BUILDKIT=1

cd "$PROJECT_DIR" && \
docker-compose \
    -p bsk5 \
    up \
    --build
