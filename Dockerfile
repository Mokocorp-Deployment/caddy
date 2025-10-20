ARG CADDY_VERSION=2.10.2

FROM caddy:${CADDY_VERSION}-builder-alpine AS builder

RUN xcaddy build

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/mholt/caddy-l4 \
    --with github.com/lucaslorentz/caddy-docker-proxy

FROM caddy:${CADDY_VERSION}-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy