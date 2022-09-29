#!/usr/bin/env bash

./build-tx-fuzzer.sh

# BUILDKIT=1 docker build --no-cache -t geth:bad-block-creator -f geth_bad-block-creator.Dockerfile .
# BUILDKIT=1 docker build --no-cache -t geth:bad-block-creator-inst -f geth_bad-block-creator-inst.Dockerfile .

buildah bud --registries-conf=registries.conf -f "geth_bad-block-creator.Dockerfile" -t "geth:bad-block-creator" --format docker
