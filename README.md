# TP4-ADMIN-BD
TP Admin BD
TP4

#1ère Partie
Docker compose + DockerFile

#2ème partie
On lance le docker-compose
On exécute sudo docker-compose exec mysql bash
Ensuite depuis le bash on configure le crontab avec la commande :
* crontab -e
On ajoute au fichier la commande : 
* 0 17 * * 1 -zcf mysqldump -u root --password=password --all-databases | gzip -9 -c > /backups/all_database`date +"\%Y-\%m-\%d_\%H-\%M-\%S"`.sql.gz

Puis on active le cron avec :
* service cron start

#3ème Partie:

