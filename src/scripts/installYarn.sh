#!/usr/bin/env bash

CHECKED_DEPENDECIES=(
    nodemon
    create-react-app
    expo
    expo-cli
    react-native
)

DEPENDECIES_YARN=(
    nodemon
    create-react-app
    expo
    expo-cli
    react-native
    react-native-cli
)

function installDependencie {
    for name_dependecie in ${DEPENDECIES_YARN[@]}; do
        if ! yarn global list | grep -q ${name_dependecie}; then
            yarn global add "${name_dependecie}" -y        
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