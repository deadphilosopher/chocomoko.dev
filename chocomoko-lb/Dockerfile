# Base
FROM debian:buster-slim

# Environment settings
ENV PROXY_PROTOCOL=http PROXY_UPSTREAM=example.com

# Package update, install nginx, and filesystem clean-up
RUN apt-get update \
&& apt-get -y install -y \
gettext-base \
nginx \
&& apt-get clean \
&& apt-get autoremove --purge \
&& rm -rf /var/lib/apt/lists/* 

# Forward request and error logs to Docker
RUN rm /var/log/nginx/access.log && ln -s /dev/stdout /var/log/nginx/access.log
RUN rm /var/log/nginx/error.log && ln -s /dev/stderr /var/log/nginx/error.log

# Copy template configuration
COPY proxy.conf /etc/nginx/sites-available/default.template
COPY configure-vars.sh /

# Expose TCP/80 HTTP
EXPOSE 80

# Configuration and start nginx
ENTRYPOINT ["/configure-vars.sh"]
CMD ["nginx","-g","daemon off;"]
