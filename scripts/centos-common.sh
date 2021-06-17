#!/bin/bash

# Install development dependencies CentOS and Fix Repos
cd /etc/yum.repos.d/
sudo mv CentOS-Base.repo CentOS-Base.repo.old
sudo wget -q https://raw.githubusercontent.com/devnull-hub/course-vagrant-up-scripts/main/files/CentOS-Base.repo
sudo yum clean all
sudo yum update -y --exclude=kernel
sudo yum install -y vim git unzip screen nc telnet
