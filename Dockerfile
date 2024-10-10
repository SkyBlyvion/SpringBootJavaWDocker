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
ENV SDKMAN_DIR="/root/.sdkman"
ENV PATH="${PATH}:${SDKMAN_DIR}/bin"

# install java home
RUN bash -c "source ${SDKMAN_DIR}/bin/sdkman-init.sh && sdk install java 17.0.8-tem"

# set les var d'env de java et les ajouter au path
ENV JAVA_HOME="${SDKMAN_DIR}/candidates/java/current"
ENV PATH="${PATH}:${JAVA_HOME}/bin"

# verif de l'install
RUN java -version

# installation de gradle
Run bash -c "source ${SDKMAN_DIR}/bin/sdkman-init.sh && sdk install gradle"

# variables d'env add graddle to path
ENV GRADDLE_HOME="${SDKMAN_DIR}/candidates/graddle/current"
ENV PATH="${PATH}:${GRADDLE_HOME}/bin"

# installation du springboot cli
RUN bash -c "source ${SDKMAN_DIR}/bin/sdkman-init.sh && sdk install springboot"

# variables d'env add springboot cli to path
ENV SPRING_HOME="${SDKMAN_DIR}/candidates/springboot/current"
ENV PATH="${PATH}:${SPRING_HOME}/bin"

# Verify Spring Boot CLI installation
RUN spring --version

# Set the working directory for the application
WORKDIR /app

# Initialize a Spring Boot application with the specified dependencies
RUN spring init --dependencies=web,data-jpa,thymeleaf,mariadb,devtools,webflux ./

# Expose necessary ports for the application
EXPOSE 8181 35729