#!/bin/bash
second_monitor="$(~/.config/hypr/scripts/get_second_monitor.sh)" || exit 1

if [[ "$(hyprctl monitors)" =~ "eDP-1" ]]; then
  hyprctl keyword monitor "$second_monitor,highres,auto,1"
  hyprctl keyword monitor "eDP-1,disable"
elif [[ "$(hyprctl monitors)" =~ "$second_monitor" ]]; then
  hyprctl keyword monitor "eDP-1,highres,auto,1.25" 
  hyprctl keyword monitor "$second_monitor,disable"
fi
