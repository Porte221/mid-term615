#!/bin/bash

# assign variables
ACTION=${1}


function delete_file(){

rm  "${1}-server.txt"
}

function create_file() {

touch "${1}-server.txt"
}

function list_file(){
 ls *.txt
}

function display_help() {

cat << EOF
Usage: ${0} {-d|--delete|-ls|--listfile|-c|--create|-h|--help} <filename>
OPTIONS:
	-c | --create  Create a new file
	-h | --help    Display the command help
	-ls| --listfile      List all .txt files 
	-d | --delete  Deletes a file,  no name deletes default
Examples:
	Create a new file:
		$ ${0} -c foo.txt
	Display help:
		$ ${0} -h
	List all files:
		$ ${0} -ls 

	Delete a file:
		$ ${0} -d filename
	 
EOF
}

case "$ACTION" in
	-ls|--listfile)
		list_file
		;;
	-c|--create)
		create_file "${2:-server.txt}"
		;;
	-d|--delete)
		delete_file "${2:-server.txt}"
		;;
	-h|--help)
		display_help 
		;;
	*)
	echo "Usage ${0} {-c|-d|-h|-ls}"
	exit 1
esac
