FROM hypriot/rpi-alpine-scratch:v3.4

MAINTAINER Tobias L. Maier <me@tobiasmaier.info>

RUN apk update && \
    apk upgrade && \
    rm -rf /var/cache/apk/*

RUN apk add --no-cache \
  alsa-lib-dev \
  autoconf \
  automake \
  avahi-dev \
  curl \
  libconfig-dev \
  libdaemon-dev \
  openssl-dev \
  libtool \
  popt-dev \
  soxr-dev

ARG SHAIRPORT_VERSION=2.8.6

RUN curl -Lo /tmp/$SHAIRPORT_VERSION.tar.gz https://github.com/mikebrady/shairport-sync/archive/$SHAIRPORT_VERSION.tar.gz \
      && tar -xzf /tmp/$SHAIRPORT_VERSION.tar.gz -C /tmp \
      && rm /tmp/$SHAIRPORT_VERSION.tar.gz \
      && cd /tmp/shairport-sync-$SHAIRPORT_VERSION \

    && cd /tmp/shairport-sync-$SHAIRPORT_VERSION \
    && autoreconf -i -f  \
    && ./configure --with-alsa \
      --with-avahi \
      --with-ssl=openssl \
      --with-soxr \
      --with-metadata \
      
    && make \
    && make install \
    && rm -R -f /tmp/shairport-sync-$SHAIRPORT_VERSION \

RUN apk del \ 
        alsa-lib-dev \
        autoconf \
        automake \
        avahi-dev \
        build-base \
        libconfig-dev \
        libdaemon-dev \
        openssl-dev \
        popt-dev \
        soxr-dev
  
CMD shairport-sync -v -a $name

