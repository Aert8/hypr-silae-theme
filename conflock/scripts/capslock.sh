#!/usr/bin/env sh
# Emit nothing when disabled so Hyprlock renders no Caps Lock indicator.

. "$(dirname "$0")/display-active.sh"
display_is_active || exit 0

if command -v jq >/dev/null 2>&1 &&
    hyprctl devices -j 2>/dev/null |
        jq -e '.keyboards[]? | select(.capsLock == true or .caps_lock == true)' \
            >/dev/null 2>&1; then
    # U+F023 (Nerd Font lock icon), encoded as portable UTF-8 octal bytes.
    printf '\357\200\243  Caps Lock\n'
    exit 0
fi

# Text fallback for Hyprland builds which do not publish caps state in JSON.
if hyprctl devices 2>/dev/null | grep -Eqi 'caps[[:space:]_-]*lock:[[:space:]]*(yes|true|on)'; then
    printf '\357\200\243  Caps Lock\n'
fi
