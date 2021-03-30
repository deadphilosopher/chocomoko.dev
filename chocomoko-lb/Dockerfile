FROM debian:buster-slim

RUN apt-get update \
&& apt-get -y install -y \
gettext-base \
nginx \
&& apt-get clean \
&& apt-get autoremove --purge \
&& rm -rf /var/lib/apt/lists/* 

RUN rm /var/log/nginx/access.log && ln -s /dev/stdout /var/log/nginx/access.log
RUN rm /var/log/nginx/error.log && ln -s /dev/stderr /var/log/nginx/error.log

ENV PROXY_PROTOCOL=http PROXY_UPSTREAM=example.com

COPY proxy.conf /etc/nginx/sites-available/default.template
COPY start.sh /

CMD ["/start.sh"]

EXPOSE 80
