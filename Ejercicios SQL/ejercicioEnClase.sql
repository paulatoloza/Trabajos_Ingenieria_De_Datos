/*Bases de datos*/
/*Consultas*/

Create database ejercicioEnClase;
/**Habilitar o usar la base de datos use nombre BD*/
USE ejercicioEnClase;

/*Crear tablas create table nombreTabla*/
create table cliente(
codigoCliente int AUTO_INCREMENT PRIMARY KEY,
nombreCliente VARCHAR(50) NOT NULL,
domicilioCliente VARCHAR(50) NOT NULL,
ciudadCliente VARCHAR(50) NOT NULL,
provinciaCliente VARCHAR(50) NOT NULL,
telefonoCliente VARCHAR(50) NOT NULL
);
describe cliente;

insert into cliente (nombreCliente , domicilioCliente, ciudadCliente, provinciaCliente, telefonoCliente)
values ('','Paula','Carrera 74', 'Bogota', 'Kennedy', '3152754204');
insert into cliente values ('','Laura','Calle 16', 'Bogota', 'Bosa', '3122754214');
insert into cliente values ('','Felipe','Calle 100', 'Bogota', 'Chapinero', '3152754204');
insert into cliente values ('','Jesus','Carrera 30', 'Bogota', 'Puente Aranda', '3152754204');

select * from cliente;
select codigo, nombre from cliente;

/* clausulua where condiones operadores logicos , aritmeticos, comparacion*/

select nombreCliente from cliente where nombreCliente = 'Paula';
select * from cliente where nombrecliente <> 'tatiana';
select * from cliente where codigoCliente >= 2;

/* Alias */

select nombre as 'Nombre Cliente', domicilioCliente as 'Direccion Cliente';

/* like not like */

select * from cliente where nombreCliente like '%a%';
select * from cliente where nombreCliente like 'a%';
select * from cliente where nombreCliente like '%a';












