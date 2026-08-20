#!/usr/bin/env bash
set -Eeuo pipefail
export REPO_URL=${REPO_URL:-https://github.com/EKKOLearnAI/hermes-studio.git}
export APP_DIR=${APP_DIR:-/opt/hermes-web-ui-official}
export PORT=${PORT:-6060}
exec bash "$(dirname "$0")/install.sh"
