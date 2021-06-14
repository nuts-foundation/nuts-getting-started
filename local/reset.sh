#!/bin/bash

docker-compose stop
docker-compose rm -v -f

rm -rf vendorA/data/*
echo "{}" > vendorA/data/customers.json

rm -rf vendorB/data/*
echo "{}" > vendorB/data/customers.json