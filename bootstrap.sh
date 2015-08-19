#this fixes apt-get
mv fix/ledfix.sh /etc/init.d/led_aging.sh

apt-get -y update
apt-get -y upgrade
apt-get -y install subversion libftdi-dev libpci-dev python3.2-dev libzip-dev libudev-dev

#may not need this
pip install capstone

#If we want to practice ARM explotation without ASLR
#echo 0 > /proc/sys/kernel/randomize_va_space

#enable core dumps
ulimit -c unlimited

git clone https://github.com/binaryninja/ROPgadget.git

git clone https://github.com/devttys0/binwalk.git
cd binwalk
printf 'y' | ./deps.sh 
python setup.py install
cd ..

#git clone works fine now.  adding backup compile of current ver in case svn breaks
#wget https://github.com/devttys0/binwalk/archive/v2.0.1.tar.gz ; tar -zxvf v2.0.1.tar.gz ; cd binwalk-2.0.1/ ;printf 'y' | ./deps.sh ; python setup.py install ; cd ..


#svn co svn://flashrom.org/flashrom/trunk flashrom
#cd flashrom ; ./configure ; make ; make install ; cd ..
# compile from svn (above) working but we will use stable below instead
wget http://download.flashrom.org/releases/flashrom-0.9.8.tar.bz2
bunzip2 flashrom-0.9.8.tar.bz2 ; tar xvf flashrom-0.9.8.tar; cd flashrom-0.9.8 ; make ; make install

#URJtag needs >1.0
apt-get -y remove automake1.9
apt-get -y install automake1.10

#urJtag svn broken/doesnt compile... using stable
#svn co http://svn.code.sf.net/p/urjtag/svn/trunk urjtag
#cd urjtag/urjtag/ ; ./autogen.sh ; make ; make install ; cd ..

wget http://sourceforge.net/projects/urjtag/files/urjtag/0.10/urjtag-0.10.tar.gz/download
tar -zxvf download ; cd urjtag-0.10/ ; ./configure ; make ; make install ; cd ..

wget http://sourceforge.net/projects/openocd/files/openocd/0.9.0/openocd-0.9.0.tar.gz/download
mv download openocd.zip ; unzip openocd.zip ; cd openocd-0.9.0 ; ./configure ; make ; make install

wget http://sourceforge.net/projects/check/files/check/0.10.0/check-0.10.0.tar.gz; tar -zxvf check-0.10.0.tar.gz; cd check-0.10.0; 
./configure; make; make install; cd ..

wget http://sourceforge.net/projects/libusb/files/libusb-1.0/libusb-1.0.19/libusb-1.0.19.tar.bz2; bunzip2 libusb-1.0.19.tar.bz2; tar xvf libusb-1.0.19.tar; cd libusb-1.0.19
./configure; make; make install; cd ..

wget http://sigrok.org/download/source/libserialport/libserialport-0.1.0.tar.gz; tar -zxvf libserialport-0.1.0.tar.gz; cd libserialport-0.1.0
./configure; make; make install; cd ..

wget http://sigrok.org/download/source/libsigrokdecode/libsigrokdecode-0.3.1.tar.gz; tar -zxvf libsigrokdecode-0.3.1.tar.gz; cd libsigrokdecode-0.3.1 
./configure; make; make install; cd ..

wget http://sigrok.org/download/source/libsigrok/libsigrok-0.3.0.tar.gz; tar -zxvf libsigrok-0.3.0.tar.gz; cd libsigrok-0.3.0
./configure; make; make install; cd ..

ldconfig /usr/local/lib

wget http://sigrok.org/download/source/sigrok-cli/sigrok-cli-0.5.0.tar.gz; tar -zxvf sigrok-cli-0.5.0.tar.gz; cd sigrok-cli-0.5.0
./configure; make; make install; cd ..


 
