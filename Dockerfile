# docker build -t nginx-rtmp:test . && docker run --rm -it -p 10000:1935 -p 10001:80 nginx-rtmp:test

FROM bitnami/minideb:latest AS base
RUN apt update -y
RUN apt install libnginx-mod-rtmp -y

FROM base as configured
COPY nginx.conf /etc/nginx/nginx.conf

FROM configured as site
WORKDIR /var/www
COPY www/html html/
RUN mkdir temp

# Expose the RTMP and HTTP ports
EXPOSE 1935
EXPOSE 80

# Use this entrypoint for running in the background
#ENTRYPOINT ["/usr/sbin/nginx"]

# Use this entrypoint to run in docker via a console and wait for nginx to quit or ctrl-C
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"]

# Use this entrypoint for testing via a shell
#ENTRYPOINT ["/bin/sh"]
