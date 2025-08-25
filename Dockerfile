FROM n8nio/n8n:1.105.4

USER root
RUN apk update && apk add --no-cache imagemagick

USER node
