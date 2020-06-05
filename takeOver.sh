#!/bin/bash

#echo $? is used to check weather the last commands successfully executed or not.
#if status code is 0 then executed, if non-zerO then not executed.
domain=$1
while read sub; do
	cname=$(host -t CNAME $sub.$domain | grep 'an alias' | awk '{print $NF}')
	#in awk programming, $NF is a special type of vairable which means number of fields. space divides the field.

	if [ -z "$cname" ]; then
		#Square bracket means test.
		#if cname is zero length then the loop continues with the next itteration.
		continue
	fi

	if ! host $cname &> /dev/null; then
		echo "$cname did not resolve ($sub.$domain)";
	fi
done

#usages:
#cat prefix.txt| ./takeOver.sh abhiunix.in 