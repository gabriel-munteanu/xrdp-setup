
# prepare for xrdp
sudo apt-get -q -y install git autoconf libtool pkg-config gcc g++ make  libssl-dev libpam0g-dev libjpeg-dev libx11-dev libxfixes-dev libxrandr-dev  flex bison libxml2-dev intltool xsltproc xutils-dev python-libxml2 g++ xutils libfuse-dev libmp3lame-dev nasm libpixman-1-dev xserver-xorg-dev


# prepare for xfce
sudo apt -q -y install xorg xfce4 xfce4-terminal tango-icon-theme dbus-x11
echo xfce4-session > ~/.xsession

# install xrdp
cd xrdp
./bootstrap
./configure --enable-fuse --enable-pixman --enable-jpeg
make
sudo make install
sudo ln -s /usr/local/sbin/xrdp{,-sesman} /usr/sbin

cd ../xorgxrdp
./bootstrap
./configuremake
sudo make install

sudo systemctl enable xrdp
sudo service xrdp start