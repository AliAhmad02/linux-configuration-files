#!/bin/bash
killall -SIGINT wf-recorder

if [ $? -eq 0 ]; then
  notify-send --app-name=wf-recorder --urgency=normal --expire-time=2500 --icon=.config/hypr/assets/video_camera.png "Finished!" "The screen recording was stopped successfully."
fi
