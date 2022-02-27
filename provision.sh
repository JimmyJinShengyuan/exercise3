sudo amazon-linux-extras install nginx1.12 -y;
ps ax | grep nginx | grep -v grep;
sudo service nginx start ;
sudo chkconfig nginx on ;
sudo aws s3 cp s3://rclc-assignment-webserver/index.html/usr/share/nginx/html/index.html;
#!/bin/bash 
 
# assign variables 
verson=1.0.0

function delete_file() {
sudo chkconfig nginx off
rm -rf /usr/share/nginx/html
sudo yum remove nginx -y
}

function show_version() {
touch "$version"
}
function display_help() {
 
cat << EOF 
Usage: ${0} {-h|--help|-d|--delete|-v|--version}
 
OPTIONS: 
	-h | --help Display the command help
	-d | --delete Delete
	-v | --version version
 
Examples: 
	Delete:
		$ ${0} -d 
	version:
		$ ${0} -v
	Display help: 
		$ ${0} -h 
 
EOF
} 
 
case "$ACTION" in 
	-h|--help) 
		display_help 
		;; 
	-d|--delete)
		delete_file
		;;
	-v|--version)
		show_version "$version"
	*) 
	echo "Usage ${0} {-v|-h|-d}" 
	exit 1
esac 
