#!/bin/bash

# set defaults
LOGFILE="/var/log/speedtest/speedtest_$(date +'%Y%m%d%H%M%S').csv"
DELAY=600 #10 mins
CYCLE=300 #5 mins

START_TIME="$(date -u +'%s')"
/usr/bin/speedtest-cli --csv --csv-delimiter '|' > $LOGFILE
sleep 1

while true;
do
   while true;
   do
      CURR_TIME="$(date -u +'%s')"
      ELAPSED_TIME="$(($CURR_TIME-$START_TIME))"
      if [[ $ELAPSED_TIME<=$CYCLE ]]
      then
         /usr/bin/speedtest-cli --csv --csv-delimiter '|' >> $LOGFILE
         sleep 1
      else
         break
      fi
   done
   sleep $DELAY
   START_TIME="$(date -u +%s)"
done

