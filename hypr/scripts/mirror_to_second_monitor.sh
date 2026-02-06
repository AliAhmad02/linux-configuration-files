#!/bin/bash
second_monitor="$(~/.config/hypr/scripts/get_second_monitor.sh)" || exit 1

hyprctl keyword monitor "$second_monitor,highres,auto,1, mirror,eDP-1"

