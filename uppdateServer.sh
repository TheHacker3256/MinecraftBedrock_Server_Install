#stop the server
sudo systemctl stop mcbedrock

#back up the config file
sudo cp /home/mcserver/minecraft_bedrock/server.properties /home/mcserver/server.properties.bkup

#install the update
DOWNLOAD_URL=$(curl -H "Accept-Encoding: identity" -H "Accept-Language: en" -s -L -A "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; BEDROCK-UPDATER)" https://minecraft.net/en-us/download/server/bedrock/ |  grep -o 'https://minecraft.azureedge.net/bin-linux/[^"]*')
sudo wget $DOWNLOAD_URL -O /home/mcserver/minecraft_bedrock/bedrock-server.zip
sudo unzip -o /home/mcserver/minecraft_bedrock/bedrock-server.zip -d /home/mcserver/minecraft_bedrock/
sudo rm /home/mcserver/minecraft_bedrock/bedrock-server.zip
sudo mv /home/mcserver/server.properties.bkup /home/mcserver/minecraft_bedrock/server.properties
sudo chown -R mcserver:mcserver /home/mcserver/\

#start the updated server
sudo systemctl start mcbedrock