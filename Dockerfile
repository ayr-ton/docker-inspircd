FROM debian:jessie

RUN apt-get update && apt-get -y install \
    libgnutls-deb0-28 \
    gnutls-bin

COPY inspircd /inspircd
RUN useradd ircd
RUN chown -R ircd /inspircd/data /inspircd/logs

VOLUME [ "/inspircd/conf", "/inspircd/logs" ]

EXPOSE 6664
EXPOSE 6667
EXPOSE 6697

CMD [ "/bin/su", "-m", "ircd", "-c", "/inspircd/inspircd start --nofork" ]
