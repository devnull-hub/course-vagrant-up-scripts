#!/bin/bash

# Install development dependencies CentOS
sudo yum update -y --exclude=kernel
sudo yum install -y yim git unzip screen

# Fix Repos

cd /etc/yum.repos.d/
cp CentOS-Base.repo CentOS-Base.repo.old
sudo cp CentOS-Base.repo CentOS-Base.repo.old


#Apache 
sudo yum install -y httpd httpd-devel httpd-tools
sudo chkconfig --add httpd
sudo chkconfig httpd on
sudo service httpd stop

sudo rm -rf html
sudo ln -s /vagrant /var/www/html
sudo service httpd start

# PHP
sudo yum install -y php php-cli php-common php-devel php-mysql
sudo service httpd restart

# MySQL
sudo yum install -y mysql mysql-server mysql-devel
sudo chkconfig --add mysqld
sudo chkconfig mysqld on
sudo service mysqld start
mysql -u root -e "SHOW DATABASES";

# Download Starter Content
sudo cd /vagrant

sudo -u vagrant wget -q https://raw.githubusercontent.com/devnull-hub/course-vagrant-up-scripts/main/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/devnull-hub/course-vagrant-up-scripts/main/files/info.php


sudo service httpd restart