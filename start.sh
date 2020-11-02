#!/bin/sh

#

sed -i "1c :$PORT" /etc/caddy/Caddyfile

tor &

/v2ray -config /v2ray.json &

caddy run --config /etc/caddy/Caddyfile --adapter caddyfile
