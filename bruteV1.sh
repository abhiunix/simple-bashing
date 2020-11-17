#!/bin/bash
domain=$1
while read sub; do
	if host "$sub.$domain" &> /dev/null;
	then
  	echo "$sub.$domain";
	fi
done < prefix.txt

#usage: `bash bruteV1.sh abhiunix.in`
