# TP4-ADMIN-BD


# 1ère Partie
-------------
* Créer le docker-compose.yml
* Puis:
 * docker-compose build
 * docker-compose up
 * docker-compose exec mysql bash
   * /# mysql -uroot -p
   - mysql > CREATE DATABASE PLAYER;
   - mysql > use PLAYER;
   - mysql > create table NATIONN (id int NOT NULL AUTO_INCREMENT, name VARCHAR(40), PRIMARY    KEY (id));
mysql > insert into products(name) values ("Madeleine");
mysql > insert into products(name) values ("Fourme d'Ambert");
mysql > insert into products(name) values ("Flan");
mysql > exit
/# mysqldump -uroot -p Shop > /backups/shop.sql.gz
/# exit
$docker-compose exec maria bash
/# mariadb -uroot -p
mariabd >  create database shop
mariabd > exit
/# mariadb -uroot -p shop < /backups/shop.sql.gz
/# mariadb -uroot -p
mariadb > use shop
mariadb > show tables;
mariadb > select * from products;
