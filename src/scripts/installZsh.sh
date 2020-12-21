#!/usr/bin/env bash

# $LINK_RAW_OHMYZSH="$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# $LINK_RAW_ZINIT="$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"

CHECKED_DEPENDENCIES=(
    git
    curl
    zsh
)

DEPENDENCIES_DEFAULT=(
    git
    curl
    zsh
)


function installDependencie {
    for name_dependecie in ${DEPENDENCIES_DEFAULT[@]}; do
        if ! dpkg -l | grep -q ${name_dependecie}; then
            sudo apt install "${name_dependecie}" -y
        else
            echo -e "\033[1;32m Dependecie - ${name_dependecie} installed \033[0m"
        fi
    done
}

function checkedDependencie {
    for name_dependecie in ${DEPENDENCIES_DEFAULT[@]}; do
        echo -e "\033[1;35m  ${name_dependecie} version: \033[0m"
        "${name_dependecie}" --version
    done
}

function cloneRawOhMyZsh {
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

function cloneRawZInit {
    #echo -e "\033[1;32m zinit após instalar clicar na opção n e clonar o repositório do spaceship \033[0m"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
}

function cloneSpaceShip {
    git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
}
function linkSpaceshipPrompt {
    ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme" 
}
function setDefaultZsh {
    chsh -s $(which zsh)
}

function main {
    sudo apt-get update && sudo apt-get upgrade -y
    installDependencie
    checkedDependencie
    cloneRawOhMyZsh
    cloneRawZInit
    cloneSpaceShip
    linkSpaceshipPrompt
    setDefaultZsh
}
main