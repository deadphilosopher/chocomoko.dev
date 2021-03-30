#!/usr/bin/env bash
# Execute environment substitution
#envsubst '$WEB_SERVER_PORT' < /etc/nginx/sites-available/default.template > /etc/nginx/sites-available/default
envsubst '$WEB_SERVER_PORT' < /var/tmp/default.template > /etc/nginx/sites-available/default

# Execute commands that are passed
exec "$@"
