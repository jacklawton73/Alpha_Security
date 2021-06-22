#!/bin/bash
# check free memory in human readable format
free -h > ~/backups/freemem/free_mem.txt
# check disk usage in human readable format
du -h > ~/backups/diskuse/disk_usage.txt
# Lists all open files  Can use -u username for specifics
lsof /dev/null > ~/backups/openlist/open_list.txt
# prints free disk space
df -h > ~/backups/freedisk/free_disk.txt
