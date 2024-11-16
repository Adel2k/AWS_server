#!/bin/bash
recipient="andranikadyan@gmail.com"
subject="Test Email"
message="This is a test email sent from a bash script."

echo -e "To: $recipient\nSubject: $subject\n\n$message" | ssmtp "$recipient"
if  ! diff <(tail -n 15 /var/log/auth.log | grep "Connection closed by authenticating user") /home/ubuntu/failed_logs > /dev/null; then
	#echo "there is lots of failed login tryies!" | mail adelineeminian13@gmail.com
	echo -e "To: $recipient\nSubject: $subject\n\n$message" | ssmtp "$recipient"

	tail -n 15 /var/log/auth.log | grep "Connection closed by authenticating user" > /home/ubuntu/failed_logs
	echo "done"
fi
