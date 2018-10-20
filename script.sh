#!/bin/sh

option="${1}" 
case ${option} in 
    # Stops and wipes all containers
    "clean_cons") 
      echo "Cleaning all docker-containers..."
      docker stop $(docker ps -aq)
      docker rm $(docker ps -aq)
      ;;
    "clean") 
      echo "File name is ODD"
      
      ;;  
   *)  
      echo "`basename ${0}`:"
      echo "usage: 
      PARAM 1:  
        clean_cons |  Stops all running containers and removes all containers from the system."

      exit 1 # Command to come out of the program with status 1
      ;; 
esac 