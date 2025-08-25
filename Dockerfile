FROM n8nio/n8n:1.107.4

USER root

RUN apk update && \
    apk add --no-cache imagemagick bash && \
    ln -sf /usr/bin/magick /usr/local/bin/convert || true && \
    ln -sf /usr/bin/convert /usr/local/bin/magick || true

USER node
