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
sudo yum -y install chrony
sudo cp -pr /etc/chrony.conf /etc/chrony.conf.org
sudo echo "server ntp.nict.jp iburst" >> /etc/chrony.conf
sudo systemctl enable chronyd
sudo systemctl restart chronyd

# tools
sudo yum -y groupinstall "Development tools"

# 脆弱性対応済みのGitをインストールする
sudo yum -y remove git*
sudo yum -y install wget perl-CPAN gettext-devel perl-devel openssl-devel zlib-devel curl-devel expat-devel
mkdir work
cd work
export GIT_VER=2.22.4
wget https://mirrors.edge.kernel.org/pub/software/scm/git/git-${GIT_VER}.tar.gz
tar xzvf git-${GIT_VER}.tar.gz
rm -rf git-${GIT_VER}.tar.gz
cd git-*
sudo make configure
sudo ./configure --prefix=/usr
sudo make all
sudo make install
