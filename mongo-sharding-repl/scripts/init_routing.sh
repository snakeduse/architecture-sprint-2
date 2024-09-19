#!/bin/bash

###
# Инициализация маршрутизации шардов.
###

# 
docker compose exec -T mongo_router mongosh --port 27021 <<EOF
sh.addShard("shard1/mongo_shard1:27022")
sh.addShard("shard2/mongo_shard2:27023")

sh.enableSharding("somedb")
sh.shardCollection("somedb.helloDoc", { "name" : "hashed" } )
EOF