# Base
FROM debian:buster-slim

# Environment settings
ENV HTTP_SERVICE_PORT=8080

# Package update, install nginx, and filesystem clean-up
RUN apt-get update \
&& apt-get -y install -y \
gettext-base \
nginx \
&& apt-get clean \
&& apt-get autoremove --purge \
&& rm -rf /var/lib/apt/lists/*

# Copy static content
ADD index.html /var/www/html/
ADD assets /var/www/html/assets/
ADD images /var/www/html/images/

# Forward request and error logs to Docker
RUN rm /var/log/nginx/access.log && ln -s /dev/stdout /var/log/nginx/access.log
RUN rm /var/log/nginx/error.log && ln -s /dev/stderr /var/log/nginx/error.log

# Copy template configuration
COPY static-env-web.conf /var/tmp/default.template
#COPY static-env-web.conf /etc/nginx/sites-available/default.template
COPY configure-vars.sh /

# Expose TCP/80 HTTP
EXPOSE 8080

# Configuration and start nginx
ENTRYPOINT ["/configure-vars.sh"]
CMD ["nginx","-g","daemon off;"]
