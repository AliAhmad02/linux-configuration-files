#!/bin/bash

if [[ "$(hyprctl monitors)" =~ "HDMI-A-1" ]] && [[ "$(hyprctl monitors)" =~ "eDP-1" ]]; then
   hyprctl keyword monitor "eDP-1,disable"
elif [[ "$(hyprctl monitors)" =~ "HDMI-A-1" ]]; then
   hyprctl keyword monitor "HDMI-A-1,disable" && hyprctl keyword monitor "eDP-1,1920x1080,auto,1.25" 
else 
   hyprctl reload
   if [[ "$(hyprctl monitors)" =~ "HDMI-A-1" ]]; then
      hyprctl keyword monitor "eDP-1,disable" 
   else
      echo "No external monitors connected"
   fi
fi
