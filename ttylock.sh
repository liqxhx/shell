#!/bin/bash

#trap SIGINT SIGQUIT SIGTERM
#trap "nice_try" 2 3 15
trap "nice_try" 2 3


nice_try(){
	echo -e "\nNice try,the terminal stays locked"
}

TTY=`tty`

echo -n "Enter your password to lock the $TTY:"

#hedden echo password
stty -echo

read PASSWORD
echo -e "\n"
echo -n "Enter your password to unlock $TTY:"

while :
do
	read RESPONSE
	if [ $PASSWORD = $RESPONSE ];
		then
			echo "unlocking..."
			break
	fi
	clear
	echo "wrong password,terminal still locked!!!"
	echo -n "Enter your password to unlock $TTY:"
	
done
stty echo

