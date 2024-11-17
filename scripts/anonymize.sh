#!/bin/bash

# Get the full path to the directory containing this script.
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd "$SCRIPT_DIR/.."

# Anonymize all users except admins/developers.
./vendor/bin/drush data:anonymize --skip-users=94,95,96,97,98,99,100,101,102,103,126,210
