FROM hypriot/rpi-alpine-scratch

RUN apk update && \
    apk upgrade && \
    rm -rf /var/cache/apk/*

RUN apk add --no-cache shairport-sync

