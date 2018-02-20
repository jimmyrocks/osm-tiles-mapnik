#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Creating Mapnik XML File..."
docker-compose exec tools bash /scripts/create_xml.sh

echo "Setting up the Database..."
docker-compose exec tools bash /scripts/setup_database.sh

echo "Creating sample data..."
# TODO: allow this script to override the SAMPLE_DATASET_URL variable so the
# user doesn't need to set it in the env file
docker-compose exec tools bash  /scripts/create_sample_data.sh

echo "Download the basic shapefiles"
docker-compose exec tools bash /scripts/download_shapefiles.sh

echo "Setting up the renderd service"
docker-compose exec tileserver a2enconf mod_tile
docker-compose exec tileserver service apache2 start
docker-compose exec tileserver service apache2 reload
docker-compose exec tileserver service apache2 reload

/bin/bash $DIR/start-server.sh
