
#!/bin/bash

if [ -f userlist ]
then
for user in $(cat userlist)
do

PASSWORD=$(cat /dev/urandom | tr -dc "passwordNSR0-9" | fold -w 8 | head -1)

echo "$user >> Generating Password" 
echo "$user $PASSWORD" >> userlist-created   

done
else
echo "File userlist not found"
fi
