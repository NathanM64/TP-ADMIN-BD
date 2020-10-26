### 1ère étape :
--------------------
- Création du docker-compose.yml
  - Définir les 2 services, soient mariadb-master et mariadb-slaver
  - leurs attribuer une image, environnement, volume et healthcheck à chaque services
  
### 2ème étape :
--------------------
- Ajouter l'utilisateur master:
     - ` MARIADB_REPLICATION_MODE=master`
     - ` MARIADB_REPLICATION_USER=repl_user`
     - ` MARIADB_USER=my_user`
     - ` MARIADB_DATABASE=my_database`
     - ` ALLOW_EMPTY_PASSWORD=yes`
     - ` MARIADB_ROOT_PASSWORD=my_root_password`
     
- Ajouter l'utilisateur Slave: 
     - `MARIADB_REPLICATION_MODE=slave`
     - `MARIADB_REPLICATION_USER=repl_user`
     - `MARIADB_USER=my_user`
     - `MARIADB_DATABASE=my_database`
     - `MARIADB_MASTER_HOST=mariadb-master`
     - `MARIADB_MASTER_PORT_NUMBER=3306`
     - `MARIADB_MASTER_ROOT_PASSWORD=my_root_password`
     - `ALLOW_EMPTY_PASSWORD=yes`
    
### 3ème étape :
---------------------
- On vérifie que la réplication
  - `docker-compose up -d`
  - `docker-compose exec mariadb-master bash`
    - `mariadb -umy_user`
    - `Use my_database`
    - `Create table users (firstname VARCHAR(50))`
    - `exit`
  - `exit`
  - `docker-compose exec mariadb-slave bash`
    - `mariadb -umy_user`
    - `Show databases` => {my_database}
    - `Use my_database; Show Tables;` => {tableTest}
  - Les tables s'affichent mais uniquement en lecture seule 
