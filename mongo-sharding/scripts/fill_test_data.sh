#!/bin/bash

###
# Наполнение БД тестовыми данными.
###

# 
docker compose exec -T mongo_router mongosh --port 27021 <<EOF
use somedb
for(var i = 0; i < 1000; i++) db.helloDoc.insert({age:i, name:"ly"+i})
db.helloDoc.countDocuments()
EOF