#!/bin/sh
cd /home/matthewgerber/Repos/mjpg-streamer/mjpg-streamer-experimental
if test -f streamer.pid; then
    kill `cat streamer.pid`
    rm streamer.pid
else
    nohup ./mjpg_streamer -i "input_uvc.so -fps 30 -r 1280x720 -q 100" -o "./output_http.so -p 8081 -w ./www" &
    echo "$!" > streamer.pid
fi
