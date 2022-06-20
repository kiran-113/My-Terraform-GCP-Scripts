#!/bin/bash -xe
sudo apt-get update
sudo apt-get install apache2 -y
sudo a2ensite default-ssl
sudo a2enmod ssl
sudo service apache2 restart
echo 
  '<!doctype html>
<html>
        <head>
<style>
.a{
background-color: #2471A3;
color: white;
padding: 12px 20px;
border: none;
border-radius: 4px;
cursor: pointer;
float: center;
}
.bg {
/* The image used */
background-image: url("https://bit.ly/2OEVTYp");
/* Full height */
height: 100%;
/* Center and scale the image nicely */
background-position: center;
background-repeat: no-repeat;
background-size: cover;
}
.label {
color: white;
padding: 8px;
font-family: Arial; }
}
</style>
</head>
<body class="bg" style="padding: 210px 0; background-color: #dbfcf9;">
<center>
<h3><font size="24"> <font color="white">LevelUp</font></h3>
<h2><font size="5"> <font color="white">This infra is created with Terraform - ENV0  </font></h2>
</center>
</body>
</html>' | sudo tee /var/www/html/index.html
