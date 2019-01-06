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

SERVER="apache2"        # Default apache2
DATABASE="mysql"        # Default mysql
FRAMEWORK="laravel"     # Default laravel
PHPV="7.2"              # Default PHP version
VERBOSE=false           # Default false
RESPONSE=               # User response


validate_parameters()
{
    while [ "$1" != "" ]; do
        case $1 in -s | -S | --server )

            shift

            if [[ $1 == "apache2" || $1 == "nginx" ]]; then
                SERVER=$1
            else
                echo -e "${RED}Wrong server given: ${RESET}$1"
                echo -e "${LYELLOW}Valid options: ${RESET}apache2, nginx"
                exit 1
            fi
            ;;

            -d | -D | --database )

            shift

            if [[ $1 == "mysql" || $1 == "mariadb" ]]; then
                DATABASE=$1
            else
                echo -e "${RED}Wrong database given: ${RESET}$1"
                echo -e "${LYELLOW}Valid options: ${RESET}mysql, mariadb, postgress"
                exit 1
            fi
            ;;

            -f | -F | --framework )
        
            shift

            if [[ $1 == "laravel" ]]; then
                FRAMEWORK=$1
            else
                echo -e "${RED}Wrong framework given: ${RESET}$1"
                echo -e "${LYELLOW}Valid options: ${RESET}laravel"
                exit 1
            fi
            ;;

            -pv | -PV | --phpv )
        
            shift
            
            if [[ $1 == "7.2" ]]; then
                PHPV=$1
            else
                echo -e "${RED}Wrong PHP version given: ${RESET}$1"
                echo -e "${LYELLOW}Valid options: ${RESET}7.2"
                exit 1
            fi
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
}

install_packages()
{
    echo -e "${LGREEN}Installing packages...${RESET}"
}


# if first parameter is help, show help doc and ignore the following given commands
if [[ $1 == "--help" || $1 == "-h" ]]; then
    # TODO: Write helping doc
    echo "Helping"

else

    # Using default preset parameters and notify it
    if [[ $# -eq 0 ]]; then

        echo -en "${BYELLOW}Warning:${RESET}"
        echo -e "${YELLOW} Working with default parameters.${RESET}"

    else
        
        validate_parameters $*

    fi

    echo -e "${GREEN}The following packages are going to be installed:"
    echo -en "${LGREEN}"
    echo -e "  * $SERVER"
    echo -e "  * $DATABASE"
    echo -e "  * PHP v${PHPV}"
    echo -e "  * $FRAMEWORK"
    echo -e "${RESET}"

    echo -en "${YELLOW}Confirm installation?${RESET} (Y/N) > "

    read RESPONSE

    if [[ $RESPONSE != "Y" && $RESPONSE != "y" && $RESPONSE != "yes" && $RESPONSE != "YES" ]]; then
        echo -e "${LYELLOW}Nothing was installed.${RESET}"
        echo -e "${CYAN}Bye!${RESET}"
        exit 1
    else
        
        install_packages

    fi

fi
