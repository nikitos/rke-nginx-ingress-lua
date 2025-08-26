FROM registry.k8s.io/ingress-nginx/controller:v1.13.1
USER root
RUN apk update && apk upgrade
RUN apk add openresty-mod-http-lua
RUN apk add nginx-mod-http-headers-more
RUN apk add nginx-mod-stream
RUN apk add luarocks5.1
RUN luarocks-5.1 install base64 lua-resty-openidc
RUN cp /usr/sbin/nginx /usr/bin/nginx
USER www-data