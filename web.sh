#!/usr/bin/env bash
CYAN="\e[96m"
RESET="\e[0m"

echo -e "$CYAN Web Environment Installer v0.1 $RESET"

SERVER="apache"			# Default apache2
DATABASE="mysql"		# Default mysql
FRAMEWORK="laravel"		# Default laravel
PHPV="7.2"				# Default PHP version
VERBOSE=true			# Default true


if [[ $1 == "--help" || $1 == "-h" ]]; then
	echo "Helping"
fi

if [[ $VERBOSE ]]; then
	echo "YUJU!"
fi