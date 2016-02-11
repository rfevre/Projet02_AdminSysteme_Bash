# Projet 2 - Administration systeme
## RetourVersLeTurfu - Système de backup incrémental
### Par FEVRE Rémy (et avec l'aide de LELEU Julien) - DA2I 2015/2016

---
# Fonctionnalités :

- [x] Sauvegarde
  - [ ] Seulement les nouvelles données depuis la derniéres sauvegarde
  - [x] Seulement 3 sauvegardes par utilisateur
  - [ ] Nouvelle sauvegarde toute les 5 minutes
- [ ] Récupération sauvegarde

---
# Fonctionnement de la sauvegarde

Deux machines virtuelles ont été utilisées, un client et un serveur de backup :
- Le script de backup doit être lancé depuis la machine client,
- Chaque commande utilise ssh,
- Si les dossier 0, 1, et 2 n'existent pas ils sont alors créés, le repertoire de backup est aussi créé,
- On sauvegarde dans un dossier '3',
- On incrémente de 1 le nom de chaque dossier,
- On renomme le dossier '4' en '0', qui est la version la plus récente,
- On supprime le dossier '3', qui est la version la plus ancienne,
- On obtient donc les dossiers '0', '1' et '2', du plus récent au plus ancien.
# Projet02_AdminSysteme_Bash
