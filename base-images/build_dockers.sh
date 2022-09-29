#!/usr/bin/env bash

buildah bud --registries-conf=registries.conf -f "etb-client-builder.Dockerfile" -t "etb-client-builder" --format docker
podman tag localhost/etb-client-builder:latest docker.io/z3nchada/etb-client-builder:latest

buildah bud --registries-conf=registries.conf -f "etb-client-runner.Dockerfile" -t "etb-client-runner" --format docker
podman tag localhost/etb-client-runner:latest docker.io/z3nchada/etb-client-runner:latest
