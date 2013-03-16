#!/bin/bash

echo "Downloading genxibstrings..."
curl https://raw.github.com/angelolloqui/AGi18n/master/bin/genxibstrings > /usr/local/bin/genxibstrings
chmod +x /usr/local/bin/genxibstrings

echo "Downloading agi18n..."
curl https://raw.github.com/angelolloqui/AGi18n/master/bin/agi18n > /usr/local/bin/agi18n
chmod +x /usr/local/bin/agi18n

echo "Downloads complete. Close your terminal and try using genxibstrings or agi18n commands in your xcode project source folder"