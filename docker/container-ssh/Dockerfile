# Dockerfile to build a container containing the peel-framework

#TODO DEV remove this and create own image
FROM goyalzz/ubuntu-java-8-maven-docker-image
MAINTAINER  Michael Czaja <futureapplications@gmail.com>
        
#
RUN sudo echo "root:docker" | chpasswd

# Install pre-requested tools
RUN apt-get -y update && \
    apt-get -y install \ 
    openssh-client \ 
    openssh-server



# TODO replace the real PermiteRootLogin options !!! This is config, This goes on top
RUN mkdir -p ~/.ssh; \
    ssh-keygen -t rsa -f ~/.ssh/id_rsa -q -P ""; \
    echo "PermitRootLogin yes" >> /etc/ssh/sshd_config; \
    echo "Host *" > ~/.ssh/config && echo " StrictHostKeyChecking no" >> ~/.ssh/config ; \
    cp ~/.ssh/id_rsa.pub ~/.ssh/authorized_keys; \
    service ssh restart


COPY "./docker_entrypoint.sh" "./"
RUN chmod +x "./docker_entrypoint.sh"

#COPY ./data/hadoop-2.7.1.tar.gz /wd/bundles/bin/peel-wordcount/downloads/
# RUN cd "${BUNDLE_BIN}/${BUNDLE_AID}" && ./peel.sh suite:run wordcount.default


# Waits till shut-down ()
# REF: https://stackoverflow.com/questions/31870222/how-can-i-keep-container-running-on-kubernetes  

CMD ["sh", "-c", "service ssh restart && tail -f /dev/null"]
