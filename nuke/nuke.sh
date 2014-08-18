#! /usr/local/bin/bash

for i in {1..6}; do
    sleep 0.5;
    clear;
    cat ~/configs/nuke/nuke$i;
done

/sbin/shutdown -p now
