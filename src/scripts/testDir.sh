#!/usr/bin/env bash
DIR_DOWNLOAD="$HOME/Downloads"
DIR_DOWNLOAD_ANT="$HOME/Downloads/ant"

LIST_DIR=(
    $HOME/workspace
    /opt/jdk
)

function makeDir {
    for name_directory in ${LIST_DIR[@]};do
        if ! ls -lda $DIR_DOWNLOAD/*/ | grep -q ${name_directory} ;then
            mkdir -p "$name_directory"
            echo -e "\033[1;32m Diretorio ${name_directory} criado \033[0m"
        else
            echo -e "\033[1;33m Diretorio ${name_directory} ja existente \033[0m"
        fi
    done
}

function removeDir {
    for name_directory in ${LIST_DIR[@]};do
        if ls -lda $DIR_DOWNLOAD/*/ | grep -q ${name_directory} ;then
            rm -rf "${name_directory}"
            echo -e "\033[1;32m Diretorio ${name_directory} removido com sucesso \033[0m"
        else
            echo -e "\031[1;33m Diretorio ${name_directory} nao foi removido \033[0m"
        fi                          
    done
}
function main {
    # makeDir
    removeDir
}

main