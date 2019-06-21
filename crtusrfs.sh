#!/bin/bash

HOME_PATH="/data/www/student"

if [ -f userlist-created ]
then

while IFS=" " read -r USER PASSWORD; do   

useradd -m -g www-data -d $HOME_PATH/$USER $USER 
echo -e "$PASSWORD\n$PASSWORD\n" | passwd $USER 

done < userlist-created
 
else
echo "File userlist not found"
fi
