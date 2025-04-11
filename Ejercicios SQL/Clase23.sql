/*Sentencias de DDL*/
/*Creacion de base de datos*/
create database TiendaMascota;
/*Habilitar la base de datos*/
use TiendaMascota;
/*Creacion de tablas*/
create table Mascota(
idMascota int primary key,
nombreMascota varchar (15),
generoMascota varchar (15),
razaMascota varchar (15),
cantidad int (10)
);
create table Cliente(
cedulaCliente int primary key,
nombreCliente varchar (15),
apellidoCliente varchar (15),
direccionCliente varchar (10),
telefono int (10),
idMascotaFK int
);
create table Producto(
codigoProducto int primary key,
nombreProducto varchar (15),
marca varchar (15),
precio float,
cedulaClienteFK int
);
create table Vacuna(
codigoVacuna int primary key,
nombreVacuna varchar (15),
dosisVacuna int (10),
enfermedad varchar (15)
);
create table Mascota_Vacuna(
codigoVacunaFK int,
idMascotaFK int,
enfermedad varchar (15)
);

insert into Mascota (idMascota, nombreMascota, generoMascota, razaMascota, cantidad) values
('1', 'Lulu', 'F', 'Criollo','1'),('2', 'Pepe', 'M', 'Pitbull','1');

insert into Cliente(cedulaCliente, nombreCliente, apellidoCliente, direccionCliente, telefono) values
('100000', 'Antonio', 'Galvis', 'Calle 100','3152754201'),('100001', 'Gloria', 'Perez', 'CRA 74','3162542102');

insert into Vacuna(codigoVacuna, nombreVacuna, dosisVacuna, enfermedad) values
('1010', 'Parvovirus', '2', 'parvovirus'),('1001', 'Rabia', '3', 'Rabia');

insert into Producto(codigoProducto,nombreProducto,marca,precio) values
('1212', 'Correa', 'Laika', '5000'),('1213', 'Cama para perro', 'Pets', '10000');
 
 insert into Mascota_Vacuna (enfermedad) values
 ('Parvo'), ('rabia');
 
 

/*Consulta multiptabla*/
select m.*, c.nombreCliente
from mascota m 
right join c on m.idmascota=c.MascotaFK group by m.nombreMacota;

select m.*, c.nombreCliente, p.nombreProducto
from Mascota ma
join cliente c on m.idMascota=c.idMascotaFK
join producto p on p.cedulaClienteFK=c.cedulaCliente;

delete from producto where codigoProducto=11;
describe producto;
delete from producto;

select * from Mascota;



DELIMITER // 
create procedure insertarMascota(in idMascota int, nombreMascota varchar (15), generoMascota varchar(15), cantidad int)
begin 
 insert into mascota values (idMascota, nombreMascota, generoMascota, razaMascota, cantidad);


end//
DELIMITER ;
 call insertarMascota('5','Zanahoria','F','Criollo','1')
 
 DELIMITER // 
create procedure consultarPrecio(out precio float)
begin 
 select count(*) into precio from producto;

end//
DELIMITER ;
call consultarPrecio(@resultado);
select @resultado;

-- prodedimiento para insertar registros en tabla debil
DELIMITER // 
create procedure insertaMascotaV(in enfermedad varchar(15))
begin 
  insert into Mascota_Vacuna values (enfermedad);


end//
DELIMITER ;
 call insertaMascotaV('Moquillo');
 
 
select nombreMascota, enfermedad from Mascota_Vacuna  mv
inner join mascota m on m.idMascota = mv.idMascotaFK;
 
select * from mascota;
select * from mascota_vacuna;
-- consultar las vacunas que se le ha aplicado a una mascota
-- y que enfermedad esta afectando
