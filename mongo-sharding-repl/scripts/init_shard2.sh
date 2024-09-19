#!/bin/bash

###
# Инициализация шарда 2.
###

docker compose exec -T mongo_shard2 mongosh --port 27023 <<EOF
rs.initiate(
  {
    _id : "shard2",
    members: [
      { _id : 0, host : "mongo_shard2:27023" },
      { _id : 1, host : "mongo_shard2_r1:27027" },
      { _id : 2, host : "mongo_shard2_r2:27028" },
      { _id : 3, host : "mongo_shard2_r3:27029" }
    ]
  }
)
EOF
