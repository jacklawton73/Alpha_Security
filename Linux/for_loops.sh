#!/bin/bash

## list variables

states=(
	'California'
	'Texas'
	'Hawaii' 
	'Colorado' 
	'Indiana'
)

for state in ${states[@]};
do
    if [ $state == "Hawaii" ]
    then
       echo "Hawaii is the best!"
    else
       echo "I'm not fond of $state."
fi
done

# list of variables 0 thru 9

nums=$(echo {0..9})

for num in ${nums[@]};
do
  if [ $num = 3 ] || [ $num = 5 ] || [ $num = 7 ]
  then
    echo "$num"
  fi
done

# output ls line by line
ls_out=$(ls)
for i in ${ls_out[@]};
do
  echo $i
done
