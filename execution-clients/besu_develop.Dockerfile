from etb-client-builder:latest as base

# build besu; no instrumentation

WORKDIR /usr/src

from base as builder

# ARG GIT_BRANCH="main"
ARG GIT_BRANCH="963da3d7ac99b85b7e928177ad0bc0cefc9eba58"

RUN git clone --progress https://github.com/hyperledger/besu.git && cd besu && git checkout ${GIT_BRANCH} && ./gradlew installDist

RUN cd besu && git log -n 1 --format=format:"%H" > /besu.version

from debian:bullseye-slim

RUN apt update && apt install -y --no-install-recommends \
    openjdk-17-jre

COPY --from=builder /usr/src/besu/build/install/besu/. /opt/besu/
COPY --from=builder /besu.version /besu.version
run ln -s /opt/besu/bin/besu /usr/local/bin/besu

ENTRYPOINT ["/bin/bash"]
