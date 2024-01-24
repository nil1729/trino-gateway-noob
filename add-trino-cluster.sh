#!/bin/bash

# add trino cluster to gateway
# make sure trino-cluster is accessible from gateway and also from client
curl \
  -H "Content-Type: application/json" \
  -X POST localhost:9080/gateway/backend/modify/add \
  -d '{ "name": "trino-1",
        "proxyTo": "http://trino-cluster-1:8080",
        "active": true,
        "routingGroup": "adhoc"
      }'

curl \
  -H "Content-Type: application/json" \
  -X POST localhost:9080/gateway/backend/modify/add \
  -d '{ "name": "trino-2",
        "proxyTo": "http://trino-cluster-2:8080",
        "active": true,
        "routingGroup": "adhoc"
      }'
