#!/bin/bash

##create a script to do a tar backup of home to var/backups/##

tar cvvWf /var/backups/home.tar /home >> /var/backups/home.txt
ls -lah /var/backups >> /var/backups/file_report.txt
##shows permissions, all files, humanreadable##
free -h >> /var/backups/disk_report.txt
## free disk space humanreadable##

