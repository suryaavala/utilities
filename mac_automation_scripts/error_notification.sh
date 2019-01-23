#! /bin/bash

BASE_LOG_DIR="/Users/surya/Logs/cron/"
RELATIVE_FILE_PATH=$1
RECENT_LOG_FILE=$(ls -rt1 "$BASE_LOG_DIR$RELATIVE_FILE_PATH" | tail -1)

ABSOLUTE_LOG="$BASE_LOG_DIR$RELATIVE_FILE_PATH/$RECENT_LOG_FILE"


if ! grep -Fq "COMPLETED SUCCESSFULLY!" $ABSOLUTE_LOG 
then 
	 NOTIFICATION_MESSAGE="$RELATIVE_FILE_PATH has an error during its run! Please check $ABSOLUTE_LOG for details!!"
	  osascript -e 'display notification "'"$NOTIFICATION_MESSAGE"'" with title "Cron ERROR!"'

fi
