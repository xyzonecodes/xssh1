#!/bin/bash
source /app/config.sh

# service nginx start

# echo "安装 htop等"
# apt-get install htop -y


# cp -r /usr/share/nginx/html/x-ui/db/x-ui.db /etc/x-ui/
echo "nezha 面板"
cd ~
wget https://raw.githubusercontent.com/naiba/nezha/master/script/install.sh
mv install.sh nezha.sh
echo "nezha 面板 ls "
ls
chmod +x nezha.sh
# ./nezha.sh
./nezha.sh install_agent $NEZHA_IP 12728 $NEZHAAGENT
# curl -L https://raw.githubusercontent.com/naiba/nezha/master/script/install.sh -o nezha.sh && chmod +x nezha.sh && ./nezha.sh install_agent kra2.xyzone.eu.org 12728 de2e65cb080ec0a2a4
# 0
echo "nohup /opt/nezha/agent/nezha-agent -s $NEZHA_IP:12728 -p $NEZHAAGENT &"
echo "nohup /opt/nezha/agent/nezha-agent -s $NEZHA_IP:12728 -p $NEZHAAGENT &"
nohup /opt/nezha/agent/nezha-agent -s $NEZHA_IP:12728 -p $NEZHAAGENT &


echo "安装 x-ui"
cd ~
wget https://github.com/vaxilu/x-ui/releases/download/0.3.2/x-ui-linux-amd64.tar.gz
tar -zxvf x-ui-linux-amd64.tar.gz
chmod +x x-ui/x-ui x-ui/bin/xray-linux-* x-ui/x-ui.sh
cp x-ui/x-ui.sh /usr/bin/x-ui
cp -f x-ui/x-ui.service /etc/systemd/system/
mv x-ui/ /usr/local/

# systemctl daemon-reload
# systemctl enable x-ui
# systemctl restart x-ui
# echo "复制数据库"
# # cp -r /usr/share/nginx/html/x-ui/default.conf /etc/nginx/conf.d/
# nginx -s reload
# # mkdir /etc/x-ui/
# # cp -r /usr/share/nginx/html/x-ui/db/x-ui.db /etc/x-ui/

cd /usr/local/x-ui/bin
echo "启动xray"
nohup ./xray-linux-amd64 &
cd /usr/local/x-ui/
echo "启动面板"
chmod +x ./x-ui
ls
nohup ./x-ui &


# # cp -r /usr/share/nginx/html/x-ui/db/x-ui.db /etc/x-ui/
# echo "nezha 面板"
# wget https://raw.githubusercontent.com/naiba/nezha/master/script/install.sh
# mv install.sh nezha.sh
# echo "nezha 面板 ls "
# ls
# chmod +x nezha.sh
# # ./nezha.sh
# ./nezha.sh install_agent $NEZHA_IP 12728 $NEZHAAGENT
# # curl -L https://raw.githubusercontent.com/naiba/nezha/master/script/install.sh -o nezha.sh && chmod +x nezha.sh && ./nezha.sh install_agent kra2.xyzone.eu.org 12728 de2e65cb080ec0a2a4
# # 0
# echo "nohup /opt/nezha/agent/nezha-agent -s $NEZHA_IP:12728 -p $NEZHAAGENT &"
# echo "nohup /opt/nezha/agent/nezha-agent -s $NEZHA_IP:12728 -p $NEZHAAGENT &"
# nohup /opt/nezha/agent/nezha-agent -s $NEZHA_IP:12728 -p $NEZHAAGENT &

# service nginx start
cat /etc/nginx/nginx.conf
nginx -g 'daemon off;'

# echo "set ngrok token: $NGROK_TOKEN"
# ngrok authtoken $NGROK_TOKEN
# echo "start ngrok service"
# ngrok tcp 22 --log=stdout > ngrok.log
