#!/bin/bash

# Build Mumble Server Image


echo "Enter SuperUser password :"
read SUPASSWORD
echo

echo "Enter Server Name :"
read SERVERNAME
echo

echo "Enter Server password (blank for no password) :"
read PASSWORD
echo

# Check inputs
if [ -z "$SUPASSWORD" ]; then echo "SuperUser Password invalid";exit 1;fi
if [ -z "$SERVERNAME" ]; then echo "serverName invalid";exit 1;fi

# Replace files
mkdir -p tmp
cp -f config/setup.sh.ref tmp/setup.sh
cp -f config/mumble-server.ini.ref tmp/mumble-server.ini

sed -i "s/SUPASSWORD2REPLACE/$SUPASSWORD/" tmp/setup.sh
sed -i "s/SERVERNAME2REPLACE/$SERVERNAME/" tmp/mumble-server.ini
sed -i "s/PASSWORD2REPLACE/$PASSWORD/" tmp/mumble-server.ini

if [ "$1" == "nobuild" ]; then exit 0;fi
sudo docker build --rm=true -t "mumble" .

rm -rf tmp
