FROM node:10.9-alpine

LABEL maintainer="it@quantworks.com"

ENV CHROME_PATH=/usr/lib/chromium/
ENV CHROME_BIN=/usr/bin/chromium-browser

RUN apk update \
    && apk upgrade \
    && echo @edge http://nl.alpinelinux.org/alpine/edge/community \
        >> /etc/apk/repositories \
    && echo @edge http://nl.alpinelinux.org/alpine/edge/main \
        >> /etc/apk/repositories \
    && apk add --no-cache \
        git \
        py-pip \
        python \
        nss@edge \
        chromium@edge \
    && pip install awscli \
    && adduser -D chrome

USER chrome
