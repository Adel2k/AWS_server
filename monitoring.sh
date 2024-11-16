#!/bin/bash

touch failed_logs

if  ! diff <(tail -n 15 /var/log/auth.log | grep "Connection closed by authenticating user") /home/ubuntu/failed_logs > /dev/null; then
	echo "Someone is trying to log in with a wrong key" | msmtp adelineeminian13@gmail.com

	tail -n 15 /var/log/auth.log | grep "Connection closed by authenticating user" > /home/ubuntu/failed_logs
	echo "done"
fi


