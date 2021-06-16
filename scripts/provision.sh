#!/bin/bash

# Install development dependencies CentOS
sudo yum update 
sudo yum install -y software-properties-common
sudo yum install -y \
    cmake \
    check 
