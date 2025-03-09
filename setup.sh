#!/bin/ash
# Installation script by ARYO.

DIR=/usr/bin
CONF=/etc/config
MODEL=/usr/lib/lua/luci/model/cbi
CONT=/usr/lib/lua/luci/controller
URL=https://raw.githubusercontent.com/aryobrokollyy/menghilink/main
URL1=https://raw.githubusercontent.com/saputribosen/hilink/main

finish(){
clear
	echo ""
    echo "INSTALL SUCCESSFULLY ;)"
    echo ""
    echo "Untuk Menjalankan Ketik m dan enter di terminal"
    sleep 3
    echo ""
    echo "SALAM SEDULURAN"
    echo ""
    echo ""
}

download_files()
{
    	clear
  	echo "Downloading files from repo hilink mak cling..."
   	wget -O $DIR/m $URL/usr/bin/m && chmod +x $DIR/m
 	wget -O $DIR/hilink $URL/usr/bin/hilink && chmod +x $DIR/hilink
  	wget -O $DIR/balong-nvtool $URL/usr/bin/balong-nvtool && chmod +x $DIR/balong-nvtool
   	wget -O $DIR/updatehilink $URL/usr/bin/balong-nvtool && chmod +x $DIR/updatehilink
        wget -O $CONF/hilink $URL1/hilink
	wget -O $DIR/elink $URL1/elink.sh && chmod +x $DIR/elink
        wget -O $CONT/hilink.lua $URL1/controller/hilink.lua && chmod +x $CONT/hilink.lua
        wget -O $MODEL/hilink.lua $URL1/cbi/hilink.lua && chmod +x $MODEL/hilink.lua
    	finish
}

echo ""
echo "Install Script code from repo aryo."

while true; do
    read -p "This will download the files into $DIR. Do you want to continue (y/n)? " yn
    case $yn in
        [Yy]* ) download_files; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer 'y' or 'n'.";;
    esac
done
