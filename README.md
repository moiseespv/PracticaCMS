### PracticaCMS

## ÍNDICE

<h2>VPC</h2> 
<h2>SUBREDES</h2> 
<H2>TABLAS DE ENRUTAMIENTO</H2>
<h2>GRUPOS DE SEGURIDAD</h2>
<H2>DIRECCIÓN IP ELÁSTICA</H2>
<h2>INSTANCIAS</h2> 

<h3>VPC</h3>
Para crear la infraestructura, primero he creado una VPC asignándole un bloque CIDR 172.80.0.0/16.

![image](https://github.com/user-attachments/assets/0466b858-8153-4869-a6df-ce9447ef23c5)



<h3>Subredes</h3>
Después, he creado tres subredes, una pública para el balanceador (172.80.0.0/20), otra privada para los servidores web y el nfs (172.80.0.128/20) y otra para el servidor de base de datos (172.80.144.0/20). Donde he asignado las tres subredes a la vpc.

![image](https://github.com/user-attachments/assets/bc5f5be1-2121-46ce-8173-0729967196b7)

![image](https://github.com/user-attachments/assets/61840dfb-04b6-4967-b50d-3bfcb8f8f5b4)

![image](https://github.com/user-attachments/assets/8061dcb5-0070-4473-95f5-99a4ef3a2fdd)



<h3>Tablas de enrutamiento</h3>
A continuación, he añadido tres tablas de enrutamiento también una pública y dos privadas asignándo cada una a su subred y dando salida a internet solo a la pública.

![image](https://github.com/user-attachments/assets/2b46edd3-f31e-4318-9914-e9d75e80e1fe)

![image](https://github.com/user-attachments/assets/f1a8a131-fc64-4c80-9ad5-b9f4c1876fe3)

![image](https://github.com/user-attachments/assets/07b974fb-1e5c-47c1-a486-c9924ddf2cae)


<h3>Grupos de seguridad</h3>
En los grupos de seguridad, he configurado cuatro, 
uno para el balanceador, con reglas para permitir tráfico entrante HTTP/HTTPS desde internet a los servidores web.
Otro para los servidores web, con reglas que permitan tráfico HTTP/HTTPS Y MYSQL.
Otro para el NFS, que permita tráfico NFS, HTTP/HTTPS Y MYSQL.
Y otro para el servidor de base de datos con regla que permite el tráfico MYSQL y solo tenga acceso a la capa 2.


![image](https://github.com/user-attachments/assets/64261afa-5a1a-4073-8966-69bf8d8f6ad1)


![image](https://github.com/user-attachments/assets/3725910e-c9c8-4010-8104-e424ff1de325)


![image](https://github.com/user-attachments/assets/48051c3b-1d01-401b-a099-c3d6110e3894)


![image](https://github.com/user-attachments/assets/5fd299ad-2def-448c-b835-5f4f500d710c)

<h3>Dirección ip elástica</h3>
He creado una ip elástica asignándosela al balanceador para que tenga acceso a internet.


![image](https://github.com/user-attachments/assets/2af3cc13-18c0-4550-9431-7df7c6e05a54)


<h3>Instancias</h3>
Por último, he creado las instancias asignando cada una a su subred y su grupo de seguridad habiendo instalado antes los recursos necesarios para desplegar la aplicación añadidos en los scripts de aprovisionamiento:
CAPA 1
Balanceador: subred pública, gs-balanceador 


![image](https://github.com/user-attachments/assets/1ef7fb91-0cc0-4d50-867a-436d609716d0)


CAPA 2
Servidor Web 1: subred privada, gs- Servidor WEB
Servidor Web 2: subred privada, gs- Servidor WEB
NFS: subred privada, gs- NFS


![image](https://github.com/user-attachments/assets/d56da306-31d8-4a6a-b314-dc45c848cc52)


![image](https://github.com/user-attachments/assets/51de8db6-1c5a-4cee-a5c2-bcec32a4c35f)


![image](https://github.com/user-attachments/assets/ac9af62e-11b3-404c-a55e-9ea4bfc10967)


CAPA 3:
Servidor BBDD: subred privada, gs-bbdd


![image](https://github.com/user-attachments/assets/3076c0c3-e2d5-4b60-8c88-e118acaba409)
