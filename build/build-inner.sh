#!/bin/sh

cd /inspircd-build

./configure \
    --disable-interactive \
    --enable-gnutls \
    --enable-epoll \
    --prefix=/inspircd

make
make INSTUID=ircd install
