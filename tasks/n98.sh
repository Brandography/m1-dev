#!/usr/bin/env bash
source ../../.env
cd ../docker

docker-compose -p $PROJECT_NAME exec --user www-data magento n98-magerun.phar $@
exit 0