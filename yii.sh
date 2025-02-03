#!/bin/bash
read -p "Enter project name: " app_name

export YII="/usr/local/lib/yii"

/usr/local/bin/php $YII/framework/yiic.php webapp WebRoot/"$app_name"
