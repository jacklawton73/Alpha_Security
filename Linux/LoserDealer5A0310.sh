#!/bin/bash
grep -E '05' 0310_Dealer_schedule | grep -E 'AM' | awk -F" " '{print $1, $2, $5, $6}' >> Dealers_working_during_losses.txt


