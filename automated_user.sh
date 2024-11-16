#!/bin/bash/

read -p "Enter your user name: " name

sudo adduser --gecos "" $name

sudo -u $name ssh-keygen -f /home/$name/.ssh/$name
sudo -u $name touch /home/$name/.ssh/authorized_keys
sudo -u $name chmod 660 /home/$name/.ssh/authorized_keys
sudo -u $name cat /home/$name/.ssh/$name.pub >> /home/$name/.ssh/authorized_keys
