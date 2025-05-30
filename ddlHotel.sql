create database hotel;
use hotel;

create table habitaciones (
    ID_Habitacione INT primary key auto_increment,
    numero int unique,
    capacidad int check (capacidad in (1, 2, 3, 4)),
    precio decimal (10, 2),
    disponible boolean default true
);

create table clientes (
    ID_Cliente INT primary key auto_increment,
    documento varchar(20) unique,
    nombre VARCHAR(100),
    correo VARCHAR(100)
);
create table reservas (
    ID_Reserva INT primary key auto_increment,
    ID_Cliente INT,
    ID_Habitacione INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    fecha_reserva DATE,
    total DECIMAL(10,2)
);

ALTER TABLE reservas 
ADD FOREIGN KEY(ID_Cliente) REFERENCES clientes(ID_Cliente),
ADD FOREIGN KEY(ID_Habitacione) REFERENCES habitaciones(ID_Habitacione);




