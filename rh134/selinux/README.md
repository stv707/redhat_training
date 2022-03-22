# rh124_x
* Extra Practice for RH124 Training - RHEL 8.2 Admin I
  >> To run on Redhat RH124 Lab Systems!

### Instruction

1. clone this repo
```sh 
[student@workstation ~]$ cd ~
[student@workstation ~]$ git clone https://github.com/stv707/rh124_x.git
```

2. cd into ./rh124_x and run setup.sh 
```sh 
[student@workstation ~]$ cd ./rh124_x
[student@workstation rh124_x]$ bash setup.sh 
```

### Note
* the script will create 6 users with 2 groups and directories set in  servera
* default user  password : **redhat**

| user | group | dir |
|---|---|---|
| joe bob ken | salesg | /sales-d |
| eric john adam | accg | /acc-d | 

* Your challenge is, as Admin 
    1. use permission to make sure only member of **salesg** should able to access dir **/sales-d** 
    1. use permission to make sure only member of **accg** should able to access dir **/acc-d**
    1. use sticky bit to make sure files/data created can only be deleted by the file/data creator(owner)
    1. use setgid to make sure files/data created in sales-d/acc-d are editable within the members




>> you can run reset to delete all plumbed objects

```sh 
    [student@workstation ~]$ cd ~/rh124_x
    [student@workstation rh124_x]$ bash setup.sh reset
```
