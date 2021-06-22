#!/bin/bash

for script in $(ls ~/Documents/custom_scripts)
do
  if [ ! -x ~/Documents/custom_scripts/$script ]
  then 
    chmod +x ~/Documents/custom_scripts/$script
  fi
done
 
