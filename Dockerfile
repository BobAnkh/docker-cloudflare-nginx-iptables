FROM debian:stretch-slim

ENV CONFD_VERSION 0.16.0

RUN apt-get update \
   && DEBIAN_FRONTEND=noninteractive apt-get install -y -q --no-install-recommends \
     ca-certificates \
     iproute2 \
     iptables \
     curl \
   && mkdir -p /etc/confd/conf.d \
   && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/local/bin
RUN \
    curl -s -L https://github.com/kelseyhightower/confd/releases/download/v$CONFD_VERSION/confd-$CONFD_VERSION-linux-amd64 -o confd; \
    chmod +x confd

COPY docker-entrypoint.sh        /
COPY *.toml                      /etc/confd/configs/
COPY *.tmpl                      /etc/confd/templates/

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["confd"]