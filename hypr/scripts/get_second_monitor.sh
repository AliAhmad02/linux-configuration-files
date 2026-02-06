#!/bin/bash

monitor=$(
  hyprctl monitors all \
    | awk '/^Monitor / && /\(ID 1\):/ {print $2}'
)

if [[ -z "$monitor" ]]; then
  echo "Error: monitor with ID 1 not found" >&2
  exit 1
fi

echo "$monitor"
