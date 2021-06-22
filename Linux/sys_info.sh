#!/usr/bin/env bash

if [ $UID -eq 0 ]
then
   echo "Please do not run this script as root."
   exit
fi

#define variables
output=$HOME/research/sys_info.txt
ip=$(ip addr | head -9 | tail -1 | awk '{print $2}')
execs=$(find /home -type f -perm 777 2> /dev/null)

## define lists to be used later
files=(
  '/etc/shadow'
  '/etc/passwd'
)

commands=(
  'date'
  'uname -a'
  'hostname -s'
)

## create a directory . if it exists 2> /dev/null will prevent error
#mkdir  ~/research 2> /dev/null
if [ ! -d $HOME/research ]
then 
    mkdir $HOME/research
fi

if [ -f $output ]
then  > $output
fi

echo "A Quick System Audit Script" >> $output
#date >> $output
echo "" $output
 #line break instead of echo -e \n
for x in {0..2};
do
  results=$(${commands[$x]})
  echo "Results of " ${commands[$x]} "command: " >> $output
  echo $results >> $output
  echo "" >> $output
done

echo "Machine Type Info:" >> $output
echo $MACHTYPE >> $output
#echo -e "Uname info: $(uname -a) \n" >> $output
#echo -e "IP Info: $(ip addr | head -9 | tail -1 | awk '{print $2}') \n" >> $output
echo  "IP Info:" >> $output
echo -e $ip \n >> $output 
#echo "Hostname: $(hostname -s) " >> $output
echo "DNS Server: " >> $output
cat /etc/resolv.conf | head -7 | tail -2 >> $output
echo ""
echo "Memory Info:" >> $output
free >> $output
echo -e "\nCPU Info: \n" >> $output
lscpu | grep CPU >> $output
echo -e "\nDisc Usage:" >> $output
df -H | head -2 >> $output
echo -e "\nWho is logged in: \n $(who -a)" >> $output
echo -e "\nExec Files:" >> $output
echo $execs >> $output #find /home -type f -perm 777 2> /dev/null >> $output

echo -e "\nTop 10 Processes"\n >> $output
ps aux --sort -%mem | awk '{print $1, $2, $3, $4, $11}' | head -11 >> $output


echo -e "\nPermissions for /etc/shadow and /etc/passwd" >> $output
for file in ${files[@]};
do
  echo "$(ls -l $file)" >> $output
done

## check sudo for users with home directories

for user in $(ls /home)
do
  echo -e "\n$(sudo -lU $user)\n" >> $output
done

# just to see what i have addded to end either comment it out or chng to less
cat $output | tail -20


