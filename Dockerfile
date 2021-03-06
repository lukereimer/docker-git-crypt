FROM alpine:3.4
MAINTAINER Xueshan Feng <xueshan.feng@gmail.com>

ENV VERSION 0.5.0-1

RUN apk --update add \
   curl \
   git \
   g++ \
   make \
   openssh \
   openssl \
   openssl-dev \
   && rm -rf /var/cache/apk/*

RUN curl -L https://github.com/AGWA/git-crypt/archive/debian/$VERSION.tar.gz | tar zxv -C /var/tmp
RUN cd /var/tmp/git-crypt-debian-$VERSION && make && make install PREFIX=/usr/local

WORKDIR /repo
VOLUME /repo
CMD ["/bin/bash"]
