FROM alpine:edge

RUN apk update && \
    apk add --no-cache ca-certificates caddy tor && \
    wget -qO- https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip | busybox unzip - && \
    chmod +x /v2ray /v2ctl && \
    rm -rf /var/cache/apk/*

ADD Caddyfile /etc/caddy/Caddyfile
ADD v2ray.json /v2ray.json
ADD start.sh /start.sh
RUN chmod +x /start.sh

CMD /start.sh
