DELIMITER //
CREATE TRIGGER trg_pasajes_antes_insert
BEFORE INSERT ON Pasajes
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1 FROM Pasajes
        WHERE Asiento = NEW.Asiento
          AND ID_Bus = NEW.ID_Bus
          AND ID_Ruta = NEW.ID_Ruta
          AND Hora_Salida = NEW.Hora_Salida
          AND Fecha_Viaje = NEW.Fecha_Viaje
    ) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: El asiento seleccionado ya está ocupado para este bus, ruta, fecha y horario.';
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER trg_pasajes_after_insert_auditoria
AFTER INSERT ON Pasajes
FOR EACH ROW
BEGIN
    INSERT INTO Auditoria_ComprasPasajes (ID_Pasaje_Comprado, ID_Cliente, Precio_Pagado, Detalles)
    VALUES (NEW.ID_Pasajes, NEW.ID_Cliente, NEW.Precio, CONCAT('Pasaje comprado - Ruta: ', NEW.ID_Ruta, ', Bus: ', NEW.ID_Bus, ', Asiento: ', NEW.Asiento, ', Viaje: ', NEW.Fecha_Viaje, ' ', NEW.Hora_Salida));
END //
DELIMITER ;


INSERT INTO Clientes (ID_Cliente, Nombre, Apellido, Telefono, Identidad_Personal, ID_Ruta) VALUES (1, 'Juan', 'Perez', '123456789', '10001', NULL);
INSERT INTO Rutas (ID_Ruta, Origen, Destino, Distancia) VALUES (1, 'Bogota', 'Medellin', 400);
INSERT INTO Buses (ID_Bus, Placa, Numero_Bus, Capacidad, ID_Conductor, ID_Empresa) VALUES (1, 'ABC-123', 101, 40, NULL, NULL);
INSERT INTO Buses (ID_Bus, Placa, Numero_Bus, Capacidad, ID_Conductor, ID_Empresa) VALUES (2, 'XYZ-789', 102, 1, NULL, NULL); -- Un bus con capacidad 1 para probar el asiento ocupado

CALL comprar_pasaje_completo(100, 5, '08:00:00', '2025-05-30', '2025-06-15', 1, 1, 1);
CALL comprar_pasaje_completo(100, 6, '09:00:00', '2025-05-30', '2025-06-01', 1, 1, 1);