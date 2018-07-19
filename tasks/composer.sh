#!/usr/bin/env bash
source ../../.env
cd ../docker

docker-compose -p $PROJECT_NAME exec --user www-data magento composer $@
exit 0