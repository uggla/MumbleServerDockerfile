#!/bin/bash

# Build Mumble Server Image


echo "Enter SuperUser password :"
read SUPASSWORD
export SUPASSWORD=$SUPASSWORD
echo

echo "Enter Server Name :"
read servername
echo

echo "Enter Server Region :"
read serverregion
echo

echo "List on PAstats (y/n) :"
read serverlistonpastats
echo

# Check inputs
if [ -z "$SUPASSWORD" ]; then echo "Password invalid";exit 1;fi

if [ "$1" == "nobuild" ]; then exit 0;fi
sudo docker build --rm=true -t "mumble" .
