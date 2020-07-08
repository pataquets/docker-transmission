FROM pataquets/ubuntu:bionic

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get -y install transmission-daemon \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "transmission-daemon", "--foreground" ]
CMD [ "--rpc-bind-address=0.0.0.0", "--allowed=*", "--encryption-preferred", "--dht", "--lpd", "--utp", "--portmap" ]
