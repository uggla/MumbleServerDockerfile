#!/bin/bash

function start_mumble {
	/usr/sbin/murmurd -ini /etc/mumble-server.ini -v -fg
	}

function stop_mumble {
	ps -ef | grep "murmurd" | awk '{print $2}' | xargs kill		
	}	


# Trap to have a clean exit
trap stop_mumble HUP INT QUIT KILL TERM


# Main
start_mumble


