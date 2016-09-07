FROM pataquets/ubuntu:xenial

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get -y install transmission-daemon \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "transmission-daemon", "--foreground", "--rpc-bind-address=0.0.0.0", "--allowed=*" ]
CMD [ "--dht", "--lpd", "--utp", "--portmap", "--download-dir=/data/download", "--watch-dir=/data/watch" ]
