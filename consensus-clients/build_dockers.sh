#!/usr/bin/env bash

# for df in $(ls | grep Dockerfile); do
for df in $(ls | grep Dockerfile | grep -v inst); do
    echo $df
    i=`echo $df | tr '_' ':'`
    image=`echo "${i::-11}"`
    # BUILDKIT=1 docker build --no-cache -f "$df" -t "$image" .
    buildah bud --registries-conf=registries.conf -f "${df}" -t "${image}" --format docker
done

