# ChocoMoko.dev

Simple Docker based Linux static website

#### About:

The webserver and loadbalancer are both based on debian:buster-slim and utilize Nginx to serve traffic and loadbalance. The site and loadbalancer were built because I wanted to do something fun. Plus a website for our pets is probably the only thing I work on that my wife thinks is remotely interesting. ;)

#### Content:

The site is a fantastic template design in HTML5 by @ajlkn from html5up.net. It serves static content consisting of pictures and captions of our rescue cats and dogs.

Running with `docker-compose`:

`docker-compose build` will build the containers and get everything ready.  

`docker-compose up -d` will run the configuration in the detached mode.  

`docker-compose up` will run the configuration in the attached mode, which will allow you to observe nginx access and error logs from the loadbalancer and web containers.  

`docker-compose up --scale web=2` will scale the web containers while remaining attached.  

`docker-compose down --remove-orphans` will bring everything down and clean up.  

The .env file in the directory containing the `docker-compose.yml` file controls several variables including the default ports for the load balancer and the web server.  


```
PROXY_SERVER_PORT=80
PROXY_PROTOCOL=http
PROXY_UPSTREAM=web:8080
WEB_SERVER_PORT=8080
```
