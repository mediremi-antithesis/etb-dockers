#!/usr/bin/env bash

# BUILDKIT=1 docker build --no-cache -t etb-all-clients -f etb-all-clients.Dockerfile .
# BUILDKIT=1 docker build --no-cache -t etb-all-clients:inst -f etb-all-clients_inst.Dockerfile .

buildah bud --registries-conf=registries.conf -f "etb-all-clients.Dockerfile" -t "etb-all-clients" --format docker

# podman tag localhost/etb-all-clients:latest us-central1-docker.pkg.dev/molten-verve-216720/ethereum-repository/etb-all-clients:latest
podman tag localhost/etb-all-clients:latest us-central1-docker.pkg.dev/molten-verve-216720/ethereum-repository/etb-all-clients:latest_besu_bug
