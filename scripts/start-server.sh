#!/bin/bash

echo "Starting renderd"
docker-compose exec tileserver renderd -f -c /usr/local/etc/renderd.conf
