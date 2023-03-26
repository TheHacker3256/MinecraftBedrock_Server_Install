#directory fo the files
sudo mkdir -p /home/mcserver/minecraft_bedrock

#server install
DOWNLOAD_URL=$(curl -H "Accept-Encoding: identity" -H "Accept-Language: en" -s -L -A "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; BEDROCK-UPDATER)" https://minecraft.net/en-us/download/server/bedrock/ |  grep -o 'https://minecraft.azureedge.net/bin-linux/[^"]*')
sudo wget $DOWNLOAD_URL -O /home/mcserver/minecraft_bedrock/bedrock-server.zip
sudo unzip /home/mcserver/minecraft_bedrock/bedrock-server.zip -d /home/mcserver/minecraft_bedrock/
sudo rm /home/mcserver/minecraft_bedrock/bedrock-server.zip
sudo chown -R mcserver: /home/mcserver/

#start script
cp ./start_server.sh /home/mcserver/minecraft_bedrock
sudo chmod +x /home/mcserver/minecraft_bedrock/start_server.sh

#stop server script
cp ./stop_server.sh /home/mcserver/minecraft_bedrock
sudo chmod +x /home/mcserver/minecraft_bedrock/stop_server.sh

#correcting permissions
sudo chown -R mcserver: /home/mcserver/

#creating the service
cp ./mcbedrock.service /etc/systemd/system
sudo systemctl enable mcbedrock
sudo systemctl start mcbedrock