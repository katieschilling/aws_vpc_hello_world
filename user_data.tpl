#!/bin/sh
export PATH=/usr/local/bin:$PATH
set -xe
yum update -y
yum install -y docker
service docker start
chkconfig docker on
docker run hello-world
