
create database techCorp;

use techCorp;

create table departamento(
idDepartamento int AUTO_INCREMENT PRIMARY KEY,
nombreDepartamento VARCHAR(50) NOT NULL
);

create table cargo(
idCargo VARCHAR (50) PRIMARY KEY,
nombreCargo VARCHAR (50) NOT NULL,
rangoCargo VARCHAR (50) NOT NULL,
descripcionCargo VARCHAR (50) NOT NULL
);

create table empleado(
idEmpleado int AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
edad int NOT NULL,
salario DECIMAL(10,2) NOT NULL,
fechaContrato DATE NOT NULL,
idDepartamentoFK int,  
idCargoFK VARCHAR (50),
FOREIGN KEY (IdCargoFK) references cargo(idCargo),
FOREIGN KEY (idDepartamentoFK) references departamento(idDepartamento)
);

describe empleado;
describe cargo;
describe departamento;


insert into departamento (nombreDepartamento) values
('Ventas'), 
('IT'),
('Recursos Humanos'),
('Produccion'),
('Calidad'),
('Marketing');

insert into empleado (nombre, edad, salario, fechaContrato, idDepartamentoFK, IdCargoFK) values
('Ana','26','3000','2023-08-21','1','1'),
('Alvaro','34','6000','2018-09-18','4','2'),
('Camilo','42','4000','2022-03-19','2','3'),
('Cesar','51','6000','2010-12-30','6','4'),
('Juliana','30','3000','2016-05-06','3','5'),
('Carmen','25','8000','2023-03-10','5','6'),
('Patricia','52','5000','2013-11-22','6','7'),
('Gustavo','31','7000','2023-07-04','4','8'),
('Juan','23','3000','2025-03-01','2','9'),
('Nicolas','40','6000','2018-01-16','1','10');

insert into Cargo (idCargo, nombreCargo, rangoCargo, descripcionCargo) values
('11','Vendedora','3','Encargada de los clientes nuevos'),
('2','Asistente','1','Encargado de la fabricacion de productos'),
('3','Analista','2','Encargado del analisis de base de datos'),
('4','Publicista','4','Encragado deL area de Marketing'),
('5','Psicologa','2','Encargada de las entrevista de los aspirantes'),
('6','Analista','3','Encargasda de la gestion de los nuevos productos'),
('7','Desarrolladora de publicidad','3','Encargada del desarrollo de publicidad'),
('8','Jefe de Produccion','5','encargado de la gestion de el area de Produccion'),
('9','Desarrollar web','3','encragado de la gestion de la gestion web'),
('10','Jefe de ventas','5','Encargadodel area de ventas');

select * from empleado;

SELECT nombre, edad, salario FROM empleado;

SELECT nombre FROM empleado WHERE salario > 4000;

SELECT nombre FROM empleado WHERE idDepartamento = (SELECT idDepartamento FROM departamento WHERE nombreDepartamento = 'Ventas');

SELECT nombre FROM empleado WHERE edad BETWEEN 30 AND 40;

SELECT nombre FROM empleado WHERE fechaContrato > '2020-01-01';

SELECT d.nombreDepartamento, COUNT(e.idEmpleado) AS total_empleados
FROM departamento d
LEFT JOIN empleado e ON d.idDepartamento = e.idDepartamento
GROUP BY d.idDepartamento;

SELECT AVG(salario) AS salario_promedio FROM empleado;

SELECT nombre FROM empleado WHERE nombre LIKE 'A%' OR nombre LIKE 'C%';


SELECT nombre FROM empleado WHERE idDepartamento != (SELECT idDepartamento FROM departamento WHERE nombreDepartamento = 'IT');

SELECT nombre, salario FROM empleado ORDER BY salario DESC LIMIT 1;




/*Funciones agregadas*/

SELECT nombre, salario FROM empleado WHERE salario=(select MAX(salario) FROM empleado);

select * from empleado where salario between 3000 and 5000;

select * from empleado where idDepartamento in (2,6);

select *, (2025-fechaContrato) from empleado;

select nombre, fechaContrato , timestampdiff(day, fechaContrato, curdate()) as 'dias trabajados' 
from empleado;

select * from empleado order by salario desc limit 3;

select nombre, salario, timestampdiff(year, fechaContrato, curdate()) as 'años trabajados' , salario * 0.1 as 'bono' 
from empleado where (timestampdiff(year, fechaContrato, curdate()))>5;

select count(*) as 'empleados que ganan mas del salario promedio' from empleado 
where salario>(select avg(salario) from empleado);

select nombreDepartamento,(select count(*) from empleado where idDepartamento=idDepartamento) 
as 'cantidad empleado' from departamento order by (select count(*) from empleado where idDepartamento=idDepartamento) desc;

select nombre, salario, timestampdiff(year, fechaContrato, curdate()) as 'años trabajados' from empleado 
where (timestampdiff(year, fechaContrato, curdate()))> (select max(timestampdiff(year, fechaContrato, curdate())) as 'mayor años'
from empleado) and salario >= (select max(salario)from empleado) order by salario desc limit 5;

/*having*/

select idDepartamento, count(*) as 'total empleados' from empleado group by idDepartamento having count(*)>=5;

/*modificacion*/

update empleado set nombre = 'Gabriel' where idEmpleado = 1;

/*delete eliminar*/


/*Muestre los nombres de los empledos y los nombres de los departamentos a los que pertenecen*/

select nombre, nombreDepartamento from empleado inner join departamento
on empleado.idDepartamentoFK= departamento.idDepartamento;


select rangoCargo, nombre from empleado inner join cargo
on empleado.idCargoFK = cargo.idCargo;



/*hacer una consulta de tosos los rangos que tenga un rango especifico
mostrar en pantalla los empleados que teng un crago especifico
los empleados que tienen mas de 3 años en la empresa que  departamento pertencen uqe cragp tinene y cuanto ganan
nombre del epleado fecha en la que contrato departamento en la que esta contratado años de antiguedad crago que tiene actual mente y rango
mostrar todos los departamentos que no tengan ampleados asignados
mostrar todos los cargos que no tengan empleados asignados*/

