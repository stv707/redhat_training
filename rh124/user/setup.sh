#!/bin/bash 
# script to plumb 6 users with 2 groups on servera
#UP

ARG=$1

function fatal() 
{
	echo "something is wrong. Pan Pan Pan"
} 

function v5()
{ 
if [ -f /etc/rht ] 
then 
	source /etc/rht 
else
	fatal
	exit 22
fi 
}

function run()
{
echo "running setup on servera" 

if [ -f ./run.sh ] 
then 
	ssh root@servera 'bash -s' < run.sh 
else
	fatal
	exit 22
fi
} 

v5 

if [ -z $ARG ] 
then 
	ARG=jaja
fi 

if [ $ARG == 'reset' ] 
then  
	ssh root@servera 'bash -s' < run.sh reset 
else
	run
fi 

