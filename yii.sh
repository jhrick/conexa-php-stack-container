#!/bin/bash
read -p "Enter project name: " app_name

if [ -z "$( ls -A '/var/www/html/yii/framework' )" ]; then
  mv /var/www/html/framework /var/www/html/yii/framework
fi

php yii/framework/yiic.php webapp WebRoot/$app_name