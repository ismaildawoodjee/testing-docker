#!/usr/bin/env bash

START_TIME=$(date +"%s")
DATE_TIME=$(date +"%x %r %Z")
echo -e "INFO: Started setup at $DATE_TIME\n"

set -eo pipefail

REPO_NAME="testing-docker"

function initialize_great_expectations () {
    echo -e "INFO: Initializing Great Expectations in the `src` folder.\n"
    
    great_expectations --v3-api -y --config src init
    echo -e "*\nnotebooks\nplugins\n!uncommitted/config_variables.yml" \
        >> "./src/great_expectations/.gitignore"
}

function setup_docker_container () {
    echo -e "INFO: Setting up Docker containers.\n"

    sudo docker-compose up --build -d
}

initialize_great_expectations
setup_docker_container

END_TIME=$(date +"%s")
DURATION=$((END_TIME - START_TIME))
echo "INFO: Completed setup within $DURATION seconds."
