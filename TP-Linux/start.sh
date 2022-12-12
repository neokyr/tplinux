#! /bin/bash


echo "*/1 * * * * root '$PWD/log.sh 1000'" >> /etc/cron
echo "*/10 * * * * root $PWD/hodor.sh" >> /etc/cron

