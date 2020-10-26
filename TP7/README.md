### TP7 CLusters
## 1ère étape

Après avoir créé les 3 mariadb:

 - Dans `docker-compose.yml`:

   - Dans le premier node on rajoute : `command: --wsrep-new-cluster`

 - Pour chaque nodes on met la config `/etc/mysql/conf.d/galera.cnf` et on leur donne un non distinct

- On obtient: 
````conf
[mysqld]
wsrep_node_address="first.localhost"

wsrep_node_name="node1"
wsrep_cluster_address="gcomm://first.localhost,second.localhost,third.localhost"

wsrep_provider=/usr/lib/libgalera_smm.so
binlog_format=ROW
default_storage_engine=InnoDB
innodb_autoinc_lock_mode=2
innodb_doublewrite=1
query_cache_size=0
wsrep_on=ON
````
### 2ème étape

  - Afin de lancer le cluster on link : `/var/lib/mysql/grastate.dat` au premier container (node1).

````conf
# GALERA saved state
version: 2.1
uuid:    1664c21c-1217-11eb-8160-0ecd0cb2593d
seqno:   -1

# Ce paramètre doit être égual à 1 avant chanque lancement
safe_to_bootstrap: 1
````
  - Ensuite au lancement les nodes se connectent entre eux.
On verifie grace à la commande suivant:
````
MariaDB [ok]> SHOW GLOBAL STATUS LIKE 'wsrep_cluster_size';
+--------------------+-------+
| Variable_name      | Value |
+--------------------+-------+
| wsrep_cluster_size | 3     |
+--------------------+-------+
1 row in set (0.001 sec)

MariaDB [ok]> 
````