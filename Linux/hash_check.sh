#!/bin/bash

##apply 256 hash to files in custom script folder or wherever

for file in $(ls ~/Documents/custom_scripts/)
do
  sha256sum $file
done
