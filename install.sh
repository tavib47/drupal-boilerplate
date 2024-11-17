#!/bin/bash

source scripts/utils.sh
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd "$SCRIPT_DIR"

if [[ "$DDEV" == "true"  ]]; then
  ddev start
  ddev composer install
  ddev cghooks update
  ddev exec ./vendor/bin/robo sql:sync
  ddev exec ./vendor/bin/robo site:update
  ddev exec ./vendor/bin/robo site:develop
  ddev launch user
else
  composer install
  cghooks update
  ./vendor/bin/robo sql:sync
  ./vendor/bin/robo site:update
  ./vendor/bin/robo site:develop
fi
