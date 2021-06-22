#!/bin/bash

# Search each user's home directory for scripts and provide a formatted output.

for user in $(ls /home)
do   
    for item in $(find /home/$user -iname '*.sh')
    do
        echo -e "Found a script in $user's home folder! \n$item"
    done
done

