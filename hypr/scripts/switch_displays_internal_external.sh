#!/bin/bash
second_monitor="$(~/.config/hypr/scripts/get_second_monitor.sh)" || exit 1

if [[ "$(hyprctl monitors)" =~ "eDP-1" ]]; then
  hyprctl eval "hl.monitor({ output = '$second_monitor', mode = 'preferred', position = 'auto', scale=1 })"
  hyprctl eval "hl.monitor({ output = 'eDP-1', disabled = true })"
elif [[ "$(hyprctl monitors)" =~ "$second_monitor" ]]; then
  hyprctl eval "hl.monitor({ output = 'eDP-1', mode = 'preferred', position = 'auto', scale=1.25 })"
  hyprctl eval "hl.monitor({ output = '$second_monitor', disabled = true })"
fi
