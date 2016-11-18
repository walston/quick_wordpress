#!/bin/bash

echo "Enter a WordPress theme name:"
read name

vers=$(docker-compose -v)
dc_exists=$?

if [[ $dc_exists == 0 ]]; then
  docker-compose up -d
  ln -s $PWD/src/wp-content/plugins $PWD/
  ln -s $PWD/src/wp-content/themes/$name $PWD/
else
  echo "This script relies on docker-compose as a global binary"
fi
