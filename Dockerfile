# Utilise l'image openjdk:latest comme base
FROM openjdk:21-jdk-alpine

# Crée un répertoire pour l'application
RUN mkdir /app

# Définit le répertoire de travail
WORKDIR /app

# Copie le jar Spring Boot dans le conteneur
COPY target/cicd-0.0.1-SNAPSHOT.jar /app

# Commande à exécuter lorsque le conteneur démarre
CMD ["java", "-jar", "cicd-0.0.1-SNAPSHOT.jar"]
