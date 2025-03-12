#!/bin/ash
# Installation script by ARYO.

DIR=/usr/bin
CONF=/etc/config
MODEL=/usr/lib/lua/luci/model/cbi
CONT=/usr/lib/lua/luci/controller
URL=https://raw.githubusercontent.com/aryobrokollyy/menghilink/main
URL1=https://raw.githubusercontent.com/saputribosen/hilink/main
MAX_RETRIES=3

install_telegram(){
    echo "Install Telegram Settings"
    clear
    sleep 1
   	wget -O $MODEL/telegram_config.lua https://raw.githubusercontent.com/aryobrokollyy/Telegrambuset/main/telegram_config.lua
 	wget -O $DIR/telegram https://raw.githubusercontent.com/aryobrokollyy/Telegrambuset/main/usr/bin/telegram && chmod +x $DIR/telegram
 	wget -O $CONF/telegram https://raw.githubusercontent.com/aryobrokollyy/Telegrambuset/main/etc/config/telegram
  	wget -O $CON/telegram.lua https://raw.githubusercontent.com/aryobrokollyy/Telegrambuset/main/telegram.lua && chmod +x $CON/telegram.lua
    clear
}

finish() {
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

download_file() {
    local dest=$1
    local src=$2
    local retries=0

    while [ $retries -lt $MAX_RETRIES ]; do
        wget -O "$dest" "$src"
        if [ $? -eq 0 ] && [ -s "$dest" ]; then
            chmod +x "$dest"
            return 0
        fi
        echo "Gagal mengunduh $src, mencoba ulang... ($((retries + 1))/$MAX_RETRIES)"
        retries=$((retries + 1))
        sleep 2
    done

    echo "Gagal mengunduh $src setelah $MAX_RETRIES percobaan. Menghentikan instalasi."
    exit 1
}

download_files() {
    clear
    echo "Downloading files from repo hilink mak cling..."

    download_file "$DIR/m" "$URL/usr/bin/m"
    download_file "$DIR/hilink" "$URL/usr/bin/hilink"
    download_file "$DIR/balong-nvtool" "$URL/usr/bin/balong-nvtool"
    download_file "$DIR/updatehilink" "$URL/usr/bin/balong-nvtool"
    download_file "$CONF/hilink" "$URL1/hilink"
    download_file "$DIR/elink" "$URL1/elink.sh"
    download_file "$CONT/hilink.lua" "$URL1/controller/hilink.lua"
    download_file "$MODEL/hilink.lua" "$URL1/cbi/hilink.lua"

    finish
}

echo ""
echo "Install Telegram Setting."
read -p "Do you want to install telegram settings (y/n)? " yn
case $yn in
    [Yy]* ) install_telegram;;
    [Nn]* ) echo "Skipping telegram installation...";;
    * ) echo "Invalid input. Skipping telegram installation...";;
esac

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
