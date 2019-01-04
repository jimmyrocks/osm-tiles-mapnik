FROM ubuntu:16.04
MAINTAINER jimmyrocks

# Based on documentation from: https://switch2osm.org/manually-building-a-tile-server-16-04-2-lts/

# Stylesheet configuration
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
      git \
      lsb-release \
      mapnik-utils \
      nodejs \
      npm \
      osm2pgsql \
      wget \
    && rm -rf /var/lib/apt/lists/*

# Set up the psql 10 client
RUN wget -q https://www.postgresql.org/media/keys/ACCC4CF8.asc -O - | apt-key add -
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list

RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
      postgresql-client-10 \
    && rm -rf /var/lib/apt/lists/*

# Install the latest stable version of nodejs
RUN npm install -g n && \
    n stable && \
    ln -sf $(n bin stable) /usr/bin/node

RUN mkdir -p /src && \
    mkdir -p /mnt && \
    git clone git://github.com/gravitystorm/openstreetmap-carto.git /src/openstreetmap-carto && \
    cd /src/openstreetmap-carto && \
    npm install -g carto && \
    npm install -g http-server
