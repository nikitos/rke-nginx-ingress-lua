FROM registry.k8s.io/ingress-nginx/controller:v1.13.1
USER root
RUN apk update && apk upgrade
RUN apk add lua-resty-openidc
RUN apk add luarocks5.1
RUN apk add nginx-mod-http-image-filter
RUN apk add nginx-mod-http-lua nginx-mod-http-lua-upstream
RUN luarocks-5.1 install base64
RUN cp /usr/sbin/nginx /usr/bin/nginx
USER www-data