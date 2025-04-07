
create database BDDataVerse;

use BDDataVerse;

create table sensores (
idSensor int auto_increment primary key,
ubicacion varchar(50) not null,
tipoSensor varchar(50) not null, 
fechaInstalacion date not null
);

create table registroSensores(
idRegistroSensores int auto_increment primary key,
idSensorFK int,
valor varchar(50) not null,
fechaRegistroSensores timestamp default current_timestamp,
idUsuarioFK int, 
foreign key (idUsuarioFK) references usuario(idUsuario),
foreign key (idSensorFK) references sensores(idSensor)
);

create table transporte(
idTransporte int auto_increment  key,
tipoTransporte varchar(50) not null,
capacidad int not null
);

create table usuario(
idUsuario int auto_increment primary key,
nombreUsuario varchar(50) not null,
emailUsuario varchar(50)not null,
telefonoUsuario decimal (10,2) not null,
idTransporteFK int,
idConsumoFK int, 
idSeguridadFK int,
foreign key (idConsumoFK) references consumo(idConsumo),
foreign key (idSeguridadFK) references seguridad(idSeguridad),
foreign key (idTransporteFK) references transporte(idTransporte)
);
 
create table consumo(
idConsumo int auto_increment primary key,
zona varchar(50) not null,
consumoKW varchar(50)not null,
fechaConsumo date not null
);

create table seguridad(
idSeguridad int auto_increment primary key,
tipoSeguridad varchar(50) not null,
descripcion varchar(50)not null,
fechaHora datetime not null,
ubicacion varchar(50)not null
);

insert into sensores(ubicacion,tipoSensor,fechaInstalacion)values
('centro', 'climatico','2020-04-20'),('centro', 'climatico','2020-04-20'),('centro', 'climatico','2020-04-20'),('centro', 'climatico','2020-04-20'),('centro', 'climatico','2020-04-20');
insert into registroSensores(idRegistroSensores,idSensorFK,valor,idUsuarioFK)values
('centro', 'climatico','2020-04-20'),('centro', 'climatico','2020-04-20'),('centro', 'climatico','2020-04-20'),('centro', 'climatico','2020-04-20'),('centro', 'climatico','2020-04-20');
insert into transporte (idTransporte,tipoTransporte,capacidad) values
('centro', 'climatico','2020-04-20'),('centro', 'climatico','2020-04-20'),('centro', 'climatico','2020-04-20'),('centro', 'climatico','2020-04-20'),('centro', 'climatico','2020-04-20');
insert into usuarios(idUsuario,nombreUsuario,emailUsuario,telefonoUsuario,idTransporteFK,idConsumoFK,idSeguridadFK) values
('centro', 'climatico','2020-04-20'),('centro', 'climatico','2020-04-20'),('centro', 'climatico','2020-04-20'),('centro', 'climatico','2020-04-20')('centro', 'climatico','2020-04-20');
insert into consumo(idConsumo,zona,consumoKW,fechaConsumo) values
('centro', 'climatico','2020-04-20'),('centro', 'climatico','2020-04-20'),('centro', 'climatico','2020-04-20'),('centro', 'climatico','2020-04-20'),('centro', 'climatico','2020-04-20');
insert into seguridad(idSeguridad,tipoSeguridad,descripcion,fechaHora,ubicacion)values
('centro', 'climatico','2020-04-20'),('centro', 'climatico','2020-04-20'),('centro', 'climatico','2020-04-20'),('centro', 'climatico','2020-04-20'),('centro', 'climatico','2020-04-20');

-- 7
select zona, AVG(consumoKW) from consumo;

select c.nombreUsuario, s.zona, avg(consumoKW) from usuario 
join consumo c on u.idConsumoFK = c.idConsumo

DELIMITER //
create procedure insertarRegistroSensor(in idRegistroSensores int,in idSensorFK int, in valor varchar(50), in idUsuarioFK int)
begin 
insert into registroSensores()
 