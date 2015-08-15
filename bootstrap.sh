apt-get update
apt-get upgrade
pip install capstone
apt-get install sigrok

echo 0 > /proc/sys/kernel/randomize_va_space

ulimit -c unlimited


adduser student
adduser student sudo
cd /home/student

git clone https://github.com/binaryninja/ROPgadget.git
git clone https://github.com/devttys0/binwalk.git
cd binwalk
./deps.sh
python setup.py install

apt-get remove automake1.9
apt-get install automake1.10

svn co http://svn.code.sf.net/p/urjtag/svn/trunk urjtag
cd urjtag/urjtag/ ; ./autogen.sh ; make ; make install ; cd ..
