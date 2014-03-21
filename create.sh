#!/bin/bash

function create_extension_folder {
  mkdir "$1"
  cd "$1"

  if [[ $# == 3 ]]
    then
    CHRIMAGE="$3"
  else
    CHRIMAGE=128
    touch "$CHRIMAGE.png"
  fi

  echo "{" > manifest.json
  echo "\"manifest_version\": 2," >> manifest.json
  echo "\"name\": \"$1\"," >> manifest.json
  echo "\"description\": \"Link to $1\"," >> manifest.json
  echo "\"version\": \"1.0\"," >> manifest.json
  echo "\"app\": {" >> manifest.json
  echo "    \"launch\": {" >> manifest.json
  echo "        \"web_url\": \"$2\"" >> manifest.json
  echo "       }" >> manifest.json
  echo "   }," >> manifest.json
  echo "" >> manifest.json
  echo "\"icons\": {" >> manifest.json
  echo "    \"$CHRIMAGE\": \"$CHRIMAGE.png\"" >> manifest.json
  echo "   }" >> manifest.json
  echo "}" >> manifest.json
}

create_extension_folder "$@"
