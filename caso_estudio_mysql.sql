
-- Crear base de datos
CREATE DATABASE IF NOT EXISTS hotel_reservas;
USE hotel_reservas;

-- Crear tabla de habitaciones
CREATE TABLE habitaciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50),
    disponible BOOLEAN
);

-- Crear tabla de clientes
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    correo VARCHAR(100),
    telefono VARCHAR(20)
);

-- Crear tabla de reservas
CREATE TABLE reservas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    habitacion_id INT,
    fecha_reserva DATE,
    fecha_ingreso DATE,
    fecha_salida DATE,
    precio_total DECIMAL(10,2),
    descuento_aplicado BOOLEAN,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (habitacion_id) REFERENCES habitaciones(id)
);

-- Insertar datos de prueba
INSERT INTO habitaciones (tipo, disponible) VALUES 
('Individual', TRUE),
('Doble', TRUE),
('Suite', TRUE);

INSERT INTO clientes (nombre, correo, telefono) VALUES 
('Juan Pérez', 'juan@example.com', '123456789'),
('Ana Gómez', 'ana@example.com', '987654321');

-- Insertar reserva con descuento si aplica (ejemplo)
SET @fecha_reserva = '2025-05-30';
SET @fecha_ingreso = '2025-06-20';
SET @fecha_salida = '2025-06-25';
SET @dias_anticipacion = DATEDIFF(@fecha_ingreso, @fecha_reserva);
SET @precio_base = 500;
SET @descuento = IF(@dias_anticipacion >= 15, 0.10, 0.00);
SET @precio_final = @precio_base * (1 - @descuento);

INSERT INTO reservas (cliente_id, habitacion_id, fecha_reserva, fecha_ingreso, fecha_salida, precio_total, descuento_aplicado)
VALUES (1, 1, @fecha_reserva, @fecha_ingreso, @fecha_salida, @precio_final, @descuento > 0);

-- Consultar estado de reservas
SELECT r.id, c.nombre, h.tipo, r.fecha_ingreso, r.fecha_salida, r.precio_total, r.descuento_aplicado
FROM reservas r
JOIN clientes c ON r.cliente_id = c.id
JOIN habitaciones h ON r.habitacion_id = h.id;
