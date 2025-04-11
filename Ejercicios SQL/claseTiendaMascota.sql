/*Lenguaje de manipulacion*/

/*Inserción: creacion de resgistros - registrar crear filas en las tablas insertar uno o varios */

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
/*crear las relaciones*/
alter table Cliente
add constraint FClienteMascota
foreign key (idMascotaFK)
references Mascota(idMascota);

alter table Producto
add constraint FKProductoCliente
foreign key (cedulaClienteFK)
references Cliente(cedulaCliente);

alter table Mascota_Vacuna
add constraint FKMV
foreign key (idMascotaFK)
references Mascota(idMascota );

alter table Mascota_Vacuna
add constraint FKVM
foreign key (codigoVacunaFK)
references Vacuna(codigoVacuna);

/* Insert sintanxis inset into nombreTabla (van los campos como los cree en la tabla) 
values (valor1, valor2,ect)*/
describe mascota;
insert into mascota (idMascota, nombreMascota, generoMascota, razaMascota, cantidad)
values (1,'Rush','macho','criollo', '1');

insert into mascota values (2,'Macarena','macho','criollo', '1');
insert into mascota values (3,'Murcielago','macho','husky', '1');
insert into mascota values (4,'lyli','Hembra','criollo', '1');
insert into mascota values(5,'dongato','macho','Angora', '1');
insert into mascota values(6,'rocky','macho','PastorAleman', '1') ;
insert into mascota values (7,'Zeus','macho','GoldenRetriever', '1');
insert into mascota values (8,'pelusa','hembra','criollo', '1');

/*Consulta general sintaxis selec *from nombreTabla*/

select * from mascota;




