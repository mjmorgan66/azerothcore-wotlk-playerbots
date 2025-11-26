#!/bin/bash

# EDIT .dockerignore and REMOVE references to env folder

# builds project and starts docker compose
#docker compose up -d
#docker compose down
docker compose build

#now build my init image for k3s
DATA_INIT_IMAGE=registry.home/wow/wotlk-env-data-import-playerbots-with-auctionhouse:1.0

docker build . -f Dockerfile-db-init -t $DATA_INIT_IMAGE
#docker push $DATA_INIT_IMAGE

# TODO: manual names/tagging...make variables
# push everything to my repository
docker push registry.home/wow/ac-wotlk-authserver-playerbots-with-auctionhouse:1.0
docker push registry.home/wow/ac-wotlk-worldserver-playerbots-with-auctionhouse:1.0
docker push registry.home/wow/ac-wotlk-client-data-playerbots-with-auctionhouse:1.0
docker push registry.home/wow/wotlk-env-db-import-playerbots-with-auctionhouse:1.0
docker push registry.home/wow/wotlk-env-data-import-playerbots-with-auctionhouse:1.0
docker push registry.home/wow/mysql:8.4 # a default mysql image
