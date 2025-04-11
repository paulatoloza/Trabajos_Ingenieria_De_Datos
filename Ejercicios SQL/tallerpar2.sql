
create database techCorp;

use techCorp;

create table departamento(
idDepartamento int AUTO_INCREMENT PRIMARY KEY,
nombreDepartamento VARCHAR(50) NOT NULL
);

create table empleado(
idEmpleado int AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
edad int NOT NULL,
salario DECIMAL(10,2) NOT NULL,
fechaContrato DATE NOT NULL,
idDepartamento int,  
FOREIGN KEY (idDepartamento) references departamento(idDepartamento)
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
('Ana','26','3000','21-02-2020','1'),
('Alvaro','34','6000','19-08-2018','4'),
('Camilo','42','4000','02-06-2022','2'),
('Cesar','51','6000','30-12-2010','6'),
('Juliana','30','3000','22-11-2018','3'),
('Carmen','25','8000','06-03-2024','5'),
('Patricia','52','5000','17-09-2016','6'),
('Gustavo','31','4000','14-07-2023','4'),
('Juan','23','3000','03-02-2024','2'),
('Nicolas','40','6000','01-08-2013','1');

select * from empleado;

-- Muestra el nombre, edad y salario de todos los empleados de la tabla empleado.

SELECT nombre, edad, salario FROM empleado;

-- Muestra los nombres de los empleados cuyo salario es superior a 4000.

SELECT nombre FROM empleado WHERE salario > 4000;

-- Muestra los nombres de los empleados que pertenecen al departamento "Ventas". Realiza una subconsulta para obtener el idDepartamento correspondiente a "Ventas".

SELECT nombre FROM empleado WHERE idDepartamento = (SELECT idDepartamento FROM departamento WHERE nombreDepartamento = 'Ventas');

-- Muestra los nombres de los empleados cuya edad está entre 30 y 40 años (inclusive).

SELECT nombre FROM empleado WHERE edad BETWEEN 30 AND 40;

-- Muestra los nombres de los empleados que fueron contratados después del 1 de enero de 2020.

SELECT nombre FROM empleado WHERE fechaContrato > '2020-01-01';

-- Muestra el nombre de cada departamento y la cantidad total de empleados asociados a ese departamento. Utiliza un LEFT JOIN para asegurarse de que se muestren todos los departamentos, incluso aquellos sin empleados.

SELECT d.nombreDepartamento, COUNT(e.idEmpleado) AS total_empleados
FROM departamento d
LEFT JOIN empleado e ON d.idDepartamento = e.idDepartamento
GROUP BY d.idDepartamento;

-- Muestra el salario promedio de todos los empleados.

SELECT AVG(salario) AS salario_promedio FROM empleado;

-- Muestra los nombres de los empleados cuyos nombres comienzan con la letra "A" o "C".

SELECT nombre FROM empleado WHERE nombre LIKE 'A%' OR nombre LIKE 'C%';

-- Muestra los nombres de los empleados que no pertenecen al departamento "IT". Utiliza una subconsulta para obtener el idDepartamento correspondiente a "IT".

SELECT nombre FROM empleado WHERE idDepartamento != (SELECT idDepartamento FROM departamento WHERE nombreDepartamento = 'IT');

-- Muestra el nombre y salario del empleado con el salario más alto, ordenado de forma descendente y limitando el resultado a una sola fila.

SELECT nombre, salario FROM empleado ORDER BY salario DESC LIMIT 1;

/*Funciones agregadas*/

-- Muestra el nombre y salario del empleado con el salario más alto, ordenado de forma descendente y limitando el resultado a una sola fila.

SELECT nombre, salario FROM empleado WHERE salario=(SELECT MAX(salario) FROM empleado);

-- Muestra todos los registros de empleados cuyo salario esté entre 3000 y 5000 (inclusive).

select * from empleado where salario between 3000 and 5000;
