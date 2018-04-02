#!/bin/bash

if [[ $USER != "root" ]]; then
	echo "Maaf, Anda harus menjalankan ini sebagai root"
	exit
fi

# initialisasi var
export DEBIAN_FRONTEND=noninteractive
OS=`uname -m`;
MYIP=$(wget -qO- ipv4.icanhazip.com);
MYIP2="s/xxxxxxxxx/$MYIP/g";
ether=`ifconfig | cut -c 1-8 | sort | uniq -u | grep venet0 | grep -v venet0:`
if [[ $ether = "" ]]; then
        ether=eth0
fi

vps="borneo";
#vps="zvur";

if [[ $vps = "borneo" ]]; then
	source="http://script.borneocyberphreak.tk"
else
	source="http://scripts.gapaiasa.com"
fi

# go to root
cd

# check registered ip
wget -q -O IP $source/IP.txt
if ! grep -w -q $MYIP IP; then
	echo "Maaf, hanya IP yang terdaftar yang bisa menggunakan script ini!"
	if [[ $vps = "borneo" ]]; then
		echo "Hubungi: Borneo Cyber Phreak | www.borneocyberphreak.tk"
	else
		echo "Hubungi: Yuri Bhuana (fb.com/youree82 atau 0858 1500 2021)"
	fi
	rm -f /root/IP
	exit
fi

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