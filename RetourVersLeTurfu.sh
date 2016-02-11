#!/bin/bash

## Repertoire source
DIRECTORY='/home';
## Repertoire de destination qui contiendra les sous-repertoires de destination
BACKUP_DIRECTORY='/srv/backup';
## Adresse de la machine distante
REMOTE_ENGINE='root@192.168.194.200';
NEW_DIRECTORY=$BACKUP_DIRECTORY/3;

## On créé 4 répertoires 0,1,2,3 dans le repertoire /srv/backup de la machine distante s'ils n'existent pas
ssh $REMOTE_ENGINE mkdir -p $BACKUP_DIRECTORY/{0..3};
## On sauvegarde le repertoire '/home' dans le repertoire /srv/backup/3 de la machine distante
rsync -arP --delete $DIRECTORY $REMOTE_ENGINE:$NEW_DIRECTORY;
## On change le nom de chaque dossier en incrémentant de 1
for (( i=3 ; i>=0; i-- ))
do
  dest=$(($i+1));
  ssh $REMOTE_ENGINE mv $BACKUP_DIRECTORY/$i $BACKUP_DIRECTORY/$dest;
done
## On garde seulement les dossier 0, 1 et 2
NEW_DIRECTORY=$BACKUP_DIRECTORY/4;
ssh $REMOTE_ENGINE "mv $NEW_DIRECTORY $BACKUP_DIRECTORY/0 && rm -rf $BACKUP_DIRECTORY/3"
