FROM ubuntu:xenial
MAINTAINER Xinjiang Shao <shaoxinjiang at gmail dot com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q && \
    apt-get install -y texlive-full \
    gnuplot && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

VOLUME /mnt/src

ADD docker-entrypoint.sh /docker-entrypoint.sh

RUN ["chmod", "+x", "/docker-entrypoint.sh"]

ENTRYPOINT ["/docker-entrypoint.sh"]

