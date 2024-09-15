#!/bin/bash

###
# Инициализация шарда 1.
###

docker compose exec -T mongo_shard1 mongosh --port 27022 <<EOF
rs.initiate(
    {
      _id : "shard1",
      members: [
        { _id : 0, host : "mongo_shard1:27022" }
      ]
    }
)
EOF