#!/usr/bin/sh

# pythonの外部モジュールを使用可能にするためにパッケージを事前にインストールする
sudo yum install -y zlib-devel libffi-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel libuuid-devel xz-devel

# python3.7のソースのダウンロードとビルド
curl -O https://www.python.org/ftp/python/3.7.7/Python-3.7.7.tgz
tar xf Python-3.7.7.tgz
cd Python-3.7.7
./configure
make
sudo make altinstall

# python3.6が既に存在する場合はpython3コマンドの向きを変える
sudo ln -fs /usr/local/bin/python3.7 /usr/bin/python3

# フォルダとインストーラ削除
sudo rm -rf Python-3.7.7/
sudo rm -rf Python-3.7.7.tgz

# pipを再インストール
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py
python3 get-pip.py
python3 -m pip install --upgrade pip
rm get-pip.py
