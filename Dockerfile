FROM ubuntu:18.04

ENV PATH="./bin:${PATH}"

WORKDIR /tmp

RUN apt update && \
    apt install libevent-dev libssl-dev python-dev libtool git patch make m4 automake pkg-config pandoc -y

RUN git clone https://github.com/pgbouncer/pgbouncer.git --branch pgbouncer_1_10_0 --single-branch

WORKDIR /tmp/pgbouncer

RUN git submodule init && \
    git submodule update

WORKDIR /tmp/pgbouncer-rr-patch