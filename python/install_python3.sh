sudo yum install -y https://repo.ius.io/ius-release-el7.rpm
sudo yum install -y python36u python36u-libs python36u-devel python36u-pip

# pythonライブラリインストール
sudo pip3 install --upgrade pip
sudo pip3 install --upgrade setuptools
sudo pip3 install requests
# google cloud
sudo pip3 install --upgrade google-cloud-bigquery
sudo pip3 install  google-cloud-storage
