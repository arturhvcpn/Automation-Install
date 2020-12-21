#!/usr/bin/env bash

URL_ANT="https://drive.google.com/file/d/1Mee-FvAytMwXlFM3x_a3lJkG-6ocUI61/view?usp=sharing"
DIR_DOWNLOAD="$HOME/Downloads"
DIR_DOWNLOAD_ANT="$HOME/Downloads/ant"
FILE_ID="1Mee-FvAytMwXlFM3x_a3lJkG-6ocUI61"
FILE_NAME="apache-ant-1.10.9-bin.tar.gz"


# SO for small file run following command on your terminal:
# wget --no-check-certificate `https://docs.google.com/uc?export=download&id=${FILE_ID}` -O ${FILE_NAME}
# In the above command change the ${FILE_ID} by above id extracted and rename ${FILE_NAME} for your own simple use.
# For lagre file run the following command with necessary changes in ${FILE_ID} and ${FILE_NAME}:
# wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate ´https://docs.google.com/uc?export=download&id=${FILE_ID}´ -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=${FILE_ID}" -O ${FILE_NAME} -P ${DIR_DOWNLOAD_JAVA} && rm -rf /tmp/cookies.txt

#it's work
# wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=19hymvBjvA9Glt1Ydtmk2sPXLkBhwf8U3' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=19hymvBjvA9Glt1Ydtmk2sPXLkBhwf8U3" -O jdk-8u261-linux-x64.tar.gz && rm -rf /tmp/cookies.txt
function makeDir {
    if ! ls -lda $DIR_DOWNLOAD/*/ | grep -q ant/ ;then
        mkdir -p "$DIR_DOWNLOAD_ANT"
        echo -e "\033[1;32m Diretorio ${DIR_DOWNLOAD_ANT} criado \033[0m"
    else
        echo -e "\033[1;33m Diretorio ${DIR_DOWNLOAD_ANT} ja existente \033[0m"
    fi
}

function changeDir {
    cd "$DIR_DOWNLOAD_ANT";
}

function downloadAnt {
    wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1Mee-FvAytMwXlFM3x_a3lJkG-6ocUI61' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=19hymvBjvA9Glt1Ydtmk2sPXLkBhwf8U3" -O $FILE_NAME && rm -rf /tmp/cookies.txt
}

function main {
    sudo apt-get update && sudo apt-get upgrade -y
    makeDir
    changeDir
    downloadAnt
}

main