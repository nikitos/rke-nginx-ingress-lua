FROM registry.k8s.io/ingress-nginx/controller:v1.15.1
USER root
RUN apk update && apk upgrade
RUN apk add libgd luarocks5.1
RUN luarocks-5.1 install base64
RUN luarocks-5.1 install lua-resty-openidc
RUN apk add --no-cache libcap \
  && setcap cap_net_bind_service=+ep /nginx-ingress-controller \
  && setcap -v cap_net_bind_service=+ep /nginx-ingress-controller \
  && apk del libcap
USER www-data