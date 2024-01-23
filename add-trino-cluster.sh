#!/bin/bash

# add trino cluster to gateway
# make sure trino-cluster is accessible from gateway and also from client
curl \
  -H "Content-Type: application/json" \
  -X POST localhost:9080/gateway/backend/modify/add \
  -d '{ "name": "trino-1",
        "proxyTo": "https://docker-trino-1.nilanjandeb.com",
        "active": true,
        "routingGroup": "adhoc"
      }'

curl \
  -H "Content-Type: application/json" \
  -X POST localhost:9080/gateway/backend/modify/add \
  -d '{ "name": "trino-2",
        "proxyTo": "https://docker-trino-2.nilanjandeb.com",
        "active": true,
        "routingGroup": "adhoc"
      }'
