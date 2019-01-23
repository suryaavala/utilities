#! /bin/bash

CYCLE_COUNT=$(system_profiler SPPowerDataType | grep 'Cycle Count' | cut -d : -f 2)
NOTIFICATION_MESSAGE="$CYCLE_COUNT cycles have been used by the battery"
osascript -e 'display notification "'"$NOTIFICATION_MESSAGE"'" with title "'"$CYCLE_COUNT"' - Battery Cycles!"'
