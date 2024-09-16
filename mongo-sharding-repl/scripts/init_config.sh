#!/bin/bash

###
# Инициализация сервера конфигурации БД.
###

docker compose exec -T mongo_config_srv mongosh --port 27019 <<EOF
rs.initiate(
  {
    _id : "config_server",
    configsvr: true,
    members: [
      { _id : 0, host : "mongo_config_srv:27019" }
    ]
  }
)
EOF