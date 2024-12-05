 # Actualizamos los repositorios e instalamos NFS
 
 sudo apt update
 sudo apt install nfs-kernel-server -y
 
 # Creamos el directorio /var/nfs/general y le damos los permisos 
 
 sudo mkdir /var/nfs/general -p
 sudo chown nobody:nogroup /var/nfs/general
 sudo chmod -R 755 /var/nfs/general
 # Añadimos las ips de los servidores web y reiniciamos el servicio NFS
 
 sudo sed -i '$a /var/nfs/general    172.80.134.32(rw,sync,no_subtree_check)' /etc/exports
 sudo sed -i '$a /var/nfs/general    172.80.135.3(rw,sync,no_subtree_check)' /etc/exports
 sudo systemctl restart nfs-kernel-server
 
 # Instalamos wget y metemos el zip de wordpress en el directorio que hemos creado y lo descomprimimos dentro dandole los respectivos permisos
 
 sudo apt install wget -y
 wget https://wordpress.org/latest.zip
 sudo apt install unzip -y
 sudo mv latest.zip /var/nfs/general/
 cd /var/nfs/general/
 unzip latest.zip
 sudo unzip latest.zip
 sudo chown -R www-data:www-data wordpress/