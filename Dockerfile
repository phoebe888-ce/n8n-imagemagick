FROM n8nio/n8n:1.105.4

USER root
RUN apt-get update && apt-get install -y imagemagick
USER node