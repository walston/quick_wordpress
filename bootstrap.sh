#!/bin/bash

echo "Enter a WordPress theme name:"
read name

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
vers=$(docker-compose -v)
dc_exists=$?

if [[ $dc_exists == 0 ]]; then
  docker-compose up -d
  ln -s $DIR/src/wp-content/plugins $DIR/
  mkdir $DIR/src/wp-content/themes/$name
  ln -s $DIR/src/wp-content/themes/$name $DIR/
else
  echo "This script relies on docker-compose as a global binary"
fi
