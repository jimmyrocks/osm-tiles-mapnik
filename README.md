# Building a tile server based on Ubuntu 16.04

## How to use

### Pre-reqs
Since this project is aiming to be contained within Docker, there isn't much you will need other than [Docker](https://www.docker.com/), [docker-compose](https://docs.docker.com/compose/), and a system that can run Ubuntu based Dockerfiles.

If you are running Ubuntu, and don't have Docker installed, there is a bash script in the "scripts" directory called "install_docker.sh". Running this with 'sudo' will install both Docker and docker-compose.

### Loading the docker-file

This should be quite simple to start with docker-compose, although it may take a while depending on your system at network connection. (Depending on how you have Docker set up, you may need to 'sudo' some of these commands.)

1. Clone the repository
  `git clone https://github.com/jimmyrocks/osm-tiles-mapnik`
2. Navigate into the repo directory
  `cd osm-tiles-mapnik`
3. Build the docker-compose using the command (This may take a while)
  `docker-compose build` 
4. Bring up the docker-compose
  `docker-compose up -d`
5. Run the scripts to load the data into the database and start the tile server
  `bash ./scripts/initialize-server.sh`
6. Navigate your browser to:
   `http://localhost:3000`

### Changing the map data from the sample data
 By default this project uses the US state of Rhode Island, since it is the smallest PBF available within the US. You may want to view different data.
 
1. Find a [.pbf](https://wiki.openstreetmap.org/wiki/PBF_Format) file available for download, possibly from [Geofabrik](http://download.geofabrik.de/).
2. Edit the "tileserver.env" file, change the "SAMPLE_DATASET_URL" variable to the URL for your selected PBF file.
3. Edit the file at "tileserver/site/index.html", and find the Javascript variables "center" and "zoom". Replace these values with values that are relevant to your PDF file.

## Background
This project includes a docker-compose.yml file that pulls together three Dockerfiles:
1. A base PostGIS:10 image (from [mdillon](https://hub.docker.com/r/mdillon/postgis/))
2. A "tools" Dockerfile (based on [Ubuntu 16.04](https://github.com/tianon/docker-brew-ubuntu-core/blob/85822fe532df3854da30b4829c31878ac51bcb91/xenial/Dockerfile)) which takes care of the data transformation tasks at set up
3. A "tileserver" Dockerfile (based on [Ubuntu 16.04](https://github.com/tianon/docker-brew-ubuntu-core/blob/85822fe532df3854da30b4829c31878ac51bcb91/xenial/Dockerfile)) which runs Apache and [mod_tile](https://wiki.openstreetmap.org/wiki/Mod_tile).

The guide that was used to create this process can be found on the [switch2osm.org website](https://switch2osm.org/manually-building-a-tile-server-16-04-2-lts/). Many of the steps that are outlined in that guide have been coding into the Dockerfiles (especially in the tileserver Dockerfile). The tools Dockerfile follows closely to the Dockerfile contained in the [OpenStreetMap Carto Project](https://github.com/gravitystorm/openstreetmap-carto). The differences are mostly changes that were made in order to support PostGIS as well.

