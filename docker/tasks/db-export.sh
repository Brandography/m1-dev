#!/usr/bin/env bash
cd ../
source ../../.env

docker-compose -p $PROJECT_NAME exec -T -u root db mysqldump -umagento -pmagento magento | gzip -c > mysqldump/$(date +%Y-%m-%d-%H.%M.%S).sql.gz