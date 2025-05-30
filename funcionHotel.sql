USE `hotel`;
DROP function IF EXISTS `calcular_precio`;

DELIMITER $$
USE `hotel`$$
CREATE FUNCTION calcular_precio(id_habitacione INT, fecha_inicio DATE, fecha_fin DATE, fecha_reserva DATE)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE precio DECIMAL(10,2);
    DECLARE dias INT;
    DECLARE total DECIMAL(10,2);
    DECLARE descuento DECIMAL(10,2);

    SELECT precio INTO precio FROM habitaciones WHERE id = id_habitacione;
    SET dias = DATEDIFF(fecha_fin, fecha_inicio);
    SET total = dias * precio;

    IF DATEDIFF(fecha_inicio, fecha_reserva) >= 15 THEN
        SET descuento = total * 0.10;
        SET total = total - descuento;
    END IF;

    RETURN total;
END$$

DELIMITER ;