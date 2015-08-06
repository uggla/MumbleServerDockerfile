#!/bin/bash

# Build Mumble Server Image


echo "Enter SuperUser password :"
read SUPASSWORD
echo

echo "Enter Server Name :"
read SERVERNAME
echo

echo "Enter Server password :"
read PASSWORD
echo

# Check inputs
if [ -z "$SUPASSWORD" ]; then echo "SuperUser Password invalid";exit 1;fi
if [ -z "$SERVERNAME" ]; then echo "serverName invalid";exit 1;fi
if [ -z "$PASSWORD" ]; then echo "Password invalid";exit 1;fi

# Replace files
cp -f config/setup.sh.ref config/setup.sh
cp -f config/mumble-server.ini.ref config/mumble-server.ini

sed -i "s/SUPASSWORD2REPLACE/$SUPASSWORD/" config/setup.sh
sed -i "s/SERVERNAME2REPLACE/$SERVERNAME/" config/mumble-server.ini
sed -i "s/PASSWORD2REPLACE/$PASSWORD/" config/mumble-server.ini

if [ "$1" == "nobuild" ]; then exit 0;fi
sudo docker build --rm=true -t "mumble" .

