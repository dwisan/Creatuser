#!/bin/bash

HOME_PATH="/data/www/student"

if [ -f userlist ]
then
for user in $(cat userlist)
do

PASSWORD=$(cat /dev/urandom | tr -dc "passwordNSR0-9" | fold -w 8 | head -1)

useradd -m -g www-data -d $HOME_PATH/$user $user
echo -e "$PASSWORD\n$PASSWORD\n" | passwd $user

echo "$user Created" 
echo "$user -- $PASSWORD" >> userlist-created

done
else
echo "File userlist not found"
fi
