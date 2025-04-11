create database Distribucion;

USE Distribucion;

/*crear tablas*/
create table Camioneros(
idCamionero int AUTO_INCREMENT PRIMARY KEY,
nomCamionero VARCHAR(20) NOT NULL,
telCamionero VARCHAR(20) NOT NULL,
dirCamionero VARCHAR(30) NOT NULL,
fechaRegistro timestamp default current_timestamp
);

create table camion(
placa int AUTO_INCREMENT PRIMARY KEY,
modCamion VARCHAR(20) NOT NULL,
potCamion VARCHAR(20) NOT NULL,
tipoCamion VARCHAR(30) NOT NULL,
fechaRegistro timestamp default current_timestamp
);

create table paquete(
codPaquete int AUTO_INCREMENT PRIMARY KEY,
descripPaquete VARCHAR(10) NOT NULL,
destiPaquete VARCHAR(10) NOT NULL,
dirPaquete VARCHAR(30) NOT NULL,
fechaRegistro timestamp default current_timestamp
);

create table ciudad(
codCiudad int AUTO_INCREMENT PRIMARY KEY,
nomCiudad VARCHAR(20) NOT NULL,
fechaRegistro timestamp default current_timestamp
);

create table detalleConduce(
idDetalleConduce int AUTO_INCREMENT PRIMARY KEY,
placa INT NOT NULL,
idCamionero INT NOT NULL,
fechaRegistro timestamp default current_timestamp
);


describe ciudad
