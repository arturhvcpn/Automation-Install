#!/usr/bin/env bash
function main {    
    source scripts/installDefault.sh
    source scripts/installNode.sh    
    source scripts/installYarn.sh
    source scripts/installProtractor.sh
}

main