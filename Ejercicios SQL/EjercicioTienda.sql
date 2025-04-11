/*create -  crear estructura BD, TABLAS, VISTAS, PROCEDIMIENTOS, INDICES*/

create database tienda;

USE tienda;

/*crear tablas*/
create table cliente(
idCliente int AUTO_INCREMENT PRIMARY KEY,
nombreCliente VARCHAR(10) NOT NULL,
emailCliente VARCHAR(50) NOT NULL,
telefonoCliente VARCHAR(50) NOT NULL,
direccionCliente text,
fechaRegistro timestamp default current_timestamp
);

create table pedido(
idPedido int AUTO_INCREMENT PRIMARY KEY,
idClienteFK INT NOT NULL,
idProductoFK INT NOT NULL,
fechaPedido date NOT NULL,
totalPedido decimal(10,2) NOT NULL,
estado enum('Pendiente', 'Enviado', 'Enviado', 'Enviado') default 'Pendiente',
fechaRegistro timestamp default current_timestamp
);

create table producto(
idProducto int AUTO_INCREMENT PRIMARY KEY,
codigoProducto VARCHAR(10) NOT NULL,
nombreProducto VARCHAR(10) NOT NULL,
precioProducto decimal(10,2) NOT NULL,
stok int default 0,
fechaCreacion timestamp default current_timestamp
);

describe producto;

alter table pedido add constraint FKclientePed 
foreign key (idClienteFK) references cliente (idCliente) 

