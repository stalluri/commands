#!/bin/bash

# Load factor is 30%
export LOAD=0.3

while true
     do yes > /dev/null &
     sleep $LOAD
     killall yes
     sleep `echo "1 - $LOAD" | bc`
done
