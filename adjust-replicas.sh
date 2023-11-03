#!/bin/bash

source "${GITHUB_ACTION_PATH}/util.sh"

# Fail on non-zero exit
set -e

echo "SELECTOR=$SELECTOR" >> $GITHUB_ENV
yq e ".replicas[] |= select(.name == \"$SELECTOR\").count = ${REPLICAS}" -i env/${ENVIRONMENT}/${SERVICE_NAME}/kustomization.yaml
