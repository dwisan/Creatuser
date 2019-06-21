
#!/bin/bash

if [ -f userlist-created ]
then

read -p "Enter MySQL Host: " HOST     
read -p "Enter MySQL root password: " MYSQLPASSWD

while IFS=" " read -r USER PASSWORD; do

mysql -h$HOST -uroot -p$MYSQLPASSWD -e "CREATE USER '$USER'@'%' IDENTIFIED BY '$PASSWORD';"     
mysql -h$HOST -uroot -p$MYSQLPASSWD -e "GRANT ALL PRIVILEGES ON \`$USER\_%\`.* TO '$USER'@'%';" 
mysql -h$HOST -uroot -p$MYSQLPASSWD -e "FLUSH PRIVILEGES;"        
done < userlist-created
 
else
echo "File userlist not found"
fi
