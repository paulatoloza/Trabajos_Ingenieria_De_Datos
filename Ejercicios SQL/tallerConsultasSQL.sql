
create database techCorp;

use techCorp;

create table departamento(
idDepartamento int AUTO_INCREMENT PRIMARY KEY,
nombreDepartamento VARCHAR(50) NOT NULL,
);

/*Crear tablas create table nombreTabla*/
create table empleado(
idEmpleado int AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
edad int NOT NULL,
salario DECIMAL(2,10) NOT NULL,
fechaContrato DATE NOT NULL,
idDepartamento int,  
FOREIGN KEY (idDepartamento) references departamento(idDepartamento)
);

insert into departamento (nombreDepartamento) values
('Ventas'), 
('IT'),
('Recursos Humanos'),
('Produccion'),
('Calidad'),
('Marketing');

inser into empleado (nombre, edad, salario, fechaContrato, idDepartamento) values
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

/*1. Lista de empleados: Obtén los nombres, edades y salarios de todos los empleados de TechCorp.*/
SELECT nombre, apellido, edad, salario FROM empleado;

-- 2. Altos ingresos: ¿Quiénes son los empleados que ganan más de $4,000?
SELECT nombre, apellido FROM empleado WHERE salario > 4000;

-- 3. Fuerza de ventas: Extrae la lista de empleados que trabajan en el departamento de Ventas.
SELECT nombre, apellido FROM empleado WHERE idDepartamento = (SELECT idDepartamento FROM departamento WHERE nombreDepartamento = 'Ventas');

-- 4. Rango de edad: Encuentra a los empleados que tienen entre 30 y 40 años.
SELECT nombre, apellido FROM empleado WHERE edad BETWEEN 30 AND 40;

-- 5. Nuevas contrataciones: ¿Quiénes han sido contratados después del año 2020?
SELECT nombre, apellido FROM empleado WHERE fechaContrato > '2020-01-01';

-- 6. Distribución de empleados: ¿Cuántos empleados hay en cada departamento?
SELECT d.nombreDepartamento, COUNT(e.idEmpleado) AS total_empleados
FROM departamento d
LEFT JOIN empleado e ON d.idDepartamento = e.idDepartamento
GROUP BY d.idDepartamento;

-- 7. Análisis salarial: ¿Cuál es el salario promedio en la empresa?
SELECT AVG(salario) AS salario_promedio FROM empleado;

-- 8. Nombres selectivos: Muestra los empleados cuyos nombres comienzan con "A" o "C".
SELECT nombre, apellido FROM empleado WHERE nombre LIKE 'A%' OR nombre LIKE 'C%';

-- 9. Departamentos específicos: Encuentra a los empleados que no pertenecen al departamento de IT.
SELECT nombre, apellido FROM empleado WHERE idDepartamento != (SELECT idDepartamento FROM departamento WHERE nombreDepartamento = 'IT');

-- 10. El mejor pagado: ¿Quién es el empleado con el salario más alto?
SELECT nombre, apellido, salario FROM empleado ORDER BY salario DESC LIMIT 1;






