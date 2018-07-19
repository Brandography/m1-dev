#!/usr/bin/env bash
cd ../
source ../../.env

if [ -z "$PROJECT_NAME" ]; then
    echo "
    
    Please initialize your project by typing \"make init project-name=<project name>\"
    
    "
else
    PORTS=(8080 3306 6379 1025 8025 80)
    for PORT in ${PORTS[*]}
    do
        nc -z 127.0.0.1 $PORT
        if [ $? = 0 ]; then
            echo "Port $PORT is already occupied! Please liberate."
            occupied=true
        fi
    done

    if [ "$occupied" != true ]; then
        docker-compose -p $PROJECT_NAME up -d
        echo "
        ===================== 🔗 Links 🔗 ===================

            Access your new links:

            🌎      Web server:    http://localhost/
            🛠️       PHPMyAdmin:    http://localhost:8080
            📧      Mailhog:       http://localhost:8025

        ===================== 🔗 Links 🔗 ==================="
    fi
fi