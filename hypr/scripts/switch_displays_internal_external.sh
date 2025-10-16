#!/bin/bash
if [[ "$(hyprctl monitors all)" =~ "DP-2" ]] && [[ "$(hyprctl monitors)" =~ "eDP-1" ]]; then
  hyprctl keyword monitor "DP-2,highres,auto,1"
  hyprctl keyword monitor "eDP-1,disable"
elif [[ "$(hyprctl monitors)" =~ "DP-2" ]]; then
  hyprctl keyword monitor "eDP-1,highres,auto,1.25" 
  hyprctl keyword monitor "DP-2,disable"
else
  echo "No external monitors connected"
fi
