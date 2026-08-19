#!/usr/bin/env bash
set -Eeuo pipefail
REPO_URL=${REPO_URL:-https://github.com/EKKOLearnAI/hermes-studio.git}; APP_DIR=${APP_DIR:-/opt/hermes-web-ui}; PORT=${PORT:-6060}; export REPO_URL APP_DIR PORT
bash "$(dirname "$0")/install.sh"
