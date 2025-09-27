#!/bin/bash

SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd "$SCRIPT_DIR/.."

source scripts/utils.sh

preCommand=$([ "$DDEV" == "true" ] && echo "ddev exec" || echo "")

rm -rf web/core web/modules/contrib web/themes/contrib web/libraries vendor
bash -c "$preCommand composer install"
bash -c "$preCommand ./vendor/bin/drush cr"
bash -c "$preCommand ./vendor/bin/robo site:update"
