FROM nginx:$NGINX_IMAGE_VERSION

WORKDIR /
COPY docker-entrypoint.sh        /
COPY check-ip.sh /usr/local/bin/
COPY ip-docker.sh /usr/local/bin/
RUN  chmod +x /docker-entrypoint.sh && \
        chmod +x /usr/local/bin/check-ip.sh && \
        chmod +x /usr/local/bin/ip-docker.sh

ADD crontabfile /etc/cron.d/ip-cron
RUN cat /etc/cron.d/ip-cron >> /etc/crontabs/root

ENTRYPOINT ["/docker-entrypoint.sh"]