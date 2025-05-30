INSERT INTO clientes (nombre, documento, correo)
values 
("julian andres", "123456789", "julianandres@gmail.com"),
("michelle ariza", "987654321", "michelleariza@gmail.com");

INSERT INTO habitaciones (numero, capacidad, precio) VALUES
(111, 1, 60.00),
(112, 2, 90.00),
(113, 3, 110.00),
(114, 4, 120.00);


call insertar_reserva(1, 1, "2025-07-20", "2025-07-25");

select * from Reservas_V;