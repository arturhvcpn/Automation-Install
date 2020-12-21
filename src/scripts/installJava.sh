#!/usr/bin/env bash
$URL_JAVA="https://drive.google.com/file/d/19hymvBjvA9Glt1Ydtmk2sPXLkBhwf8U3/view?usp=sharing"
$DIR_DOWNLOAD_JAVA="$HOME/Downloads/java"
$FILE_ID="19hymvBjvA9Glt1Ydtmk2sPXLkBhwf8U3"
$FILE_NAME="jdk-8u261-linux-x64.tar.gz"


# SO for small file run following command on your terminal:
# wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=${FILE_ID}' -O ${FILE_NAME}
# In the above command change the ${FILE_ID} by above id extracted and rename ${FILE_NAME} for your own simple use.
# For lagre file run the following command with necessary changes in ${FILE_ID} and ${FILE_NAME}:
wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate ´https://docs.google.com/uc?export=download&id=${FILE_ID}´ -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=${FILE_ID}" -O ${FILE_NAME} -P ${DIR_DOWNLOAD_JAVA} && rm -rf /tmp/cookies.txt

#it's work
wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=19hymvBjvA9Glt1Ydtmk2sPXLkBhwf8U3' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=19hymvBjvA9Glt1Ydtmk2sPXLkBhwf8U3" -O jdk-8u261-linux-x64.tar.gz && rm -rf /tmp/cookies.txt




https://drive.google.com/file/d/19hymvBjvA9Glt1Ydtmk2sPXLkBhwf8U3/view?usp=sharing
# function main {
#     mkdir "$DIR_DOWNLOAD_JAVA"
    
# }

# main