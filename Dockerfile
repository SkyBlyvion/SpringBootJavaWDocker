FROM ubuntu:latest

# update & install yes curl, zip, unzip
RUN apt-get update && apt-get install -y curl zip unzip

# ubuntu vierge il faut installer java et d'auters librairies, pour faire cela on passe via le biais d'un petit
# logiciel SDKMann permettant d'installer java et d'autres librairies.

#install sdkman
# pipe bash et source le .sdkman/bin/sdkman-init.sh, installer le sdkman sur notre systeme,
# une fois installe on le rend accesible au pass global de notre linux, en tant que variable d'environnement
RUN curl -s "https://get.sdkman.io" | bash

# add sdkman to path
ENV SDKMAN_DIR ="/root/.sdkman"
ENV PATH ="${PATH}:${SDKMAN_DIR}/bin"

# install java home
RUN bash -c "source ${SDKMAN_DIR}/bin/sdkman-init.sh && sdk use java 17.0.8-tem"

# set les var d'env de java et les ajouter au path
ENV JAVA_HOME ="${SDKMAN_DIR}/candidates/java/current"
ENV PATH="${PATH}:${JAVA_HOME}/bin"

# verif de l'install
RUN java -version