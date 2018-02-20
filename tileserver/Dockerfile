FROM ubuntu:16.04
MAINTAINER jimmyrocks

# Based on documentation from: https://switch2osm.org/manually-building-a-tile-server-16-04-2-lts/

# Build Pre-reqs
# and mapnik
# an fonts
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
      apache2 \
      apache2-dev \
      autoconf \
      automake \
      build-essential \
      fonts-dejavu-core \
      fonts-hanazono \
      fonts-noto-cjk \
      fonts-noto-hinted \
      fonts-noto-unhinted \
      gdal-bin \
      git-core \
      libagg-dev \
      libboost-all-dev \
      libbz2-dev \
      libcairo-dev \
      libcairomm-1.0-dev \
      libfreetype6-dev \
      libgdal-dev \
      libgdal1-dev \
      libgeos++-dev \
      libgeos-dev \
      libgeotiff-epsg \
      libicu-dev \
      liblua5.1-dev \
      liblua5.2-dev \
      libmapnik-dev \
      libpng12-dev \
      libpq-dev \
      libproj-dev \
      libprotobuf-c0-dev \
      libtiff5-dev \
      libtool \
      libxml2-dev \
      lua5.1 \
      mapnik-utils \
      munin \
      protobuf-c-compiler \
      python-mapnik \
      ttf-unifont \
      vim \
    && rm -rf /var/lib/apt/lists/*

# Install mod tile
RUN mkdir -p /src && \
    mkdir -p /var/run/renderd && \
    mkdir -p /var/lib/mod_tile && \
    git clone git://github.com/SomeoneElseOSM/mod_tile.git /src/mod_tile && \
    cd /src/mod_tile && \
    ./autogen.sh && \
    ./configure && \
    make && \
    make install && \
    make install-mod_tile && \
    ldconfig

# The guide says to reload apache twice
# https://switch2osm.org/manually-building-a-tile-server-16-04-2-lts/
# RUN a2enconf mod_tile && \
    # service apache2 reload && \
    # service apache2 reload
