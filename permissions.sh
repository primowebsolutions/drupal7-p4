#!/bin/bash

chmod -R 550 /var/www/html/*

chmod -R 755 /var/www/html/sites/default

file="/var/www/html/sites/default/settings.php"
if [ -f "$file" ]
then
	chmod 440 $file
else
	echo "$file not found."
fi

dir="/var/www/html/sites/default/files/"
if [ -f "$dir" ]
then
        chmod -R 2775 $dir
else
        echo "$dir not found."
fi

chown -R www-data:www-data /var/www/html/*
