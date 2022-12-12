#! /bin/bash

#Get percentage of used inode on /dev/sda1 and put it in "usedinode"
usedinode=$(df -i &> /dev/null | grep '/dev/sda1' | tr -s " " | cut -d " " -f 5 | cut -d "%" -f 1)


if (( $usedinode > 80 )) && [ $USER = "root" ]
then
	# Generate a new archive file and store its path
	tarpath=$(mktmp -p /var/log/exercice/archives/)
fi
