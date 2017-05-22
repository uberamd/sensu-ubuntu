FROM ubuntu:xenial
MAINTAINER uberamd@gmail.com

ARG SENSU_VERSION=0.29.0
ENV SENSU_VERSION ${SENSU_VERSION}

ADD https://sensu.global.ssl.fastly.net/apt/pubkey.gpg /tmp/pubkey.gpg

RUN \
  apt-get update \
  && apt-get install -y apt-transport-https

RUN \
  apt-key add /tmp/pubkey.gpg \
  && echo 'deb     https://sensu.global.ssl.fastly.net/apt xenial main' > /etc/apt/sources.list.d/sensu.list \
  && apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y sensu=${SENSU_VERSION}

