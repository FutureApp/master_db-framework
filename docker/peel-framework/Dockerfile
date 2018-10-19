# Dockerfile to build a container containing the peel-framework
FROM maven:3.5-ibmjava-8-alpine
MAINTAINER  Michael Czaja <futureapplications@gmail.com>

# for all bundles
# bundle binaries parent
ENV BUNDLE_BIN=~/bundles/bin   
# bundle sources parent
ENV BUNDLE_SRC=~/bundles/src

# for the current bundle
# bundle groupId
ENV BUNDLE_GID=com.acme                             
# bundle artifactId  
ENV BUNDLE_AID=peel-wordcount           
# bundle root package            
ENV BUNDLE_PKG=com.acme.benchmarks.wordcount   

RUN mkdir -p $BUNDLE_BIN; mkdir -p $BUNDLE_SRC; cd "$BUNDLE_SRC"; \
    mvn archetype:generate -B                     \
    -Dpackage="$BUNDLE_PKG"                       \
    -DgroupId="$BUNDLE_GID"                       \
    -DartifactId="$BUNDLE_AID"                    \
    -DarchetypeGroupId=org.peelframework          \
    -DarchetypeArtifactId=peel-flinkspark-bundle  \
    -DarchetypeVersion=1.1.8;
RUN cd "$BUNDLE_AID"; mvn clean deploy; 

# Waits till shut-down ()
# REF: https://stackoverflow.com/questions/31870222/how-can-i-keep-container-running-on-kubernetes   
CMD ["sh", "-c", "tail -f /dev/null"]