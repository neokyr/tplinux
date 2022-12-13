#! /bin/bash

echo "* * * * * sudo bash $PWD/log.sh 1000'" | crontab -u root -
(crontab -u root -l ; echo "*/10 * * * * sudo bash $PWD/hodor.sh") | crontab -u root -

