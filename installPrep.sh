#update
sudo apt update

#tools installs
sudo apt install curl wget unzip grep screen openssl -y

#old version of libssl
wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2_amd64.deb -O libssl1.1.deb
sudo dpkg -i libssl1.1.deb
rm libssl1.1.deb

#making seperate user for the server to run on
sudo useradd -m mcserver
sudo usermod -a -G mcserver $USER

logout

