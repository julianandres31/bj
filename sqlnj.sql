create database Terminal;
use Terminal;


CREATE TABLE Pasajes (
    ID_Pasajes INT PRIMARY KEY auto_increment,
    Precio INT,
    Asiento INT,
    Hora_Salida TIME,
    Fecha_compra DATE,
    ID_Cliente INT,
    ID_Ruta INT,
    ID_Bus INT
);

create table ordenes (
	ID_Ordenes int primary key auto_increment,
    Cantidad int,
    ID_Cliente int,
    Fecha date
);

create table Reservas (
	ID_Reserva int primary key auto_increment,
    ID_Cliente int,
    Fecha date,
    Hora time
);

create table Buses_Reserva (
	ID_Bus int ,
    ID_Reserva int,
	primary key (ID_Bus, ID_Reserva)
);

CREATE TABLE Departamento (
    ID_Departamento INT PRIMARY KEY,
    Codi_Departamento INT
);

CREATE TABLE Ciudad (
    ID_Ciudad INT PRIMARY KEY,
    Codi_Ciudad INT,
    ID_Departamento INT
);

CREATE TABLE Rutas (
    ID_Ruta INT PRIMARY KEY,
    Origen VARCHAR(50),
    Destino VARCHAR(50),
    Distancia FLOAT
);

CREATE TABLE Ciudad_Rutas (
    ID_Ciudad INT ,
    ID_Ruta INT,
	primary key (ID_Ciudad, ID_Ruta)
);

CREATE TABLE Empresas_Buses (
    ID_Empresa INT PRIMARY KEY,
    Correo VARCHAR(50),
    Telefono VARCHAR(15),
    Logo_URL VARCHAR(255)
);

CREATE TABLE Conductor (
    ID_Conductor INT PRIMARY KEY,
    Nombre VARCHAR(20),
    Apellido VARCHAR(20),
    Telefono VARCHAR(15),
    Licencia VARCHAR(20),
	ID_Empresa INT
);

CREATE TABLE Buses (
    ID_Bus INT PRIMARY KEY,
    Placa VARCHAR(15),
    Numero_Bus INT,
    Capacidad INT,
    ID_Conductor INT,
    ID_Empresa INT
);

CREATE TABLE Buses_Conductor (
    ID_Bus INT ,
    ID_Conductor INT, 
    primary key (ID_Bus, ID_Conductor)
);

CREATE TABLE Clientes (
    ID_Cliente INT PRIMARY KEY auto_increment,
    Nombre VARCHAR(20),
    Apellido VARCHAR(20),
    Telefono VARCHAR(15),
    Identidad_Personal VARCHAR(15),
    ID_Ruta INT
);


CREATE TABLE Vendedores_Ticket (
    ID_Vendedor INT PRIMARY KEY,
    Nombre VARCHAR(15),
    Apellido VARCHAR(15),
    ID_Empresa INT
);

ALTER TABLE pasajes 
ADD FOREIGN KEY(ID_Cliente) REFERENCES Clientes(ID_Cliente),
ADD FOREIGN KEY(ID_Ruta) REFERENCES Rutas(ID_Ruta),
ADD FOREIGN KEY(ID_Bus) REFERENCES Buses(ID_Bus);

ALTER TABLE clientes 
ADD FOREIGN KEY(ID_Ruta) REFERENCES Rutas(ID_Ruta);

ALTER TABLE Buses 
ADD FOREIGN KEY(ID_Conductor) REFERENCES conductor(ID_Conductor),
ADD FOREIGN KEY(ID_Empresa) REFERENCES empresas_buses(ID_Empresa);

ALTER TABLE vendedores_ticket 
ADD FOREIGN KEY(ID_Empresa) REFERENCES empresas_buses(ID_Empresa);

ALTER TABLE buses_conductor 
ADD FOREIGN KEY(ID_Bus) REFERENCES buses(ID_Bus),
ADD FOREIGN KEY(ID_Conductor) REFERENCES conductor(ID_Conductor);

ALTER TABLE ciudad 
ADD FOREIGN KEY(ID_Departamento) REFERENCES departamento(ID_Departamento);

ALTER TABLE ciudad_rutas 
ADD FOREIGN KEY(ID_Ciudad) REFERENCES ciudad(ID_Ciudad),
ADD FOREIGN KEY(ID_Ruta) REFERENCES rutas(ID_Ruta);

ALTER TABLE conductor 
ADD FOREIGN KEY(ID_Empresa) REFERENCES empresas_buses(ID_Empresa);

ALTER TABLE ordenes 
ADD FOREIGN KEY(ID_Cliente) REFERENCES clientes(ID_Cliente);

ALTER TABLE reservas 
ADD FOREIGN KEY(ID_Cliente) REFERENCES clientes(ID_Cliente);