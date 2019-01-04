#!/usr/bin/env bash
CYAN="\e[96m"
YELLOW="\e[33m"
RED="\e[91m"
BYELLOW="\e[43m"
LYELLOW="\e[93m"
LGREEN="\e[92m"
GREEN="\e[32m"
RESET="\e[0m"

echo -e "${CYAN}Web Environment Installer v0.1${RESET}\n"

SERVER="apache2"		# Default apache2
DATABASE="mysql"		# Default mysql
FRAMEWORK="laravel"		# Default laravel
PHPV="7.2"				# Default PHP version
VERBOSE=false			# Default false
RESPONSE=				# User response

# if first parameter is help, show help doc and ignore the following given commands
if [[ $1 == "--help" || $1 == "-h" ]]; then
	# TODO: Write helping doc
	echo "Helping"
elif [[ 1 ]]; then

	# Using default preset parameters and notify it
	if [[ $# -eq 0 ]]; then

		echo -en "${BYELLOW}Warning:${RESET}"
		echo -e "${YELLOW} Working with default parameters.${RESET}"

	elif [[ 1 ]]; then
		
		while [ "$1" != "" ]; do
		    case $1 in -s | -S | --server )

				shift
				SERVER=$1
				;;

		        -d | -D | --database )

				shift
				DATABASE=$1
				;;

		        -f | -F | --framework )
			
				shift
				FRAMEWORK=$1
				;;

				-pv | -PV | --phpv )
			
				shift
				PHPV=$1
				;;

				-v | -V | --verbose )
			
				VERBOSE=true
				;;

		        * ) 
				
				echo -e "${RED}Wrong parameter given: ${RESET}$1"
				exit 1
		    esac
		    shift
		done

	fi

	echo -e "${GREEN}The following packages are going to be installed:"
	echo -en "${LGREEN}"
	echo -e "  * $SERVER"
	echo -e "  * $DATABASE"
	echo -e "  * PHP v${PHPV}"
	echo -e "  * $FRAMEWORK"
	echo -e "${RESET}"

	echo -en "${YELLOW}Confirm installation?${RESET} (Y/N) >"

	read RESPONSE

	if [[ $RESPONSE != "Y" ]]; then
		echo -e "${LYELLOW}Nothing was installed.${RESET}"
		echo -e "${CYAN}Bye!${RESET}"
		exit 1
	else
		echo "YES!!!!"
	fi

fi
