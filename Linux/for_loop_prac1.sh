#!/bin/bash

#create list
months=(
     	'january'
	'february'
	'march'
	'april'
	'may'
	'june'
	'july'
	'august'
	'september'
	'october'
	'november'
	'december'
)

days=('mon' 'tues' 'wed' 'thur' 'fri' 'sat' 'sun')
	
#create for loops

#print out month by month
for month in ${months[@]};
do
	echo $month 
done

#print out the days of the week with instructions

for day in ${days[@]};
do
	if [ $day = 'sun' ] || [ $day = 'sat' ]
	then
		echo "It is $day. Take it easy."
	else
		echo "It is $day. Get to work."
	fi
done

#run a command on each file
for file in $(ls);
do
	ls -lah $file
done

#run an operation on each number
for num in {0..5};
do
	if [ $num = 1 ] || [ $num = 4 ]
then
	echo $num
fi
done
