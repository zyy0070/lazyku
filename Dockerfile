FROM alpine:edge

ENV CADDYIndexPage https://raw.githubusercontent.com/caddyserver/dist/master/welcome/index.html

RUN apk update && \
    apk add --no-cache ca-certificates caddy tor && \
    wget -qO- https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip | busybox unzip - && \
    chmod +x /v2ray /v2ctl && \
    mkdir -p /etc/caddy/ /usr/share/caddy && echo -e "User-agent: *\nDisallow: /" >/usr/share/caddy/robots.txt && \
    wget $CADDYIndexPage -O /usr/share/caddy/index.html && unzip -qo /usr/share/caddy/index.html -d /usr/share/caddy/ && mv /usr/share/caddy/*/* /usr/share/caddy/ && \
    rm -rf /var/cache/apk/*

ADD Caddyfile /etc/caddy/Caddyfile
ADD v2ray.json /v2ray.json
ADD start.sh /start.sh
RUN chmod +x /start.sh

CMD /start.sh
