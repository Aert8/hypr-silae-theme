#!/usr/bin/env sh
# Prints the first available battery capacity, for example: 69%

. "$(dirname "$0")/display-active.sh"
display_is_active || exit 0

for battery in /sys/class/power_supply/BAT*; do
    [ -r "$battery/capacity" ] || continue
    capacity=$(tr -cd '0-9' < "$battery/capacity")
    [ -n "$capacity" ] && printf '%s%%\n' "$capacity" && exit 0
done

exit 0
