# Actualizamos los repositorios e instalamos apache

sudo apt update 
sudo apt install apache2 -y

# Habilitamos los servicios de balanceo y reiniciamos apache

sudo a2enmod proxy proxy_balancer proxy_http lbmethod_byrequests
sudo systemctl restart apache2

# Añadimos las siguientes líneas dentro del fichero de configuración del balanceador para que se dirija hacia los servidores web

sudo bash -c 'cat > /etc/apache2/sites-available/loadbalancer.conf <<EOF
   <VirtualHost *:80>
    <Proxy balancer://mycluster>
    #Server 1
        BalancerMember http://172.80.134.32
    #Server 2
        BalancerMember http://172.80.135.3
    </Proxy>

    # Redirección del tráfico al cluster
    ProxyPass / balancer://mycluster/
</VirtualHost>
EOF'

# Deshabilitamos el fichero por defecto, habilitamos el del balanceador y reiniciamos el apache

sudo a2dissite 000-default.conf
sudo a2ensite loadbalancer.conf
sudo a2enmod rewrite
sudo systemctl restart apache2

# Instalamos core para poder configurar el certbot y funcione el dominio

 sudo snap install core
 sudo snap refresh core
 sudo apt remove certbot -y
 sudo snap install --classic certbot
 sudo ln -fs /snap/bin/certbot /usr/bin/certbot
 sudo certbot --apache