FROM n8nio/n8n:1.107.4

USER root

# 在 Debian/Ubuntu 用 apt，在 Alpine 用 apk
RUN set -eux; \
    if command -v apt-get >/dev/null 2>&1; then \
        apt-get update && \
        apt-get install -y --no-install-recommends imagemagick && \
        rm -rf /var/lib/apt/lists/*; \
    else \
        apk update && \
        apk add --no-cache imagemagick; \
    fi

# 有些发行只提供 magick 或只提供 convert；两者都尝试创建一下软链接，忽略失败
RUN set -eux; \
    if command -v magick >/dev/null 2>&1; then ln -sf "$(command -v magick)" /usr/local/bin/convert || true; fi; \
    if command -v convert >/dev/null 2>&1; then ln -sf "$(command -v convert)" /usr/local/bin/magick || true; fi

USER node
