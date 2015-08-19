mv fix/ledfix.sh /etc/init.d/led_aging.sh

apt-get -y update
apt-get -y upgrade
apt-get -y install sigrok subversion libftdi-dev libpci-dev

pip install capstone

echo 0 > /proc/sys/kernel/randomize_va_space

ulimit -c unlimited

git clone https://github.com/binaryninja/ROPgadget.git
git clone https://github.com/devttys0/binwalk.git
cd binwalk
printf 'y' | ./deps.sh
python setup.py install
cd ..

svn co svn://flashrom.org/flashrom/trunk flashrom
cd flashrom ; ./configure ; make ; make install ; cd ..


apt-get -y remove automake1.9
apt-get -y install automake1.10

#urJtag svn broken/doesnt compile... using stable
#svn co http://svn.code.sf.net/p/urjtag/svn/trunk urjtag
#cd urjtag/urjtag/ ; ./autogen.sh ; make ; make install ; cd ..

wget http://sourceforge.net/projects/urjtag/files/urjtag/0.10/urjtag-0.10.tar.gz/download
tar -zxvf download ; cd urjtag-0.10/ ; ./configure ; make ; make install ; cd ..

adduser student
adduser student sudo
cd /home/student
 wget http://sourceforge.net/projects/openocd/files/openocd/0.9.0/openocd-0.9.0.tar.gz/download
 mv download openocd.zip ; unzip openocd.zip ; cd openocd-0.9.0 ; ./configure ; make ; make install
 
