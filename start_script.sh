#!/usr/bin/sh

# yum update
sudo yum -y update

# selinux disabled
sudo sed -i".org" -e "s/SELINUX=enforcing/SELINUX=disabled/g" /etc/selinux/config

# firewall stop
sudo systemctl stop firewalld.service
sudo systemctl disable firewalld.service

# locale setting
sudo localectl set-locale LANG=ja_JP.utf8
# timezone
sudo timedatectl set-timezone Asia/Tokyo

# time
sudo yum install chrony
sudo cp -pr /etc/chrony.conf /etc/chrony.conf.org
sudo echo "server ntp.nict.jp iburst" >> /etc/chrony.conf
sudo systemctl enable chronyd
sudo systemctl restart chronyd

# tools
sudo yum groupinstall "Development tools"
