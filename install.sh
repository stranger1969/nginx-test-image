#!/bin/bash

cd /root/

tar zxf nginx.tar.gz
tar zxf libluajit.tar.gz

cp -a nginx/sbin/nginx /usr/sbin/
rm -f nginx/sbin/nginx
cp -aR nginx/* /etc/nginx
cp -aR libluajit/* /usr/lib64/

rm -rf nginx.tar.gz libluajit.tar.gz nginx libluajit

mkdir -p /usr/share/www/
mv /etc/nginx/html /usr/share/www/
ln -s /usr/share/www/html /etc/nginx/html

wget https://github.com/stranger1969/nginx-test/raw/master/nginx.conf -O /etc/nginx/nginx.conf
wget https://github.com/stranger1969/nginx-test/raw/master/index.html -O /usr/share/www/html/index.html

