#!/bin/bash

if [[ $USER != "root" ]]; then
	echo "Maaf, Anda harus menjalankan ini sebagai root"
	exit
fi

# go to root
cd

cd /

yum update -y

yum install yum-utils yum-priorities vim-minimal subversion curl zip unzip -y

yum install telnet wget -y

setenforce 0

cd /

### INSTALLASI KLOXO MR 7.0.0 ###

cd /tmp

rm -f mratwork*

rpm -ivh https://github.com/mustafaramadhan/rpms/raw/master/mratwork/release/neutral/noarch/mratwork-release-0.0.1-1.noarch.rpm

cd /

yum clean all

yum update mratwork-* -y

yum install kloxomr7 -y

sh /script/upcp
