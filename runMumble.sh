#!/bin/bash

docker run -ti -d --name=mumble -p 64738:64738 -p 64738:64738/udp mumble
