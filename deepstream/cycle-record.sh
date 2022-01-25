#!/bin/bash

DIR="/home/ryan-bike/Projects/cycle-blindspot-detection/deepstream/streams/cycle-example-"
FILE_NUM=$(ls /home/ryan-bike/Projects/cycle-blindspot-detection/deepstream/streams/ | wc -l)
FILENAME=${DIR}${FILE_NUM}".mp4"

gst-launch-1.0 nvarguscamerasrc sensor_mode=2 ! 'video/x-raw(memory:NVMM),width=1920, height=1080, framerate=30/1, format=NV12' ! nvv4l2h265enc bitrate=8000000 ! h265parse ! qtmux ! filesink location=${FILENAME} -e

