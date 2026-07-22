#!/usr/bin/env sh
# Shared Hyprlock guard. It intentionally emits no output.
#
# Prefer Hyprland's DPMS state: an open lid does not imply that the panel is
# powered on. On older Hyprland builds that cannot expose monitor JSON, fall
# back to the laptop-lid state.

display_is_active() {
    if command -v hyprctl >/dev/null 2>&1 &&
        command -v jq >/dev/null 2>&1; then
        monitors=$(hyprctl monitors -j 2>/dev/null) || monitors=''

        if [ -n "$monitors" ] &&
            printf '%s\n' "$monitors" |
                jq -e 'type == "array" and length > 0 and any(.[]; has("dpmsStatus"))' \
                    >/dev/null 2>&1; then
            printf '%s\n' "$monitors" |
                jq -e 'any(.[]; .dpmsStatus == true)' >/dev/null 2>&1
            return
        fi
    fi

    # Fallback only when DPMS status is unavailable.
    for lid in /proc/acpi/button/lid/*/state; do
        [ -r "$lid" ] || continue
        grep -Eq 'state:[[:space:]]*open' "$lid" && return 0
    done

    return 1
}
