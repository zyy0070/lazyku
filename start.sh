#!/bin/sh

# configs
sed -i "1c :$PORT" /etc/caddy/Caddyfile

# start
tor &

/v2ray -config /v2ray.json &

caddy run --config /etc/caddy/Caddyfile --adapter caddyfile