#!/bin/bash

###
# Инициализация шарда 2.
###

docker compose exec -T mongo_shard2 mongosh --port 27023 <<EOF
rs.initiate(
    {
      _id : "shard2",
      members: [
        { _id : 0, host : "mongo_shard2:27023" }
      ]
    }
)
EOF
