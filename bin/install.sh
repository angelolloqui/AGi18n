#!/bin/bash

echo "Downloading genxibstrings..."
curl -sS https://raw.github.com/angelolloqui/AGi18n/utf8-encoding/bin/genxibstrings > /usr/local/bin/genxibstrings
chmod +x /usr/local/bin/genxibstrings

echo "Downloading agi18n..."
curl -sS https://raw.github.com/angelolloqui/AGi18n/utf8-encoding/bin/agi18n > /usr/local/bin/agi18n
chmod +x /usr/local/bin/agi18n

echo "Downloading agconv..."
curl -sS https://raw.github.com/angelolloqui/AGi18n/utf8-encoding/bin/agconv > /usr/local/bin/agconv
chmod +x /usr/local/bin/agconv

echo "Rehashing..."
hash -r

echo "Downloads complete. Try using genxibstrings or agi18n commands in your xcode project source folder"
