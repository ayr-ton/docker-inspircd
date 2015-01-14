FROM debian:jessie

RUN apt-get update && apt-get -y install \
    libgnutls28-dev \
    gnutls-bin \
    pkg-config \
    build-essential

RUN useradd ircd
RUN mkdir /inspircd
COPY build-inner.sh /build-inner.sh
