# Dockerfile for dnsdist

FROM debian:latest

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y gosu dnsdist


RUN apt-get -y autoremove  \
 && apt-get -y clean \
 && rm -rf /var/lib/apt/lists/*

# Verify if gosu is working
RUN gosu nobody true

COPY entrypoint.sh /usr/sbin/

RUN chmod 755 /usr/sbin/entrypoint.sh

CMD ["/usr/sbin/entrypoint.sh"]
