#!/usr/bin/env bash
cd ../
source ../../.env

docker-compose -p $PROJECT_NAME exec --user root db bash