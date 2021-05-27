#!/bin/bash
fileName=/opt/rh-sso/deployment.war
scriptAbsolutePath=`realpath $0`
echo "Starting.."
lastUpdatedEpochTime=`stat -c "%Y" $fileName`
currentEpochTime=`date "+%s"`
difference=`expr $currentEpochTime - $lastUpdatedEpochTime`
nextJobMinutes=`expr $difference % 60`
echo "Difference is $difference"
if [ $difference -gt $interval ]
then
        echo "Instance is terminating"
        sudo shutdonw -h now
else
        echo "Scheduling job for next iteration"
        at + $nextJobMinutes minutes <<< sh $scriptAbsolutePath
fi
