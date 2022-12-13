#! /bin/bash

if [[ ! -z $1 ]] && (( $1 >= 0 ))
then
	maxuse=$(expr 100 - $1)
else
	maxuse=20
fi

#Get percentage of used inode on /dev/sda1 and put it in "usedinode"
unode=$(df -i / | grep / | tr -s " " | cut -d " " -f 5 | cut -d "%" -f 1)

if (( $unode > $maxuse )) && [ $USER = "root" ]
then
	# Create archive dir if not exist
	mkdir -p /var/log/exercice/archives/
	# Generate a new archive file and store its path
	tarpath=$(mktemp -p /var/log/exercice/archives/ -t "archive.XXXXXXXXXX.tar")
	# put everything in recent_log in a tar archive
	tar -cf $tarpath /var/log/exercice/recent_logs
	# Remove all files from recent_logs
	sudo rm -rf /var/log/exercice/recent_logs/
	# Get number of open terminal
	numterm=$(expr $(ls /dev/pts/ | wc -l) - 1)
	for ((i=0 ; i<$numterm ; i++))
	do
        	echo "HODOOOR !!!" > /dev/pts/$i
	done
fi
