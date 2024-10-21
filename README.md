# Daemonix

**Daemonix** est un panel de gestion de serveurs de jeux et d'applications, conçu pour être simple et puissant. Contrairement à d'autres panels comme Pterodactyl, Daemonix inclut également des fonctionnalités de gestion d'emails et d'hébergement de sites web.

## Fonctionnalités

- Gestion complète des serveurs de jeux et d'applications.
- Support de l'hébergement de sites web.
- Gestion intégrée des emails.
- Interface simple et moderne.
- Installation facile via un script automatisé.

## Prérequis

Avant de commencer l'installation, assurez-vous que votre serveur réponde aux exigences suivantes :

- **Système d'exploitation** : Linux (Ubuntu recommandé)
- **Serveur Web** : Nginx
- **Git** : Pour cloner le dépôt
- **PHP** : Pour l'exécution des scripts
- **Accès root** : Nécessaire pour certaines commandes d'installation

## Installation

Pour installer Daemonix, suivez ces étapes simples :

### 1. Lancer le script d'installation

Exécutez la commande suivante dans votre terminal pour installer Daemonix :

```bash
bash <(curl -s https://raw.githubusercontent.com/olligatorugef/Deamonix/install/install_script.sh)
```

Cela mettra à jour votre système, installera les dépendances nécessaires, et configurera Nginx pour héberger Daemonix.

2. Accéder à l'interface d'installation

Une fois l'installation terminée, vous pourrez accéder à l'interface d'installation via votre navigateur en visitant l'URL suivante :
```
http://<votre-IP>:1143
```

Remplacez <votre-IP> par l'adresse IP de votre serveur.

Mise à jour

Pour mettre à jour Daemonix, exécutez la commande suivante :

```
cd /var/www/html/daemonix
git pull origin main
systemctl restart nginx
```

Cela mettra à jour les fichiers et redémarrera Nginx pour prendre en compte les modifications.

Support et contributions

Si vous rencontrez des problèmes ou si vous avez des suggestions, n'hésitez pas à ouvrir une issue sur ce dépôt GitHub. Les contributions sont également les bienvenues !

1. Forkez le projet


2. Créez votre branche de fonctionnalités (git checkout -b feature/ma-fonctionnalité)


3. Commitez vos modifications (git commit -m 'Ajout de ma fonctionnalité')


4. Poussez votre branche (git push origin feature/ma-fonctionnalité)


5. Créez une Pull Request



License

Daemonix est distribué sous la licence MIT License.

### Explication des sections :

1. **Titre et description** : Introduction à ce qu'est **Daemonix**.
2. **Fonctionnalités** : Un résumé des fonctionnalités principales.
3. **Prérequis** : Ce dont l'utilisateur a besoin pour installer Daemonix.
4. **Installation** : La commande `bash` pour installer Daemonix directement depuis GitHub.
5. **Mise à jour** : Instructions pour maintenir le panel à jour.
6. **Support et contributions** : Comment les utilisateurs peuvent obtenir de l'aide ou contribuer au projet.
7. **Licence** : Référence à la licence utilisée.
