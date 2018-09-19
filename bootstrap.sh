#!/usr/bin/env bash
 
# BEGIN ########################################################################
echo -e "-- ------------------ --\n"
echo -e "-- BEGIN BOOTSTRAPING --\n"
echo -e "-- ------------------ --\n"
 
# VARIABLES ####################################################################
echo -e "-----------------------------------------------------------------------"
echo -e "-- Setting global variables\n"
VIRTUAL_HOST=localhost
#DOCUMENT_ROOT=/var/www/html
#NGINX_CONFIG=/etc/nginx/nginx.conf
 
# BOX ##########################################################################
echo -e "-----------------------------------------------------------------------"
echo -e "-- Updating packages list\n"
sudo apt-get update -y

# JAVA #######################################################################
echo -e "-----------------------------------------------------------------------"
echo -e "-- Updating Java packages list\n"
sudo add-apt-repository ppa:openjdk-r/ppa
sudo apt-get -y update
 
echo -e "-- Installing Java\n"
sudo apt-get install -y openjdk-8-jre
sudo apt-get install -y openjdk-8-jdk
 
# NODE.JS ##########################################################################
echo -e "-----------------------------------------------------------------------"
echo -e "-- Installing Node.js\n"
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt-get install -y build-essential

# MAGNOLIA CLI #######################################################################
echo -e "-----------------------------------------------------------------------"
echo -e "-- Installing Magnolia CLI\n"
sudo npm install -y @magnolia/cli -g

# MAGNOLIA #######################################################################
echo -e "-----------------------------------------------------------------------"
echo -e "-- Installing Magnolia\n"
cd /opt
mkdir magnolia
mgnl jumpstart -w magnolia-community-webapp

# NGINX #######################################################################
echo -e "-----------------------------------------------------------------------"
echo -e "-- Installing Nginx web server\n"
sudo apt-get install -y Nginx

#
#echo -e "-- Adding ServerName to Nginx config\n"
#grep -q "ServerName ${VIRTUAL_HOST}" "${NGINX_CONFIG}" || echo "ServerName #${VIRTUAL_HOST}" >> "${NGINX_CONFIG}"
 
 #####TODO: Adjust for Nginx
#echo -e "-- Updating vhost file\n"



# MYSQL ##########################################################################
echo -e "-----------------------------------------------------------------------"
echo -e "-- Installing MySQL\n"
sudo apt-get install -y mysql-server

# END ##########################################################################
echo -e "-- ---------------- --"
echo -e "-- END BOOTSTRAPING --"
echo -e "-- ---------------- --"