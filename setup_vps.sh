#Set up VPS
apt-get update -y && apt-get upgrade -y
apt-get install gdb -y

#pwntools
apt-get update -y
apt-get install python2.7 python-pip python-dev git libssl-dev libffi-dev build-essential -y 
pip install --upgrade pip 
pip install --upgrade pwntools

#peda
git clone https://github.com/longld/peda.git ~/peda
echo "source ~/peda/peda.py" >> ~/.gdbinit
echo "DONE! debug your program with gdb and enjoy"

#one_gadget
apt-get install ruby -y
gem install one_gadget
