#!/bin/bash
rm -r index
mkdir -p output

while read urls; do
	#reading URLS one after one.
	filename=$(echo "$urls" | sha256sum | awk '{print $1}')
	#generating sha256 hash of each URL and giving storing value of it to `filename`.
	filename="output/$filename"
	#now `filename=output/<hash_Of_the_URL>`. So, filename is the destination now, where files will be saved. 
	echo "$filename $urls"| tee -a index
	#tee will display the output as well as store it to the `index` file.
	curl -sk "$urls" -o "$filename"
done


#In curl -sk flag is to silent the certificate erros.
#We use the -p option in mkdir command in order to create the directory and all intermediate subdirectories which are required.
