FROM rancher/nginx-ingress-controller:nginx-1.12.1-rancher1
USER root
RUN apk update
RUN apk add lua-resty-openidc
RUN apk add luarocks5.1
RUN luarocks-5.1 install base64
USER www-data