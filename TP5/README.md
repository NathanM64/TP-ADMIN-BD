# TP4-ADMIN-BD


# 1ère Partie
-------------
* Créer le docker-compose.yml
* Puis:
 * docker-compose build
 * docker-compose up
 # 2ème Partie
 ---

 * docker-compose exec mysql bash
   * /# mysql -uroot -p
     - mysql > CREATE DATABASE PLAYER;
     - mysql > use PLAYER;
     - mysql > create table NATIONN (id int NOT NULL AUTO_INCREMENT, name VARCHAR(40), PRIMARY    KEY (id));
     - mysql > insert into NATION (name) values ("FRANCE");
     - mysql > insert into NATION (name) values ("PORTUGAL");
     - mysql > insert into NATION (name) values ("ESPAGNE");
     - mysql > exit
    * /# mysqldump -uroot -p PLAYER > /backups/backup.sql
    * /# exit
* docker-compose exec maria bash
  * /# mariadb -uroot -p
	* mariabd >  create database PLAYER
	* mariabd > exit
  * /# mariadb -uroot -p PLAYER < /backups/PLAYER.sql
  * /# mariadb -uroot -p
      * mariadb > use PLAYER
      * mariadb > show tables;
      * mariadb > select * from PLAYER;


