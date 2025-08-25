FROM rancher/nginx-ingress-controller:nginx-1.12.4-rancher1
USER root
RUN apk update && apk upgrade
RUN apk add lua-resty-openidc
RUN apk add luarocks5.1
RUN apk add nginx-mod-http-image-filter
RUN luarocks-5.1 install base64
USER www-data