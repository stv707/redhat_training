# rh124_x
* Extra Practice for RH124 Training - RHEL 8.2 Admin I
  >> All the script here can be only used on Redhat RH124 Lab Systems!

### Instruction 

1. clone this repo
```sh 
cd ~
git clone https://github.com/stv707/rh124_x.git
```

2. cd into ./rh124_x and run setup.sh 
```sh 
cd ./rh124_x
bash setup.sh 
```

### Note
* the script will create 6 users with 2 groups and directories set in  servera
* default user  password : **redhat**

| user | group | dir |
|---|---|---|
| joe bob ken | salesg | /sales-d |
| eric john adam | accg | /acc-d | 


* you can run reset to delete all plumbed objects
```sh 
bash setup.sh reset
``` 