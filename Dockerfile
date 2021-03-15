# Base
FROM ubuntu:latest
# Environment settings
ENV DEBIAN_FRONTEND noninteractive
# Package update
RUN apt-get update
# Install Nginx
RUN apt-get install nginx -y
# Content sync
ADD index.html /var/www/html/
ADD assets /var/www/html/assets/
ADD images /var/www/html/images/
# Expose TCP/80 HTTP
EXPOSE 80
# Run Nginx to serve content
CMD ["nginx","-g","daemon off;"]
