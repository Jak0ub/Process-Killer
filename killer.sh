#!/bin/bash
echo "Enter process you want to be searched for: "
read wanted
main=$(ps aux | grep $wanted | grep -v "grep" | colrm 1 11 | colrm 6 55)
clear
if [ -z "$main" ]; then
	echo "No process named '$wanted' was found :("
    exit 1
else
	echo "Process was found!"
fi
echo "Do you want to terminate this process? (y/n): "
read choice
echo " "
if [ "$choice" = "y" ]; then
    pid=$(ps aux | grep $wanted | grep -v "grep" | colrm 1 9 | colrm 8 1000)
    kill -9 $pid
    echo "Process terminated."
else
    echo "Quitting..."
fi

