
# Construction du projet

- On crée un Dockerfile
- On crée un docker-compose.yml
- On docker compose up --build
- Notre init dependencies a pas fonctionné donc on le passe dans le terminal :
docker exec -it immo spring init --dependencies=web,data-jpa,thymeleaf,mariadb,devtools,webflux ./



## Pour la Documentation JAVA, https://www.jmdoudoux.fr/java/dej/index.htm

### Securité BDD :
- command: --default-authentication-plugin=mysql_native_password