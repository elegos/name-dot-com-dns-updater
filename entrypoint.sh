#!/usr/bin/env sh

if [ -z ${NAME_DOT_COM_USERNAME} ]; then
    echo "Please set NAME_DOT_COM_USERNAME first"
    exit 1
elif [ -z ${NAME_DOT_COM_TOKEN} ]; then
    echo "Please set NAME_DOT_COM_TOKEN first"
    exit 2
elif [ -z ${DOMAIN_NAME} ]; then
    echo "Please set DOMAIN_NAME first"
    exit 3
elif [ -z ${DOMAIN_NAME_HOST} ]; then
    echo "Please set DOMAIN_NAME_HOST first"
    exit 4
fi

echo "NAME_DOT_COM_USERNAME=${NAME_DOT_COM_USERNAME}" > /appdaemon/.env
echo "NAME_DOT_COM_TOKEN=${NAME_DOT_COM_TOKEN}" >> /appdaemon/.env
echo "DOMAIN_NAME=${DOMAIN_NAME}" >> /appdaemon/.env
echo "DOMAIN_NAME_HOST=${DOMAIN_NAME_HOST}" >> /appdaemon/.env

/routine.sh
yacron -c /appdaemon/yacron.yml
