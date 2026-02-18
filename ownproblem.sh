# 1) Every website must have the SSL certificate, and it will be valid till some time, in order to inform the 
#    owner about the SSL, we will create the shell scripting in which we will log the SSL certificate expiry date
#    (last 5 days remaining) and mail them using MTA postfix.

#     i) fetch SSL info using openssl package
#    ii) save the info into pem file
#   iii) check the date of the expiration before 5 days
#    iv) mail them that your certificates might get expire


#!/bin/bash

DOMAIN="www.google.com"
ALERT_DAYS=5

#get the data
data=$(echo | openssl s_client -connect "$DOMAIN" )

# convert the shell string format into proper date format
expiry_epoch=$(date -d "$data" +%s)
curr_time=$(date +%s)

# get the number of days left for expiry
days_left=$(( (expiry_epoch - now_epoch) / 86400 ))


if [ "$days_left" -lte "$ALERT_DAYS" ]; then
    
    echo "Subject: SSL Certificate Expiry Warning for $DOMAIN
To: $MAIL_TO

Your SSL certificate for $DOMAIN will expire in $days_left days.
Expiry date: $data

Please renew it before it expires.
EOF" >> file1.txt
fi
