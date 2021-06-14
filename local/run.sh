#!/bin/bash

# Create data directories
mkdir -p vendorA/data/node
cp -r ../shared/irma vendorA/data/node

mkdir -p vendorB/data/node
cp -r ../shared/irma vendorB/data/node

# Start
#cd $(mkfile_dir) && docker-compose pull
TUNNEL_HOST=$(curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"https:..([^"]*).*/\1/p')
AUTH_URL="http://${TUNNEL_HOST}"
NUTS_AUTH_PUBLICURL="${AUTH_URL}" docker-compose up --remove-orphans