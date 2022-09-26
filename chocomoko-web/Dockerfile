# Base
# FROM nginx:stable
FROM sha256:c79f4fe604e3fe77cb5142e9747da3132d252af21fbb9a9d294fa2128499a8f1

# Copy static content
ADD index.html /usr/share/nginx/html/
ADD assets /usr/share/nginx/html/assets/
ADD images /usr/share/nginx/html/images/

# Forward request and error logs to Docker
RUN rm /var/log/nginx/access.log && ln -s /dev/stdout /var/log/nginx/access.log
RUN rm /var/log/nginx/error.log && ln -s /dev/stderr /var/log/nginx/error.log

# Copy template configuration
COPY exec.sh /

# Expose TCP/80 HTTP
EXPOSE 8080

# Healthcheck
HEALTHCHECK --interval=15s --timeout=5s --retries=2 \
  CMD curl --fail http://localhost:8080/index.html || exit 1

# Configuration and start nginx
ENTRYPOINT ["/exec.sh"]
CMD ["nginx","-g","daemon off;"]
