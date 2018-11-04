#!/bin/sh
cwd=$(pwd)


#goal_build_run_jump <gjb> 
hot() {
  echo "Running function hot()"
  docker kill $(docker ps -q)
  docker rm $(docker ps -a -q)
  echo "  *Containers are killed and removed"

  jumpLocation="$HOME/wd/master_db-framework/docker/peel-framework-ubuntu"
  cd $jumpLocation
  docker build -t mtest .
  docker run --mount type=bind,source=/home/me/wd/vols,target=/wd --name mtest -d mtest
  docker exec -it mtest bash
  cd $cwdd
}

option="${1}" 
case ${option} in 
    # Stops and wipes all containers
    "hot")
    echo $cwd "+++2"
    hot
    ;;
    "cl_con")
      docker kill $(docker ps -q)
      docker rm $(docker ps -a -q)
      echo "  *Containers are killed and removed"
    ;;
    "me")
      echo "hello"
    ;;
    "clean") 
      echo "File name is ODD"
    ;;  
    "bpfu") 
      echo "(╯°□°)╯ bpfu is running.#. "
      docker build -t mtest -f "./docker/peel-framework-ubuntu/Dockerfile" .
    ;; 
    *)  
      # Prints the default usage with explains which parameters could be used
      echo "`basename ${0}`:"
      echo "Don't understand you ¯\_(ツ)_/¯ --- Check the usage-section:"
      echo " 
      PARAM 1:  
        cl_con |  Stops all running containers and removes all containers from the system.
        bpfu       |  Builds the dockerfile from ./docker/peel-framework-ubuntu/Dockerfile"
      

      exit 1 # Command to come out of the program with status 1
      ;; 
esac 


  