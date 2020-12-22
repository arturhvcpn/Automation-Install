#!/usr/bin/env bash

CHECKED_DEPENDECIES=(
    docker
)

DEPENDENCIES_DEFAULT=(
    docker.io
)

SYSTEM_MANAGER=(
    start
    enable
)
# sudo apt remove docker docker-engine docker.io

function installDockerDependencie {
    for name_dependecie in ${DEPENDENCIES_DEFAULT[@]}; do
        if ! dpkg -l | grep -q ${name_dependecie}; then
            sudo apt install "${name_dependecie}" -y        
        else
            echo -e "\033[1;32m Dependecie - ${name_dependecie} installed \033[0m"
        fi
    done
}

function checkedDockerVersionDependencie {
    for name_dependecie in ${CHECKED_DEPENDECIES[@]}; do
        echo -e "\033[1;35m  ${name_dependecie} version: \033[0m"
        "${name_dependecie}" version
    done
}

function enableDockerAutoStarted {
    for command_manager in ${SYSTEM_MANAGER[@]}; do
        echo -e "\033[1;35m Systemctl Response ${command_manager}: \033[0m"
        sudo systemctl ${command_manager} ${CHECKED_DEPENDECIES} 
    done
}


function main {
    sudo apt-get update && sudo apt-get upgrade -y
    installDockerDependencie
    checkedDockerVersionDependencie
    enableDockerAutoStarted
}


main