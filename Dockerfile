FROM ubuntu:xenial
MAINTAINER uberamd@gmail.com

ARG SENSU_VERSION=1.3.3-1
ENV SENSU_VERSION ${SENSU_VERSION}

ADD https://sensu.global.ssl.fastly.net/apt/pubkey.gpg /tmp/pubkey.gpg

RUN \
  apt-get update && \
  apt-get install -y apt-transport-https curl wget && \
  apt-key add /tmp/pubkey.gpg && \
  echo 'deb     https://sensu.global.ssl.fastly.net/apt xenial main' > /etc/apt/sources.list.d/sensu.list && \
  apt-get update && \
  apt-get install -y sensu=${SENSU_VERSION} && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

