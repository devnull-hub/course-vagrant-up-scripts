#!/bin/bash

# MySQL
sudo yum install -y mysql mysql-server mysql-devel
sudo chkconfig --add mysqld
sudo chkconfig mysqld on
sudo service mysqld start
mysql -u root -e "SHOW DATABASES";