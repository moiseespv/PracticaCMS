#Actualizamos los repositorios e instalamos mysql-server

sudo apt-get update
sudo apt-get install -y mysql-server


# Como usuario root, entramos en la base de datos, creamos un usuario con su contraseña y le atribuimos todos los privilegios

sudo mysql
CREATE DATABASE WordPressBD DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
CREATE USER 'UsuarioWordPress'@'172.80.134.32' IDENTIFIED BY '1234';
CREATE USER 'UsuarioWordPress'@'172.80.135.3' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON WordPressBD.* TO 'UsuarioWordPress'@'172.80.134.32';
GRANT ALL PRIVILEGES ON WordPressBD.* TO 'UsuarioWordPress'@'172.80.135.3';
FLUSH PRIVILEGES;

# Dentro del fichero mysqld.cnf cambiamos el bind-address de 0.0.0.0 a la ip de la máquina 

sudo sed -i "s/^bind-address[[:space:]]*=.*/bind-address = 172.80.147.50/" /etc/mysql/mysql.conf.d/mysqld.cnf

#Reiniciamos el servicio mysql para que se guarden todos los cambios

sudo systemctl restart mysql