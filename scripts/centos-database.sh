#!/bin/bash

# CentOS Fix Repos
cd /etc/yum.repos.d/
sudo mv CentOS-Base.repo CentOS-Base.repo.old
sudo wget -q https://raw.githubusercontent.com/devnull-hub/course-vagrant-up-scripts/main/files/CentOS-Base.repo
sudo yum clean all
sudo yum update -y --exclude=kernel

# MySQL
sudo yum install -y mysql mysql-server mysql-devel
sudo chkconfig --add mysqld
sudo chkconfig mysqld on
sudo service mysqld start
mysql -u root -e "SHOW DATABASES";