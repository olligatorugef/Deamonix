#!/bin/bash

# Variables
GITHUB_REPO="https://github.com/ton-utilisateur/ton-depot.git" # Remplace par l'URL de ton dépôt
INSTALL_DIR="/var/www/html/daemonix" # Répertoire où le site sera installé
NGINX_CONF="/etc/nginx/sites-available/daemonix" # Fichier de configuration Nginx

# Vérifier si l'utilisateur est root
if [ "$EUID" -ne 0 ]; then
  echo "Veuillez exécuter ce script en tant que root"
  exit
fi

echo "Mise à jour des paquets du système..."
apt update -y && apt upgrade -y

# Vérifier et installer Git si nécessaire
if ! command -v git &> /dev/null; then
    echo "Git n'est pas installé. Installation de Git..."
    apt install git -y
fi

# Installer Nginx
if ! command -v nginx &> /dev/null; then
    echo "Installation de Nginx..."
    apt install nginx -y
fi

# Clonage du dépôt GitHub
if [ ! -d "$INSTALL_DIR" ]; then
    echo "Clonage du dépôt GitHub..."
    git clone $GITHUB_REPO $INSTALL_DIR
else
    echo "Le dépôt existe déjà dans $INSTALL_DIR. Mise à jour des fichiers..."
    git -C $INSTALL_DIR pull
fi

# Configuration de Nginx pour Daemonix
echo "Configuration de Nginx pour Daemonix..."
cat <<EOF > $NGINX_CONF
server {
    listen 1143;
    server_name localhost;

    root $INSTALL_DIR;
    index install.php;

    location / {
        try_files \$uri \$uri/ /install.php?\$query_string;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php7.x-fpm.sock;
    }

    location ~ /\.ht {
        deny all;
    }
}
EOF

# Activer la configuration Nginx
ln -sf $NGINX_CONF /etc/nginx/sites-enabled/
nginx -t && systemctl restart nginx

# Vérifier et installer UFW si nécessaire et ouvrir le port 1143
if ! command -v ufw &> /dev/null; then
    echo "UFW n'est pas installé. Installation de UFW..."
    apt install ufw -y
fi

# Activer UFW et ouvrir le port 1143
ufw allow 1143/tcp
ufw reload

# Obtenir l'IP de la machine
IP=$(hostname -I | awk '{print $1}')

# Afficher l'URL d'installation
echo "Installation terminée. Accédez à l'installation de Daemonix à l'adresse : http://$IP:1143"
