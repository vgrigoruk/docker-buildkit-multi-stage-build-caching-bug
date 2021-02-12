#!/bin/bash

export DOCKER_BUILDKIT=1

docker build -f Dockerfile.builder -t builder:1 .
docker build -f Dockerfile.runtime -t runtime:1 .


docker build --build-arg BUILDKIT_INLINE_CACHE=1 --cache-from app:2 -f Dockerfile -t app:1 .

docker builder prune -a -f > /dev/null

echo "1" >> dummy_file.txt

docker build --build-arg BUILDKIT_INLINE_CACHE=1 --cache-from app:1 -f Dockerfile -t app:2 .

docker builder prune -a -f > /dev/null
