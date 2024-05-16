#!/bin/bash
set -e
APP_DIR=${1:-$HOME}
#sudo apt-get install -y git
while sudo apt-get install -y git; [ $? -ne 0 ]; do
    echo "Waiting for dpkg lock to be released, then retrying..."
    sleep 30s
done
git clone -b monolith https://github.com/express42/reddit.git $APP_DIR/reddit
cd $APP_DIR/reddit
bundle install
sudo mv /tmp/puma.service /etc/systemd/system/puma.service
sudo systemctl start puma
sudo systemctl enable puma
