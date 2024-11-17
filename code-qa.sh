#!/bin/bash

source scripts/utils.sh
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd "$SCRIPT_DIR"

preCommand=$([ "$DDEV" == "true" ] && echo "ddev exec" || echo "")
status=0

# PHPCS
echo "Running PHPCS..."
bash -c "$preCommand ./vendor/bin/phpcs --standard=Drupal,DrupalPractice --extensions=php,module,inc,install,profile,theme,test,info,yml ./web/modules/custom/"
if [ $? -ne 0 ]; then
  echo -e "${red}PHPCS found issues in custom modules.${no_color}"
  status=1
fi
bash -c "$preCommand ./vendor/bin/phpcs --standard=Drupal,DrupalPractice --extensions=php,module,inc,install,profile,theme,test,info,yml --ignore=node_modules ./web/themes/custom/"
if [ $? -ne 0 ]; then
  echo -e "${red}PHPCS found issues in custom themes.${no_color}"
  status=1
fi

# PHP Code Beautifier and Fixes
echo "Running PHPCBF..."
bash -c "$preCommand ./vendor/bin/phpcbf --standard=Drupal,DrupalPractice --extensions=php,module,inc,install,profile,test,info,yml ./web/modules/custom/"
if [ $? -ne 0 ]; then
  echo -e "${red}PHPCBF encountered an error on custom modules.${no_color}"
  status=1
fi
bash -c "$preCommand ./vendor/bin/phpcbf --standard=Drupal,DrupalPractice --extensions=php,module,inc,install,profile,theme,test,info,yml --ignore=node_modules ./web/themes/custom/"
if [ $? -ne 0 ]; then
  echo -e "${red}PHPCBF encountered an error on custom themes.${no_color}"
  status=1
fi

if [ $status -ne 0 ]; then
  echo -e "${red}Code checks failed.${no_color}"
  exit 1
else
  echo -e "${green}Code checks passed.${no_color}"
fi