#! /bin/bash

#Get percentage of used inode on /dev/sda1 and put it in "usedinode"
unode=$(df -i | grep '/dev/sda1' | tr -s " " | cut -d " " -f 5 | cut -d "%" -f 1)

if (( $unode > 20 )) && [ $USER = "root" ]
then
	# Create archive dir if not exist
	mkdir -p /var/log/exercice/archives/
	# Generate a new archive file and store its path
	tarpath=$(mktemp -p /var/log/exercice/archives/ -t "archive.XXXXXXXXXX.tar")
	# put everything in recent_log in a tar archive
	tar -cf $tarpath /var/log/exercice/recent_logs/* && sudo rm -f /var/log/exercice/recent_logs/*
        echo "HODOOOR !!!"

fi
