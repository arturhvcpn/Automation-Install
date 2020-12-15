#!/usr/bin/env bash
CHECKED_DEPENDECIES=(
    protractor
    jasmine
    colors    
    jasmine-spec-reporter
    protractor-beautiful-reporter
)
DEPENDECIES_PROTRACTOR=(
    protractor
    jasmine
    colors
)

DEPENDECIES_PROTRACTOR_DEV=(
    jasmine-spec-reporter
    protractor-beautiful-reporter
)
# KEY_WORDS_WEBDRIVER=(
#     update
#     start
# )

# webdriver-manager update
# webdriver-manager start


sudo apt-get update && sudo apt-get upgrade -y

function installDependencie {
    for name_dependecie in ${DEPENDECIES_PROTRACTOR[@]}; do
        if ! npm list -g | grep -q ${name_dependecie}; then
            sudo npm install -g "${name_dependecie}" -y
        else
            echo -e "\033[1;32m Dependecie - ${name_dependecie} installed \033[0m"
        fi
    done
}

function installDependencieDev {
    for name_dependecie in ${DEPENDECIES_PROTRACTOR_DEV[@]}; do
        if ! npm list -g | grep -q ${name_dependecie}; then
	        npm install -g "${name_dependecie}" --save-dev
        else
            echo -e "\033[1;34m Dev Dependecie - ${name_dependecie} installed  \033[0m"
        fi
    done
}

function checkedVersionDependencie {
    for name_dependecie in ${CHECKED_DEPENDECIES[@]}; do
        echo -e "\033[1;35m  ${name_dependecie} version: \033[0m"
        npm view "${name_dependecie}" version        
    done
}

function main {
    sudo apt-get update && sudo apt-get upgrade -y
    installDependencie
    installDependencieDev
    checkedVersionDependencie
}

main