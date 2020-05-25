FROM arm32v7/debian:buster

ENV S6_OVERLAY_VERSION=v2.0.0.1

WORKDIR /root

COPY insync-headless /usr/bin/insync-headless

### Install s6 and Insync
RUN set -x && \
    apt-get update && \
    apt-get install -y apt-transport-https ca-certificates gnupg curl bzip2 && \
    
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY install /

ENTRYPOINT ["/init"]
