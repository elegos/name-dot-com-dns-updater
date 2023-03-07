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

/routine.sh

crond -f -c /appdaemon
