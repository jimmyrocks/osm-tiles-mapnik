#!/bin/bash

# These all come from tbe environment file
CARTO_DIRECTORY=$CARTO_DIRECTORY
SHARED_DIRECTORY=$SHARED_DIRECTORY

# Shapefile Download
  # Although most of the data used to create the map is directly from the
  # OpenStreetMap data file that you downloaded above, some shapefiles for
  # things like low-zoom country boundaries are still needed. To download and
  # index these:
python "$CARTO_DIRECTORY"/scripts/get-shapefiles.py -d "$SHARED_DIRECTORY"/base_data
