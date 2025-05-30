USE `terminal`;
DROP procedure IF EXISTS `Comprar_el_tiket`;

DELIMITER $$
USE `terminal`$$
CREATE PROCEDURE Comprar_el_tiket (
    IN ID_Cliente INT,
    IN ID_Ruta INT,
    IN ID_Bus INT,
    IN Asiento INT,
    IN Fecha DATE,
    IN Hora TIME
)
BEGIN
    DECLARE distancia FLOAT;
    DECLARE precio INT;

    SELECT Distancia INTO distancia FROM Rutas WHERE ID_Ruta = ID_Ruta;

    SET precio = Precio(distancia);

    INSERT INTO Pasajes (Precio, Asiento, Hora_Salida, Fecha_compra, ID_Cliente, ID_Ruta, ID_Bus)
    VALUES (precio, Asiento, Hora, Fecha, ID_Cliente, ID_Ruta, ID_Bus);
END$$

DELIMITER ;