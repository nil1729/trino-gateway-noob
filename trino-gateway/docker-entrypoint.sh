#!/bin/bash

# set environment variables
echo "setting environment variables"
export PGPASSWORD=$POSTGRES_PASSWORD

# run the init script
echo "running init script"
psql -U $POSTGRES_USER -h $POSTGRES_HOST -d $POSTGRES_DB -f /root/gateway-ha-persistence-postgres.sql

# start the gateway
java \
-Xmx1g \
--add-opens=java.base/java.lang=ALL-UNNAMED \
--add-opens=java.base/java.net=ALL-UNNAMED \
-jar /usr/bin/gateway-ha.jar server /root/gateway-config.yaml


# keep the container running
echo "keeping container running"
tail -f /dev/null
