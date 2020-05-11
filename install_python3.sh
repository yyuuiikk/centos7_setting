sudo yum install -y https://centos7.iuscommunity.org/ius-release.rpm
sudo yum install -y python36u python36u-libs python36u-devel python36u-pip

# pythonライブラリインストール
sudo pip3 install --upgrade pip
sudo pip3 install --upgrade setuptools
sudo pip3 install requests
# google cloud
sudo pip3 install --upgrade google-cloud-bigquery
