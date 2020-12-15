#!/usr/bin/env bash
CHECKED_DEPENDECIES=(
    nodejs
    npm
)


DEPENDECIES_NODE=(
    nodejs
)

function installDependencie {
    for name_dependecie in ${DEPENDECIES_NODE[@]}; do
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
    curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo apt-get update && sudo apt-get upgrade -y
    installDependencie
    checkedVersionDependencie
}

main