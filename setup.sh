#!/bin/bash


CERT_NAME="vrerv.com"
WEB_DOMAIN="demo.vrerv.com"
WEB_SERVICE_PORT="3001"

./ssl_cert_generator/root_ca.sh
./ssl_cert_generator/domain.sh $CERT_NAME "*.$CERT_NAME"

mkdir -p ./nginx/conf.d

cp ./nginx-vhost.template.conf ./nginx/conf.d/$WEB_DOMAIN.conf
perl -pi -e "s/#SERVER_NAME#/$WEB_DOMAIN/g" ./nginx/conf.d/$WEB_DOMAIN.conf
perl -pi -e "s/#CERT_NAME#/$CERT_NAME/g" ./nginx/conf.d/$WEB_DOMAIN.conf
perl -pi -e "s/#SERVICE_PORT#/$WEB_SERVICE_PORT/g" ./nginx/conf.d/$WEB_DOMAIN.conf

mkdir -p ./nginx/ssl

cp -va ./$CERT_NAME/$CERT_NAME.crt ./nginx/ssl/
cp -va ./$CERT_NAME/$CERT_NAME.key ./nginx/ssl/
