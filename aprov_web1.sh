# Actualizamos los repositorios e instalamos el NFS cliente y php

sudo apt update
sudo apt install nfs-common php php-mysql -y

# Creamos el directorio /nfs/general y montamos el del servidor NFS

sudo mkdir -p /nfs/general
sudo mount 172.80.142.78:/var/nfs/general /nfs/general

# Añadimos las siguinetes lineas en el DocumentRoot para que se dirija a esa ruta

 DocumentRoot /nfs/general/wordpress
<Directory /nfs/general/wordpress>
    Options Indexes FollowSymLinks
    AllowOverride All
    Require all granted
</Directory>