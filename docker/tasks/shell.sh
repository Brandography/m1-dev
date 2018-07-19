#!/usr/bin/env bash
cd ../
source ../../.env
if [ -z "$1" ]
  then
    docker-compose -p $PROJECT_NAME exec --user www-data magento bash
else
    docker-compose -p $PROJECT_NAME exec --user $@ magento bash
fi