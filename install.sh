#!/usr/bin/env bash
set -euo pipefail

APP_NAME="uw-helper"

CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/${APP_NAME}"
TEMPLATE_DIR="${CONFIG_DIR}/templates"
BIN_DIR="${HOME}/.local/bin"

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "[$APP_NAME] Installing..."

# Check dependencies
missing=()
command -v rofi >/dev/null 2>&1 || missing+=("rofi")
command -v xclip >/dev/null 2>&1 || missing+=("xclip")

if [ "${#missing[@]}" -gt 0 ]; then
  echo "[$APP_NAME] Missing dependencies: ${missing[*]}"
  echo "Install with:"
  echo "  sudo apt update && sudo apt install -y rofi xclip"
  exit 1
fi

mkdir -p "$TEMPLATE_DIR"
mkdir -p "$BIN_DIR"

# Install executable
install -m 0755 "$REPO_ROOT/bin/uw-helper" "$BIN_DIR/uw-helper"

# Copy starter templates ONLY if not already present
if [ -d "$REPO_ROOT/templates" ]; then
  shopt -s nullglob
  for src in "$REPO_ROOT"/templates/*; do
    name="$(basename "$src")"
    dest="$TEMPLATE_DIR/$name"
    if [ -e "$dest" ]; then
      echo "[$APP_NAME] Keeping existing template: $dest"
    else
      cp -r "$src" "$dest"
      echo "[$APP_NAME] Installed template: $dest"
    fi
  done
fi

# PATH hint
if ! echo "$PATH" | grep -q "$HOME/.local/bin"; then
  echo
  echo "[$APP_NAME] NOTE: ~/.local/bin is not in your PATH."
  echo "Add this to ~/.bashrc:"
  echo '  export PATH="$HOME/.local/bin:$PATH"'
fi

echo
echo "[$APP_NAME] Done."
echo "Templates folder:"
echo "  $TEMPLATE_DIR"
echo
echo "Next: bind a hotkey in Ubuntu Settings → Keyboard → Custom Shortcuts"
echo "Command: uw-helper"
