#!/usr/bin/env sh
# Hyprland's JSON output exposes the active keymap of the main keyboard.

. "$(dirname "$0")/display-active.sh"
display_is_active || exit 0

layout=''
if command -v jq >/dev/null 2>&1; then
    layout=$(hyprctl devices -j 2>/dev/null | jq -r '
        .keyboards
        | map(select(.main == true)) + .
        | .[0].active_keymap // empty
    ' 2>/dev/null | head -n 1)
fi

# Fallback for older Hyprland versions without JSON or the `main` property.
if [ -z "$layout" ]; then
    layout=$(hyprctl devices 2>/dev/null |
        awk -F': ' '/active keymap:/ {print $2; exit}')
fi

[ -n "$layout" ] || exit 0

case $(printf '%s' "$layout" | tr '[:upper:]' '[:lower:]') in
    us|english*) printf 'US\n' ;;
    latam|latin*|es-419|"spanish (latin american)") printf 'LATAM\n' ;;
    es|spanish*) printf 'ES\n' ;;
    *) printf '%s\n' "$layout" | tr '[:lower:]' '[:upper:]' | cut -c1-12 ;;
esac
