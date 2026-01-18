![License](https://img.shields.io/badge/License-Apache%202.0-yellow)

This is a tiny text template picker that initally was designed for Upwork proposal messages. But I plan to develop and evolve it for other day-to-day tasks. I also plan to add variable support for templates. It works on Ubuntu (X11). It uses `rofi` for the UI and `xclip` for clipboard copy.

## Basically all it does:
- Hotkey -> rofi menu -> pick or manage a template -> copied to clipboard

## Notes
- Templates live in: `~/.config/uw-helper/templates/`
- Command installed to: `~/.local/bin/uw-helper`

## Requirements
- Ubuntu on X11 (Wayland is not supported -> could be, if wofi is used instead)
- rofi
- xclip
- Optional editor: set `UW_HELPER_EDITOR` or `EDITOR` to control how files open

## Install
```bash
sudo apt update
sudo apt install -y rofi xclip
make install
```

This installs `uw-helper` to `~/.local/bin` and seeds starter templates into `~/.config/uw-helper/templates/`.

## Usage
Run from a terminal or bind to a hotkey:
```bash
uw-helper
```

Rofi presents four actions:
- Copy template
- Edit template
- Delete template (with confirmation)
- New template (creates the file and opens it in your editor)

Templates are plain `.txt` or `.md` files. You can also manage files directly in:
`~/.config/uw-helper/templates/`.

## Hotkey (Ubuntu)
1. Open Settings -> Keyboard -> Keyboard Shortcuts.
2. Scroll to the bottom and click "Add Custom Shortcut".
3. Name: `uw-helper`
4. Command: `uw-helper`
5. Choose a keybinding

### Editor selection
The app uses this order:
1. `UW_HELPER_EDITOR`
2. `EDITOR`
3. `xdg-open` (default GUI editor)

Example:
```bash
export UW_HELPER_EDITOR="code --wait"
```

## Uninstall
```bash
make uninstall
```

## Reinstall
```bash
make reinstall
```

By default, templates are kept at `~/.config/uw-helper/`.
