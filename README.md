# PracticaCMS

<h2>Infraestructura</h2>

<h3>VPC</h3>
Para crear la infraestructura, primero he creado una VPC asignándole un bloque CIDR 172.80.0.0/16.
![image](https://github.com/user-attachments/assets/eabca569-0d92-4acd-b8d3-e35ac84962c1)


<h3>Subredes</h3>
Después, he creado dos subredes, una pública para el balanceador (172.80.0.0/20) y otra privada para los servidores web, el nfs y el de base de datos (172.80.0.128/20) donde he asignado las dos subredes a la vpc.

<h3>Tablas de enrutamiento</h3>
A continuación, he añadido dos tablas de enrutamiento también una pública y otra privada asignándo cada una a su subred y dando salida a internet solo a la pública.

<h3>Grupos de seguridad</h3>
En los grupos de seguridad, he configurado tres, 
uno para el balanceador, con reglas para permitir tráfico entrante HTTP/HTTPS desde internet a los servidores web.
otro para la capa 2 (servidores web y nfs), con reglas que permitan tráfico HTTP/HTTPS, NFS Y MYSQL.
y otro para el servidor de base de datos con regla que permite el tráfico MYSQL y solo tenga acceso a la capa 2.

<h3>Dirección ip elástica</h3>
He creado una ip elástica asignándosela al balanceador para que tenga acceso a internet.

<h3>Instancias</h3>
Por último, he creado las instancias asignando cada una a su subred y su grupo de seguridad habiendo instalado antes los recursos necesarios para desplegar la aplicación añadidos en los scripts de aprovisionamiento:
CAPA 1
Balanceador: subred pública, gs-balanceador 

CAPA 2
Servidor Web 1: subred privada, gs-backend
Servidor Web 2: subred privada, gs-backend
NFS: subred privada, gs-backend

CAPA 3:
Servidor BBDD: subred privada, gs-bbdd
