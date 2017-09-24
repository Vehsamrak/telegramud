#!/usr/bin/env bash

case $1 in
'')
    $0 start
;;

'restart')
    echo "Stopping and restarting application ..."
    docker exec -it telegramud_application pkill game
    docker restart telegramud_application
;;

'start')
    echo "Starting containers ..."
    docker-compose -f docker-compose.yml -f docker-compose-local.yml up -d
;;

'build')
    echo "Building containers ..."
    docker-compose -f docker-compose.yml -f docker-compose-local.yml up -d --build
;;

esac