#!/bin/bash


# Run loop 50 times

for ((i=0;i<50;i++))
do

# Run workload for 150 seconds
timeout 150 dd if=/dev/zero of=/dev/null

# Sleep for 150 seconds
sleep 150

done
