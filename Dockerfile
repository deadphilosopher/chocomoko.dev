FROM ubuntu:latest
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update
RUN apt-get install nginx -y
ADD index.html /var/www/html/
ADD assets /var/www/html/assets/
ADD images /var/www/html/images/
EXPOSE 80
CMD ["nginx","-g","daemon off;"]
