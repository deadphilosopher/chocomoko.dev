#!/usr/bin/env bash
# Execute environment substitution
envsubst '$PROXY_SERVER_PORT,$PROXY_PROTOCOL,$PROXY_UPSTREAM' < /etc/nginx/sites-available/default.template > /etc/nginx/sites-available/default

# Execute commands that are passed
exec "$@"
