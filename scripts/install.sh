#!/usr/bin/env bash
set -Eeuo pipefail
APP_DIR=${APP_DIR:-/opt/hermes-web-ui}; PORT=${PORT:-6060}; REPO_URL=${REPO_URL:-https://github.com/qingan123/hermes-web-ui.git}
fail(){ echo "ERROR: $*" >&2; exit 1; }; read_tty(){ local v; IFS= read -r -p "$1" v </dev/tty || fail '需要交互终端'; printf '%s' "$v"; }
[[ $EUID -eq 0 ]] || fail '请使用 root/sudo'; command -v git >/dev/null || fail '缺少 git'; command -v docker >/dev/null || fail '缺少 docker'; docker compose version >/dev/null || fail '需要 Docker Compose v2'
APP_DIR=$(read_tty "目录 [$APP_DIR]: "); APP_DIR=${APP_DIR:-/opt/hermes-web-ui}; PORT=$(read_tty "端口 [$PORT]: "); PORT=${PORT:-6060}; [[ -d "$APP_DIR" && -z "$(find "$APP_DIR" -mindepth 1 -maxdepth 1 -print -quit)" ]] || fail '目录必须为空'; git clone --depth 1 "$REPO_URL" "$APP_DIR"; cd "$APP_DIR"; printf 'PORT=%s\n' "$PORT" > .env; chmod 600 .env; docker compose --env-file .env up -d --build; curl -fsS "http://127.0.0.1:$PORT" >/dev/null
