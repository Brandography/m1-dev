#!/usr/bin/env bash
cd ../
source ../../.env

if [ -z "$1" ]
  then
    echo "enter sql file name"
else
    zcat mysqldump/$@ | docker-compose -p $PROJECT_NAME exec -T -u root db mysql -umagento -pmagento magento
fi