create database tech;

use tech;

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
idCargoFK int,
FOREIGN KEY (IdCargoFK) references cargo(idCargo),
FOREIGN KEY (idDepartamentoFK) references departamento(idDepartamento)
);

describe empleado;

insert into departamento (nombreDepartamento) values
('Ventas'), 
('IT'),
('Recursos Humanos'),
('Produccion'),
('Calidad'),
('Marketing');

insert into empleado (nombre, edad, salario, fechaContrato, idDepartamento) values
('Ana','26','3000','2023-08-21','1'),
('Alvaro','34','6000','2018-09-18','4'),
('Camilo','42','4000','2022-03-19','2'),
('Cesar','51','6000','2010-12-30','6'),
('Juliana','30','3000','2016-05-06','3'),
('Carmen','25','8000','2023-03-10','5'),
('Patricia','52','5000','2013-11-22','6'),
('Gustavo','31','7000','2023-07-04','4'),
('Juan','23','3000','2025-03-01','2'),
('Nicolas','40','6000','2018-01-16','1');

insert into Cargo(idCargo, nombreCargo, rangoCargo, descripcionCargo) values
('1','Vendedora','3','Encargada de los clientes nuevos'),
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

-- Muestra todos los registros de la tabla empleado donde el idDepartamento es 2 o 6, es decir, los empleados que pertenecen a los departamentos con estos identificadores.

select * from empleado where idDepartamento in (2,6);

-- Muestra todos los campos de la tabla empleado y agrega una columna calculada que muestra los años desde la fecha de contrato de cada empleado hasta el año 2025. Esto indica cuántos años lleva trabajando cada empleado hasta esa fecha.

select *, (2025-fechaContrato) from empleado;

-- Muestra el nombre, la fecha de contrato y la cantidad de días trabajados por cada empleado hasta la fecha actual. Utiliza la función timestampdiff para calcular la diferencia en días entre fechaContrato y la fecha actual (curdate()).

select nombre, fechaContrato , timestampdiff(day, fechaContrato, curdate()) as 'dias trabajados' 
from empleado;

-- Muestra los tres empleados con los salarios más altos, ordenados en orden descendente.

select * from empleado order by salario desc limit 3;

-- Muestra el nombre, salario, los años trabajados (calculados a partir de la fecha de contrato) y un bono del 10% del salario para los empleados que tienen más de 5 años de antigüedad en la empresa.

select nombre, salario, timestampdiff(year, fechaContrato, curdate()) as 'años trabajados' , salario * 0.1 as 'bono' 
from empleado where (timestampdiff(year, fechaContrato, curdate()))>5;

-- Muestra la cantidad de empleados que ganan más que el salario promedio de todos los empleados. Utiliza una subconsulta para calcular el salario promedio.

select count(*) as 'empleados que ganan mas del salario promedio' from empleado 
where salario>(select avg(salario) from empleado);

-- Muestra el nombre de cada departamento junto con la cantidad de empleados que pertenecen a cada departamento. Ordena los departamentos por el número de empleados en orden descendente.

select nombreDepartamento,(select count(*) from empleado where idDepartamento=idDepartamento) 
as 'cantidad empleado' from departamento order by (select count(*) from empleado where idDepartamento=idDepartamento) desc;

-- Muestra el nombre, salario y los años trabajados de los empleados que tienen la mayor cantidad de años trabajados y el salario más alto. Solo muestra los primeros 5 resultados, ordenados por salario en orden descendente.

select nombre, salario, timestampdiff(year, fechaContrato, curdate()) as 'años trabajados' from empleado 
where (timestampdiff(year, fechaContrato, curdate()))> (select max(timestampdiff(year, fechaContrato, curdate())) as 'mayor años'
from empleado) and salario >= (select max(salario)from empleado) order by salario desc limit 5;

/*having*/

-- Muestra los departamentos que tienen 5 o más empleados. Utiliza GROUP BY para agrupar por idDepartamento y la cláusula HAVING para filtrar los departamentos con al menos 5 empleados.

select idDepartamento, count(*) as 'total empleados' from empleado group by idDepartamento having count(*)>=5;

/*modificacion*/

-- Actualiza el nombre del empleado con idEmpleado igual a 1, cambiándolo a "Gabriel".

update empleado set nombre = 'Gabriel' where idEmpleado = 1;

/*delete eliminar*/


/*Muestre los nombres de los empledos y los nombres de los departamentos a los que pertenecen*/

select nombre, nombreDepartamento from departamento inner join empleado
on departamento.idDepartamento = empleado.idDepartamentoFK;

select nombre, rangoCargo from cargo inner join empleado 
on empleado.idCargoFK=cargo.idCargo

/*hacer una consulta de tosos los rangos que tenga un rango especifico
mostrar en pantalla los empleados que teng un crago especifico
los empleados que tienen mas de 3 años en la empresa que  departamento pertencen uqe cragp tinene y cuanto ganan
nombre del epleado fecha en la que contrato departamento en la que esta contratado años de antiguedad crago que tiene actual mente y rango
mostrar todos los departamentos que no tengan ampleados asignados
mostrar todos los cargos que no tengan empleados asignados*/