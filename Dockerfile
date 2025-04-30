FROM rancher/nginx-ingress-controller:nginx-1.12.1-rancher1
USER root
RUN apk update
RUN apk add lua-resty-jwt
RUN apk add luarocks5.4
RUN luarocks-5.4 install base64
USER www-data
RUN |4 TARGETARCH=amd64 VERSION=nginx-1.12.1-rancher1 COMMIT_SHA=git-909e7ff86
ENTRYPOINT ["/usr/bin/dumb-init" "--"]
CMD ["/nginx-ingress-controller"]
