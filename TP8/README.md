### 1ère étape :
--------------------
- Création du serveur maridadb, prometheus et mysql-exporter depuis le docker-compose
- On les relis
  
### 2ème étape :
--------------------
- Maintenant que les serveurs sont reliés entre eux, on peut accéder à prometheux depuis le localhost:9090.
- Je créé une table USERS que je donne comme source à mysql exporter : 'DATA_SOURCE_NAME: root:password@(maria-master:3306)/USERS'
- On à plus qu'à donner au graph de prométheus quelles commande survéiller, par exemple la commande 'SELECT'.
- ça donne : mysql_global_status_commands_total{command="select"}.
### 3ème étape :
---------------------
- Suite à cela on peut obtenir différents graphiques suivant les commandes surveillées, j'ai donc simulé moi même des select et des insert sur la table. On obtient ensuite le graph situé dans le dossier graph-screenshots: graph-écriture-lecture
- Pour finir on va générer un graph du taux de variation sur l'écriture et la lecture pour cela il suffit de changer les commande sur prometheus : rate(mysql_global_status_commands_total{command="select"}[5m]). On fait de même pour les autres autre commandes.
- Et donc on obtiens le graph situé dans le dossier graph-screenshots: rate-écriture-lectur.
