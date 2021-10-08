FROM debian:stretch-slim

RUN apt-get update \
   && DEBIAN_FRONTEND=noninteractive apt-get install -y -q --no-install-recommends \
     ca-certificates \
     iproute2 \
     iptables \
     curl \
     cron \
   && rm -rf /var/lib/apt/lists/*

WORKDIR /

COPY docker-entrypoint.sh        /
COPY iptables-docker.sh /usr/local/bin/
COPY iptables-dockerv6.sh /usr/local/bin/
COPY check-iptables.sh /usr/local/bin/
RUN  chmod +x /docker-entrypoint.sh && \
      chmod +x /usr/local/bin/iptables-docker.sh && \
      chmod +x /usr/local/bin/iptables-dockerv6.sh && \
      chmod +x /usr/local/bin/check-iptables.sh

ADD crontabfile /etc/cron.d/iptables-cron
RUN chmod 0644 /etc/cron.d/iptables-cron
RUN crontab /etc/cron.d/iptables-cron

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD cron && tail -f