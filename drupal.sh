#!/bin/bash

cd /var/www/html
wget http://ftp.drupal.org/files/projects/drupal-7.39.tar.gz
tar -zxvf drupal-7.39.tar.gz --strip=1
rm -f drupal-7.39.tar.gz