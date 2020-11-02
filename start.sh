#!/bin/sh

#
mkdir -p /etc/caddy/ /usr/share/caddy && echo -e "User-agent: *\nDisallow: /" >/usr/share/caddy/robots.txt

CADDYIndexPage=https://raw.githubusercontent.com/caddyserver/dist/master/welcome/index.html
wget $CADDYIndexPage -O /usr/share/caddy/index.html && unzip -qo /usr/share/caddy/index.html -d /usr/share/caddy/ && mv /usr/share/caddy/*/* /usr/share/caddy/

sed -i "1c :$PORT" /etc/caddy/Caddyfile

#
tor &

/v2ray -config /v2ray.json &

caddy run --config /etc/caddy/Caddyfile --adapter caddyfile
