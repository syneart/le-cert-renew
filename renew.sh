#!/bin/bash
BIN_PATH=`echo $(dirname $(readlink -f "$0"))`

CONF_NAME=renew_env.config
if [ -e ${BIN_PATH}/${CONF_NAME} ]; then
    source ${BIN_PATH}/${CONF_NAME}
elif [ -e ${BIN_PATH}/../${CONF_NAME} ]; then
    source ${BIN_PATH}/../${CONF_NAME}
else
    echo "Error: Could not find '${CONF_NAME}'!"
    exit 1
fi

echo "DOMAIN_NAME=${DOMAIN_NAME}" > ${BIN_PATH}/bin/.env
echo "LOCAL_LETSENCRYPT_ROOT_PATH=${LOCAL_LETSENCRYPT_ROOT_PATH}" >> ${BIN_PATH}/bin/.env
`sleep 60; sudo docker compose --project-directory ${BIN_PATH}/bin down -v --rmi all;` &
sudo docker compose --project-directory ${BIN_PATH}/bin up
