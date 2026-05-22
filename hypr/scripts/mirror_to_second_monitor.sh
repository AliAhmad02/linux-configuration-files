#!/bin/bash
second_monitor="$(~/.config/hypr/scripts/get_second_monitor.sh)" || exit 1

hyprctl eval "hl.monitor({ output = '$second_monitor', mode = 'preferred', position = 'auto', scale=1, mirror = 'eDP-1'})"
