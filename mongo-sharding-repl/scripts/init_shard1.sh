#!/bin/bash

###
# Инициализация шарда 1.
###

docker compose exec -T mongo_shard1 mongosh --port 27022 <<EOF
rs.initiate(
  {
    _id : "shard1",
    members: [
      { _id : 0, host : "mongo_shard1:27022" },
      { _id : 1, host : "mongo_shard1_r1:27024" },
      { _id : 2, host : "mongo_shard1_r2:27025" },
      { _id : 3, host : "mongo_shard1_r3:27026" }
    ]
  }
)
EOF
