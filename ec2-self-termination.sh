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
        echo "Instance is terminating"
        sudo shutdonw -h now
else
        echo "Evaluation will be done in next iteration again."
fi
