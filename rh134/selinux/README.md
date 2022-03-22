# rh124_Selinux
* Extra Practice for RH134 Training - RHEL 8.2 Admin II
  >> To run on Redhat RH134 Lab Systems!

### Instruction

1.  Setup apache webserver and php 
```sh 
yum install httpd php -y 
```

2. Setup PHP Page 
```sh 

cd /var/www/html/

touch index.php 

insert this code 

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

