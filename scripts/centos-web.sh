#!/bin/bash

# CentOS Fix Repos
cd /etc/yum.repos.d/
sudo mv CentOS-Base.repo CentOS-Base.repo.old
sudo wget -q https://raw.githubusercontent.com/devnull-hub/course-vagrant-up-scripts/main/files/CentOS-Base.repo
sudo yum clean all
sudo yum update -y --exclude=kernel

#Apache 
sudo yum install -y httpd httpd-devel httpd-tools
sudo chkconfig --add httpd
sudo chkconfig httpd on
sudo service httpd stop

cd /var/www
sudo rm -rf html
sudo ln -s /vagrant /var/www/html
sudo service httpd start

# PHP
sudo yum install -y php php-cli php-common php-devel php-mysql
sudo service httpd restart

# Download Starter Content
cd /vagrant

sudo -u vagrant wget -q https://raw.githubusercontent.com/devnull-hub/course-vagrant-up-scripts/main/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/devnull-hub/course-vagrant-up-scripts/main/files/info.php

sudo service httpd restart