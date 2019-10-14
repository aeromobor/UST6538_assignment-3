#!/bin/bash

#  variables
ACTION=${1}

version="1.0.0"
 
function show_version() {
echo $version

}

function display_help(){
cat << EOF
Usage: ${0} {-r|--remove|-h|--help}

OPTIONS:
	-v | --version	Show version of script
	-r | --delete	Delete a file
	-h | --help	Display the command help

Examples:
	Display version:
		$ ${0} -v

	Delete a file:
		$ ${0} -r path-to-the-file

	Display help:
		$ ${0} -h
.
EOF
}

function delete_index_file(){
sudo systemctl stop nginx
sudo rm /usr/share/nginx/html/index.html
sudo yum remove nginx -y

}

if [ -n "$1" ];
then
	case "$ACTION" in
		-h|--help)
			display_help
			;;
		-r|--remove)
			delete_index_file "${2:-server}"
			;;
		-v|--version)
			show_version
			;;
		*)
			echo "Usage ${0} {-v|-d|-c|-h}"
			exit 1
	esac

else 
	sudo yum update -y;
	sudo yum install -y git;
	sudo amazon-linux-extras install nginx1.12 -y;
	sudo chkconfig nginx on;
	sudo aws s3 cp s3://aeromobor6538-assignment-3/index.html /usr/share/nginx/html/index.html;
	sudo service nginx start;

fi
