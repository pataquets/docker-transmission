FROM pataquets/ubuntu:xenial

RUN \
  apt-key adv --keyserver hkp://hkps.pool.sks-keyservers.net --recv-keys 365C5CA1 && \
  echo "deb http://ppa.launchpad.net/transmissionbt/ppa/ubuntu xenial main" | \
    tee /etc/apt/sources.list.d/transmissionbt.list \
  && \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get -y install transmission-daemon \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "transmission-daemon", "--foreground" ]
CMD [ "--rpc-bind-address=0.0.0.0", "--allowed=*", "--encryption-preferred", "--dht", "--lpd", "--utp", "--portmap" ]
