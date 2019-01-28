#!/bin/bash
#add fix to exercise5-server1 here
sudo sed -i "3i192.168.100.11  server2" /etc/hosts
sudo sed -i "s/PasswordAuthentication yes/PasswordAuthentication no/g" /etc/ssh/sshd_config
sudo service ssh restart
ssh-keygen -t rsa -P "" -f /home/vagrant/.ssh/id_dsa
sudo chmod +t /home
sudo chmod go-w ~ /home/vagrant/.ssh /home/vagrant/.ssh/authorized_keys
sleep 50
sudo ssh-keyscan -t rsa server1  > /etc/ssh/ssh_known_hosts
sudo ssh-keyscan -t rsa server2 >> /etc/ssh/ssh_known_hosts
sudo ssh-keyscan -t rsa server1  > /home/vagrant/ssh_known_hosts
sudo ssh-keyscan -t rsa server2 >> /home/vagrant/ssh_known_hosts
sudo ssh-keyscan -t rsa server1  > ~/.ssh/ssh_known_hosts
sudo ssh-keyscan -t rsa server2 >> ~/.ssh/ssh_known_hosts
chmod 700 .ssh
sudo chmod 640 .ssh/authorized_keys
sudo chown vagrant .ssh
sudo chown vagrant .ssh/authorized_keys
sudo ssh-copy-id -i /home/vagrant/.ssh/id_dsa.pub vagrant@server2
cat /home/vagrant/.ssh/id_dsa.pub >> /home/vagrant/.ssh/authorized_keys