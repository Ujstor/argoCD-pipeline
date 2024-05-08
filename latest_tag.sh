#!/bin/bash

eval $(yq e '.docker | to_entries | .[] | "export \(.key)=\(.value)"' config.yml)
eval $(yq e '.github-helm-repo | to_entries | .[] | "export \(.key)=\(.value)"' config.yml)

DOCKER_IMAGE="$DOCKER_HUB_USERNAME/$DOCKER_REPO_NAME"

TAGS=$(curl -s "https://hub.docker.com/v2/repositories/$DOCKER_IMAGE/tags/?page_size=100" | jq -r '.results[].name')

LATEST_TAG=$(echo "$TAGS" | grep -E '^[0-9]+\.[0-9]+\.[0-9]+$' | sort -V | tail -n 1)


create_env_file() {
    cat << EOF > .env
LATEST_TAG=$LATEST_TAG
REPO=$REPO
CHART=$CHART
EOF
}

create_env_file
