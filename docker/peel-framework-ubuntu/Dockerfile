# Dockerfile to build a container containing the peel-framework

#TODO DEV remove this and create own image
FROM goyalzz/ubuntu-java-8-maven-docker-image
MAINTAINER  Michael Czaja <futureapplications@gmail.com>

#
RUN sudo echo "root:root" | chpasswd

# for all bundles
# bundle binaries parent
ENV BUNDLE_BIN=/wd/bundles/bin   
# bundle sources parent
ENV BUNDLE_SRC=/wd/bundles/src

# for the current bundle
# bundle groupId
ENV BUNDLE_GID=com.acme                             
# bundle artifactId  
ENV BUNDLE_AID=peel-wordcount           
# bundle root package            
ENV BUNDLE_PKG=com.acme.benchmarks.wordcount   

# Install pre-requested tools
RUN apt-get -y update && \
    apt-get -y install \ 
    openssh-client \
    openssh-server

# allows that user=root can login via ssh.
#! Root have  prevelige to login over ssh. Do we want this?
RUN mkdir -p ~/.ssh; \
    ssh-keygen -t rsa -f ~/.ssh/id_rsa -q -P ""; \
    echo "PermitRootLogin yes" >> /etc/ssh/sshd_config; \
    echo "Host *" > ~/.ssh/config && echo " StrictHostKeyChecking no" >> ~/.ssh/config ; \
    cp ~/.ssh/id_rsa.pub ~/.ssh/authorized_keys;

# Builds the experiment-enviroment
RUN mkdir -p $BUNDLE_BIN; mkdir -p $BUNDLE_SRC; cd "$BUNDLE_SRC"; \
    mvn archetype:generate -B                       \
    -Dpackage="$BUNDLE_PKG"                         \
    -DgroupId="$BUNDLE_GID"                         \
    -DartifactId="$BUNDLE_AID"                      \
    -DarchetypeGroupId=org.peelframework            \
    -DarchetypeArtifactId=peel-flinkspark-bundle    \
    -DarchetypeVersion=1.1.8;                       \
    cd "$BUNDLE_AID" && mvn clean deploy && cd "${BUNDLE_BIN}/${BUNDLE_AID}" 

 

## TODO Peel-dev | This only during dev-phase
RUN mkdir -p "${BUNDLE_BIN}/peel-wordcount/downloads/"; \
    cd "${BUNDLE_BIN}/peel-wordcount/downloads/"; \
    wget http://archive.apache.org/dist/hadoop/core/hadoop-2.7.1/hadoop-2.7.1.tar.gz

#? Is this really needed 
COPY "./docker_entrypoint.sh" "./"
RUN chmod +x "./docker_entrypoint.sh"

#COPY ./data/hadoop-2.7.1.tar.gz /wd/bundles/bin/peel-wordcount/downloads/
# RUN cd "${BUNDLE_BIN}/${BUNDLE_AID}" && ./peel.sh suite:run wordcount.default


# Waits till shut-down ()
# REF: https://stackoverflow.com/questions/31870222/how-can-i-keep-container-running-on-kubernetes  
## Will start the ssh-server to server incoming ssh-requests
CMD ["sh", "-c", "service ssh restart && tail -f /dev/null"]