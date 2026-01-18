#!/usr/bin/env bash
set -euo pipefail

APP_NAME="uw-helper"
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/${APP_NAME}"
BIN_PATH="${HOME}/.local/bin/uw-helper"

echo "[$APP_NAME] Uninstalling..."

if [ -f "$BIN_PATH" ]; then
  rm -f "$BIN_PATH"
  echo "[$APP_NAME] Removed: $BIN_PATH"
else
  echo "[$APP_NAME] Not found: $BIN_PATH"
fi

echo
echo "[$APP_NAME] Templates are kept by default:"
echo "  $CONFIG_DIR"
echo "If you want to remove them too:"
echo "  rm -rf \"$CONFIG_DIR\""

echo "[$APP_NAME] Done."
