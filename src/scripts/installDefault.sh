#!/usr/bin/env bash

CHECKED_DEPENDECIES=(
    curl
    git
)


DEPENDECIES_DEFAULT=(
    curl
    git
)

function installDependencie {
    for name_dependecie in ${DEPENDECIES_DEFAULT[@]}; do
        if ! dpkg -l | grep -q ${name_dependecie}; then
            sudo apt install "${name_dependecie}" -y        
        else
            echo -e "\033[1;32m Dependecie - ${name_dependecie} installed \033[0m"
        fi
    done
}

function checkedVersionDependencie {
    for name_dependecie in ${CHECKED_DEPENDECIES[@]}; do
        echo -e "\033[1;35m  ${name_dependecie} version: \033[0m"
        "${name_dependecie}" --version
    done
}

function main {
    sudo apt-get update && sudo apt-get upgrade -y
    installDependencie
    checkedVersionDependencie
}

main