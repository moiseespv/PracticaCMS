# PracticaCMS

<h2>Infraestructura</h2>

<h3>VPC</h3>
Para crear la infraestructura, primero he creado una VPC asignándole un bloque CIDR 192.168.100.0/24.

<h3>Subredes</h3>
Después, he creado dos subredes, una pública para el balanceador (192.168.100.0/25) y otra privada para los servidores web, el nfs y el de base de datos (192.168.100.128/25) donde he asignado las dos subredes a la vpc.

<h3>Tablas de enrutamiento</h3>
A continuación, he añadido dos tablas de enrutamiento también una pública y otra privada asignándo cada una a su subred y dando salida a internet solo a la pública.


