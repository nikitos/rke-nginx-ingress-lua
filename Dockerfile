FROM rancher/nginx-ingress-controller:nginx-1.12.1-rancher1
USER root
RUN apk update
RUN apk add lua-resty-jwt
RUN apk add luarocks5.4
RUN luarocks-5.4 install base64
USER www-data
