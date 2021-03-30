# ChocoMoko.dev

Simple Docker based Linux static website

About:

The webserver and loadbalancer are both based on debian:buster-slim and utilize Nginx to serve traffic and loadbalance. The site and loadbalancer were built because I was bored sitting on meetings all day and wanted to do something fun with a computer that would not drive me crazy. Plus it's one of the only things I work on that my wife thinks is remotely fun or interesting.

Content:

The site is a fantastic template design in HTML5 by @ajlkn from html5up.net. It serves static content consisting of pictures and captions of our rescue cats and dogs.

Running with `docker-compose`:

The .env file in the directory containing the `docker-compose.yml` file controls several variables including the default ports for the load balancer and the web server.


```
PROXY_SERVER_PORT=80
PROXY_PROTOCOL=http
PROXY_UPSTREAM=web:8080
WEB_SERVER_PORT=8080
```

