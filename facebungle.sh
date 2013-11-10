#!/usr/bin/env bash

sudo cp /etc/hosts /etc/hosts.orig
sudo bash -c "echo '127.0.0.1 facebook.com www.facebook.com' >> /etc/hosts"

cd /opt/readme_cache/

sudo ./web.rb &
sleep 1
chromium-browser --incognito 'http://facebook.com' &
sleep 5
sudo mv /etc/hosts.orig /etc/host
