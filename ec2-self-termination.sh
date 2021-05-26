#!/bin/bash
fileName=/opt/rh-sso/deployment.war
interval=259200 # 3days in seconds
echo "Starting.."
lastUpdatedEpochTime=`stat -c "%Y" $fileName`
currentEpochTime=`date "+%s"`
difference=`expr $currentEpochTime - $lastUpdatedEpochTime`
echo "Difference is $difference"
if [ $difference -gt $interval ]
then
        echo "instance is terminating"
        sudo shutdonw -h now
else
        echo "nothing happend"
fi
