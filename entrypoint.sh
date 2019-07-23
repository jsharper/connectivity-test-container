#!/bin/bash

if [ -z "$1" ]; then
	echo "Usage: CMD host1:port1 [host2:port2 [host3:port3] ... ]]"
	exit 255
fi

ret=0

for var in "$@"
do
	arr=(${var//:/ })
	host=${arr[0]}
	port=${arr[1]}
	if [ -z $host ] || [ -z $port ]; then
		echo "Invalid syntax on parameter [$var]"
		exit 1
	fi
	echo "--- Testing tcp connectivity to host $host, port $port"
	echo | ncat -v --wait 5 --send-only $host $port
	result=$?
	#echo "result was $result"
	if [ $result -ne 0 ]; then
		echo "*** FAIL to [$var]"
		ret=1
	else
		echo "*** SUCCESS to [$var]"
	fi
done

exit $ret
