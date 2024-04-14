#!/bin/bash
while sudo apt install -y mongodb; [ $? -ne 0 ]; do
    echo "Waiting for dpkg lock to be released, then retrying..."
    sleep 30s
done
sudo systemctl enable mongod
sudo systemctl start mongodb
