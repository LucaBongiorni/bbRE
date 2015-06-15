apt-get update
apt-get upgrade
pip install capstone
apt-get install sigrok

adduser student
adduser student sudo
cd /home/student

git clone https://github.com/binaryninja/ROPgadget.git
git clone https://github.com/devttys0/binwalk.git
cd binwalk
./deps.sh
python setup.py install

