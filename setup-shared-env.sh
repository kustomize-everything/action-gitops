#!/bin/bash

source "${GITHUB_ACTION_PATH}/util.sh"

# Fail on non-zero exit
set -e

echo "BRANCH_NAME=adjust-replicas-${{ env.SELECTOR }}-$(date +'%Y%m%d%H%M%S')" >> $GITHUB_ENV
