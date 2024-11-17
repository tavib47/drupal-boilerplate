#!/bin/bash

# Get the full path to the directory containing this script.
SCRIPT_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# Colors
red='\033[0;31m'
green='\033[0;32m'
no_color='\033[0m'

# Function to get the arguments from command line
function args()
{
    options=$(getopt --long ddev -- "$@")
    [ $? -eq 0 ] || {
        echo "Incorrect option provided"
        exit 1
    }
    eval set -- "$options"
    while true; do
        case "$1" in
        --ddev)
            DDEV=true
            ;;
        --)
            shift
            break
            ;;
        esac
        shift
    done
}

# Set DDEV to false by default
DDEV=true

# Load .env file
if test -f "$SCRIPT_DIR/../.env"; then
  source .env
fi

# Get the arguments
args $0 "$@"
