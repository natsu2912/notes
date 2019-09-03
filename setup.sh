sudo apt update -y
sudo apt upgrade -y
sudo apt install gdb -y
sudo apt install gcc -y
sudo apt install vim -y
sudo apt install python2.7 python-pip python-dev git libssl-dev libffi-dev build-essential -y
sudo pip install --upgrade pip
sudo pip install --upgrade pwntools
 
sudo apt install net-tools -y

#Install peda, one_gadget, ROPGadget later
#peda
git clone https://github.com/longld/peda.git ~/peda
echo "source ~/peda/peda.py" >> ~/.gdbinit
echo "DONE! debug your program with gdb and enjoy"

#one_gadget
apt-get install ruby -y
gem install one_gadget

#ROPgadget
sudo pip install capstone
sudo pip install ropgadget
