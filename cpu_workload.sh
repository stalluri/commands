#!/bin/bash

echo "Start time:"  
date
echo "Hi, I'm sleeping for 2 min..."
sleep 2

function workload {
for (( i=0; i < 300 ; i++))
do
x=$RANDOM
y=$RANDOM
z=($x * $y)
#echo $z
done

}

for ((bigl;bigl<1000;bigl++))
do
# Variable s will be the work time in seconds
for (( s=0; s < 120 ; s++))
do
#echo "For : $s"
workload
sleep 1
done

# Variable no_load_time will be no workload time in seconds
no_load_time=120

#echo "Ending time:"
#date
sleep $no_load_time
done

#echo "Final ending time: "
#date

## Never ending script to create 2 min full cpu workload
#while true
#do
#  sleep 120
#yes > /dev/null &
#sleep 120
#killall yes > /dev/null 2>&1
#done

