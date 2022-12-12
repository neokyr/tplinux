#! /bin/bash

readonly LOG_PATH="/var/log/exercice/recent_logs"

# We verify first that user gave a positive number
if (( $1 > 0 )) && [ $USER = "root" ]
then
	#create log dir if don't exist
	mkdir -p $LOG_PATH

	for (( i=0 ; i<$1 ; i++))
	do
		#create a unique logfile and save its full path in "logfile"
		logfile=$(mktemp -p $LOG_PATH)
		#get 10 first bytes of /dev/random and put them in the logfile
		head -c 10 /dev/random > $logfile
	done
else
	echo "Veuillez fournir un nombre positif en parametre et utiliser sudo"
fi
