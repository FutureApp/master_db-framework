# Dockerfile to build a container containing the peel-framework
FROM maven:3.5-ibmjava-8-alpine
MAINTAINER  Michael Czaja <futureapplications@gmail.com>


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
RUN apk update && \
    apk add \ 
    openssh \
    openrc   

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

#TODO DEV Will execute the simple test execution
RUN mkdir -p "${BUNDLE_BIN}/download"; cd "${BUNDLE_BIN}/download"; \ 
    wget http://archive.apache.org/dist/hadoop/core/hadoop-2.7.1/hadoop-2.7.1.tar.gz
# RUN cd "${BUNDLE_BIN}/${BUNDLE_AID}" && ./peel.sh suite:run wordcount.default
# Waits till shut-down ()
# REF: https://stackoverflow.com/questions/31870222/how-can-i-keep-container-running-on-kubernetes  

EXPOSE 80 443 22
CMD ["sh", "-c", "tail -f /dev/null"]