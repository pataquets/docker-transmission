FROM pataquets/ubuntu:xenial

ARG DEBIAN_FRONTEND=noninteractive

RUN \
  apt-get update && \
  apt-get -y install \
    gnupg-curl \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN \
  apt-key adv --keyserver hkps://keyserver.ubuntu.com --recv-keys 365C5CA1 && \
  . /etc/lsb-release && \
  echo "deb http://ppa.launchpad.net/transmissionbt/ppa/ubuntu ${DISTRIB_CODENAME} main" | \
    tee /etc/apt/sources.list.d/transmissionbt.list \
  && \
  apt-get update && \
  apt-get -y install \
    transmission-daemon \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "transmission-daemon", "--foreground" ]
CMD [ "--rpc-bind-address=0.0.0.0", "--allowed=*", "--encryption-preferred", "--dht", "--lpd", "--utp", "--portmap" ]
