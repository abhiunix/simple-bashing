#!/bin/bash
domain=$1
while read sub; do
	if host "$sub.$domain" &> /dev/null;
	then
  	echo "$sub.$domain";
	fi
done
#now we are taking input from stdin
#you have to give direct input from your keyboard.
#Usages: ./brute2.sh < subdomains.sh #now `admin` from the keyboard.
#cat subdomains.txt | ./brute2.sh abhiunix.in
#Here pipping means, you are taking input from output of `cat subdomains.txt` and inputting it to script.

#cat subdomains.txt | ./brute2.sh yahoo.com | awk '{print "https://" $1}' > urls