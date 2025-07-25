#!/bin/bash
cd ~/Pictures/Recordings
filename=$( date '+%F_%H:%M:%S.mp4' )
wf-recorder --audio=alsa_output.pci-0000_07_00.6.HiFi__Speaker__sink.monitor --file=${filename} -g "$(slurp -b '#000000b0' -c '#00000000')"
