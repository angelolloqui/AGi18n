#!/bin/bash

hash genstrings &> /dev/null
if [ $? -eq 1 ]; then
    echo >&2 "Xcode Command Line Tools not found. Please install them first by going to XCode -> Preferences -> Downloads and try again"
    exit 1
fi

RUBY=( `ruby --version` )
if [[ ${RUBY[1]} == *"1.8"* ]]; then 
	echo >&2 "WARNING: your ruby version installed is ${RUBY[1]} but a minimum of 1.9 is required for this tool. Please, update your ruby environment before executing agi18n commands"
fi

echo "Downloading genxibstrings..."
curl -L https://raw.github.com/angelolloqui/AGi18n/master/bin/genxibstrings > /usr/local/bin/genxibstrings
chmod +x /usr/local/bin/genxibstrings

echo "Downloading agi18n..."
curl -L https://raw.github.com/angelolloqui/AGi18n/master/bin/agi18n > /usr/local/bin/agi18n
chmod +x /usr/local/bin/agi18n

echo "Rehashing..."
hash -r

echo "Downloads complete. Try using genxibstrings or agi18n commands in your xcode project source folder"
