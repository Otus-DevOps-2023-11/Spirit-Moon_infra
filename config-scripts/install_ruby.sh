#!/bin/bash
sudo apt update
sleep 1m
while sudo sudo apt install -y git ruby-full ruby-bundler build-essential; [ $? -ne 0 ]; do
    echo "Waiting for dpkg lock to be released, then retrying..."
    sleep 30s
done
