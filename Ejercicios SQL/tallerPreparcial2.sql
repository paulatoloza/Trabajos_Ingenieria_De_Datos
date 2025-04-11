create database preParcial;

use preParcial;

create table clientes (
idCliente int auto_increment primary key,
nombreCliente varchar(50) not null,
emailCliente varchar(50)  not null
);

create table libros (
idLibro int auto_increment primary key,
titulo varchar(50) not null,
autor varchar(50),
precio decimal(10,2) not null,
stock int not null
);

create table pedidos (
idPedido int auto_increment primary key,
idClienteFK int not null,
fechaPedido date not null,
foreign key (idClienteFK) references clientes(idCliente)
);
create table detallePedido (
idDetallePedido int auto_increment primary key,
idPedidoFK int,
idLibroFK int,
cantidad int not null,
foreign key (idPedidoFK) references pedidos(idPedido),
foreign key (idLibroFK) references libros(idLibro)
);

insert into clientes (nombreCliente, emailCliente) values
('juan pérez', 'juan@example.com'),
('ana gómez', 'ana@example.com'),
('luis torres', 'luis@example.com');

-- libros
insert into libros (titulo, autor, precio, stock) values
('el principito', 'antoine de saint-exupéry', 25.00, 10),
('cien años de soledad', 'gabriel garcía márquez', 30.00, 5),
('don quijote', 'miguel de cervantes', 22.50, 8);

-- pedidos
insert into pedidos (idClienteFK, fechaPedido) values
(1, '2024-10-05'),
(2, '2024-10-10'),
(1, '2024-11-01');


insert into detallePedido (idPedidofk, idlibrofk, cantidad) values
(1, 1, 2),  
(1, 3, 1),  
(2, 2, 1),  
(3, 1, 1);  

DELIMITER //

create trigger actualizarStok
after insert on detallePedido
for each row

 update libros
 set stock = stok - new.cantidad
 where idLibro=new.idClienteFK;
end
// DELIMITER ;

insert into detallePedido (idPedidofk, idlibrofk, cantidad) values
(1, 1, 1);

select 
c.nombreCliente as nombreCliente,
p.idPedido,
p.fechaPedido,
l.titulo as tituloLibro,
l.autor,
dp.cantidad,
l.precio,
(dp.cantidad * l.precio) as totalParcial
from pedidos p
join clientes c on p.idClienteFK = c.idCliente
join detallePedido dp on p.idPedido = dp.idPedidoFK
join libros l on dp.idLibroFK = l.idLibro
where c.idCliente = 1  
order by p.fechaPedido;



select c.idCliente, c.nombreCliente as ClientePopular, 
COUNT(p.idPedido) as totalPedidos
from clientes c
join pedidos p on p.IdClienteFK = c.idCliente
group by c.idCliente, c.nombreCliente
order by totalPedidos desc;

DELIMITER //
create procedure nuevoPedido(in idCliente int, in idLibro int, in cantidad int)
begin
 insert into pedidos (idClienteFK, fechaPedido) values (idCliente, curdate());
 
 insert into detallePedido (idPedidoFK, idLibroFK, cantidad)
  values (last_insert_id(), idLibro, cantidad);
 
 
 update libros
 set stock = stock - cantidad
 where idLibro = 1;

  end
// DELIMITER ; 
  
  call nuevoPedido(3, 1, 2);
  
  -- SET SQL_SAFE_UPDATES = 0;
-- drop procedure nuevoPedido;

select * from libros where precio > 20.00; 

select * from pedidos where fechaPedido > '2024-10-01'; 

select * from libros order by precio desc;

select count(*) as totalClientes
from clientes;

select sum(cantidad) as totalUnidadesVendidas
from detallePedido;

select c.idCliente, c.nombreCliente, count(p.idPedido) as totalPedidos
from clientes c
join pedidos p on c.idCliente = p.idClienteFK
group by c.idCliente, c.nombreCliente;

select c.nombreCliente, l.titulo, dp.cantidad
from clientes c 
join pedidos p on c.idCliente = p.idClienteFK
join detallePedido dp on p.idPedido = dp.idPedidoFK
join libros l on dp.idLibroFK = l.idLibro;

select l.titulo, sum(cantidad) as totalVentas
from  libros l
join detallePedido dp on l.idLibro = dp.idLibroFK
group by  l.idLibro, l.titulo
order by totalVentas desc;









