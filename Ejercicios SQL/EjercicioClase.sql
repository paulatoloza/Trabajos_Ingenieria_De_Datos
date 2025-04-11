/* Lenguaje de Definición de Datos DDL */
/*1. crear BD create Crear estructuras BD Tablas vistas procedimientos almacenados indices*/
/* Crear BD create database nombredeBD*/
Create database viajesURosario;

Create database tienda;

/**Habilitar o usar la base de datos use nombre BD*/
USE tienda;

/*Crear tablas create table nombreTabla*/
create table cliente(
idCliente int AUTO_INCREMENT PRIMARY KEY,
documentoCliente varchar(50) not null,
nombreCliente VARCHAR(50) NOT NULL,
emailCliente VARCHAR(50) NOT NULL,
telefonoCliente VARCHAR(50) NOT NULL,
direccionCliente text,
fechaRegistro timestamp default current_timestamp
);

create table pedido(
idPedido int AUTO_INCREMENT PRIMARY KEY,
idClienteFK INT NOT NULL,
idProductoFK int not null,
fechaPedido date NOT NULL,
totalPedido decimal(10,2) NOT NULL, 
estado enum('Pendiente','Enviado','Entregado','Cancelado') default 'Pendiente',
fechaRegistro timestamp default current_timestamp,
foreign key (idProductoFK) references Producto(idProducto) on delete cascade on update cascade
);

create table product(
idProducto int AUTO_INCREMENT PRIMARY KEY,
codigoProducto varchar(50) not null,
nombreProducto VARCHAR(50) NOT NULL,
precioProducto decimal(10,2)not NULL,
stock int default 0,
fechaCreacion timestamp default current_timestamp
);

/* consultar la estructura de las tablas describe nombreTabla */
describe pedido;

/*Modificar estructuras alter table */
/*agregar una columna un campo alter table nombreTabla add column nombredelcampo restricciones*/
alter table product add column descripcionProducto varchar(50) not null;

/* modificar tipo de dato alter table nombretabla modify column nombrecampo elnuevotipodato*/

alter table product modify column precioProducto decimal(12,2);

/*Renombrar una tabla alter table nombreTabla rename to nuevoNombre*/
alter table product rename to Producto;

/*Eliminar tablas drop table nombreTabla*/
drop table pedido;
/*Eliminar BD Drop database NombreBD*/
drop database viajesurosario;
/*Eliminar todos los registros de una tabla truncate table nombreTabla*/
truncate table pedido;
/* crear relaciones*/

/*Cliente-pedido*/
alter table pedido add constraint FKclientPed 
foreign key (idClienteFK) references cliente (idCliente);