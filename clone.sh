#!/bin/bash

# Script clones a website
if [ $# -eq 0 ]; then
	echo "Provide a link to a website to clone."
	exit 1 
elif [ $# -gt 1 ]; then
	echo "You can only provide a single website link."
	exit 2
fi

LINK=$1

# Start cloning
echo
echo "Start cloning..."
echo 

wget --no-verbose --recursive --page-requisites --mirror --level=0 --show-progress --header="Accept: text/html" \
	--user-agent="Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:21.0) Gecko/20100101 Firefox/21.0" \
	$LINK 

echo
if [ $? -eq 0 ]; then
	echo "Clone is successful!"
	exit 0
else
	echo "Clone failed! Please try again later."
	exit 4
fi
