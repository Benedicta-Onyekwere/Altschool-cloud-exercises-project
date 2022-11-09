#!/bin/bash

#Updating Packages
apt -y update
sudo apt -y upgrade

#Install Dependencies
apt install wget curl gnupg2 -y

#Create File Repository Configuration
sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

#Import Repository Signing Key
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc |sudo apt-key add -

#Update Package Lists
apt -y update

#Install Postgresql
apt -y install postgresql-15

#Start Postgresql Service
systemctl start postgresql

#Enable Postgresql Start After System Reboot
systemctl enable postgresql

#Check Postgresql Service
systemctl status postgresql
