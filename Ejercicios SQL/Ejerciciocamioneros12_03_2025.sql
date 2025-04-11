create database camioneros;
use camioneros;
create table camionero(
idCamionero int auto_increment PRIMARY KEY,
nombreCamionero varchar(20) not null,
telefonoCamionero varchar(20) not null,
direccionCamionero varchar(30) not null
);

create table paquete (
codigoPaquete int auto_increment PRIMARY KEY,
descripcionPaquete varchar(20) not null,
destinatarioPaquete varchar(20) not null,
direccionPaquete varchar(30) not null,
codigoCiudadFK int not null,
idCamionero int not null
);

create table ciudad (
codigoCiudad int auto_increment PRIMARY KEY,
nombreCiudad varchar(20) not null
);

create table detalleConduce (
idDetalleC int auto_increment PRIMARY KEY,
placaFK int not null,
idCamionero int not null
);

create table camion (
placa int auto_increment PRIMARY KEY,
modelo varchar(20) not null,
potencia varchar(20) not null,
tipoCamion varchar(30) not null
);
