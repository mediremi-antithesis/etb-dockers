#!/usr/bin/env bash

git clone -b develop https://github.com/kurtosis-tech/tx-fuzz

cp tx-fuzzer.Dockerfile tx-fuzz/tx-fuzzer.Dockerfile

cd tx-fuzz

# docker build --no-cache -t tx-fuzzer -f tx-fuzzer.Dockerfile .
buildah bud --registries-conf=registries.conf -f "tx-fuzzer.Dockerfile" -t "tx-fuzzer" --format docker

cd ../

rm -rf tx-fuzz
