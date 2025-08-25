FROM n8nio/n8n:debian

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends imagemagick && \
    rm -rf /var/lib/apt/lists/* && \
    ln -sf /usr/bin/magick /usr/local/bin/convert || true && \
    ln -sf /usr/bin/convert /usr/local/bin/magick || true

USER node
