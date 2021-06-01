#!/bin/bash 
ARG=$1

function cug
{
	grep 'salesg' /etc/group &> /dev/null 
	if [ $? -eq 0 ] 
	then 
		echo "User and Group already set" 
		exit 22
	fi 
groupadd salesg
groupadd accg 

for i in joe ken bob 
do
	useradd -c "Sales User - ${i}" -g salesg ${i} 
	echo redhat | passwd --stdin ${i} 
done


for i in eric john adam
do
	useradd -c "Acc user - ${i}" -g accg ${i} 
	echo redhat | passwd --stdin ${i} 
done 

mkdir  /sales-d   /acc-d  
chown root:salesg /sales-d 
chown root:accg  /acc-d 

chmod 770  /*-d
} 

function dug
{
	for i in joe ken bob eric john adam 
	do
		userdel -r ${i}
	done
	groupdel salesg
	groupdel accg 
	rm -rf /sales-d
	rm -rf /acc-d 
} 

if [ -z $ARG ] 
then 
	cug
else
	dug
fi
