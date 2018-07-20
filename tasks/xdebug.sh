#!/usr/bin/env bash
source ../../.env
cd ../docker

docker-compose -p $PROJECT_NAME exec --user root magento xdebug
exit 0