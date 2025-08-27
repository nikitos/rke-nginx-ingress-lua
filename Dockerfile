FROM registry.k8s.io/ingress-nginx/controller:v1.13.1
USER root
RUN apk update && apk upgrade
RUN apk add openresty-mod-http-lua
RUN apk add nginx-mod-http-headers-more
RUN apk add nginx-mod-stream
RUN apk add libgd
RUN apk add luarocks5.1
RUN luarocks-5.1 install base64
RUN luarocks-5.1 install lua-resty-openidc
RUN cp /usr/sbin/nginx /usr/bin/nginx
RUN mkdir -p /var/tmp/nginx/uwsgi
RUN chown www-data:www-data /var/tmp/nginx/uwsgi
RUN mkdir -p /var/tmp/nginx/scgi
RUN chown www-data:www-data /var/tmp/nginx/scgi
RUN apk add --no-cache libcap \
  && setcap    cap_net_bind_service=+ep /nginx-ingress-controller \
  && setcap -v cap_net_bind_service=+ep /nginx-ingress-controller \
  && setcap    cap_net_bind_service=+ep /usr/bin/nginx \
  && setcap -v cap_net_bind_service=+ep /usr/bin/nginx \
  && setcap    cap_net_bind_service=+ep /usr/sbin/nginx \
  && setcap -v cap_net_bind_service=+ep /usr/sbin/nginx \
  && apk del libcap
USER www-data