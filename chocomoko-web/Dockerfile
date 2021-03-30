# Base
FROM debian:buster-slim

# Environment settings
ENV DEBIAN_FRONTEND noninteractive

# Package update, install nginx, and filesystem clean-up
RUN apt-get update \
&& apt-get -y install -y \
gettext-base \
nginx \
&& apt-get clean \
&& apt-get autoremove --purge \
&& rm -rf /var/lib/apt/lists/*

# Content sync
ADD index.html /var/www/html/
ADD assets /var/www/html/assets/
ADD images /var/www/html/images/

# Forward request and error logs to Docker
RUN rm /var/log/nginx/access.log && ln -s /dev/stdout /var/log/nginx/access.log
RUN rm /var/log/nginx/error.log && ln -s /dev/stderr /var/log/nginx/error.log

# Expose TCP/80 HTTP
EXPOSE 8080

# Config 
COPY default-nginx.conf /etc/nginx/sites-available/default
COPY start.sh /

# Start Nginx
#CMD ["nginx","-g","daemon off;"]
ENTRYPOINT ["/start.sh"]
