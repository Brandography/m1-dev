#!/usr/bin/env bash
cd ../
source ../../.env

if [ -z "$1" ]
  then
    echo "enter sql file name"
else
    zcat mysqldump/$@ | docker-compose -p $PROJECT_NAME exec -T -u root db mysql -umagento -pmagento magento
    docker-compose -p $PROJECT_NAME exec -T -u root db mysql -umagento -pmagento magento --execute="update core_config_data set value='http://localhost/' where path='web/unsecure/base_url';"
    docker-compose -p $PROJECT_NAME exec -T -u root db mysql -umagento -pmagento magento --execute="update core_config_data set value='http://localhost/' where path='web/secure/base_url';"
    docker-compose -p $PROJECT_NAME exec -T -u root db mysql -umagento -pmagento magento --execute="update core_config_data set value='' where path='web/cookie/cookie_domain';"
fi
