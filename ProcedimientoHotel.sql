USE `hotel`;
DROP procedure IF EXISTS `insertar_reserva`;

DELIMITER $$
USE `hotel`$$
CREATE PROCEDURE insertar_reserva (
    IN p_ID_Cliente INT,
    IN p_ID_Habitacione INT,
    IN p_fecha_inicio DATE,
    IN p_fecha_fin DATE
)
BEGIN
    DECLARE dias INT;
    DECLARE anticipo INT;
    DECLARE total_base DECIMAL(10,2);
    DECLARE total_final DECIMAL(10,2);
    DECLARE precio_habitacion DECIMAL(10,2);
    
    SET dias = DATEDIFF(p_fecha_fin, p_fecha_inicio);
    
    SELECT precio INTO precio_habitacion
    FROM habitaciones
    WHERE ID_Habitacione = p_ID_Habitacione;
    
    SET total_base = dias * precio_habitacion;
    
    SET anticipo = DATEDIFF(p_fecha_inicio, CURRENT_DATE());
    
    IF anticipo >= 15 THEN
        SET total_final = total_base * 0.9; 
    ELSE
        SET total_final = total_base;
    END IF;
    
    INSERT INTO reservas (
        ID_Cliente,
        ID_Habitacione,
        fecha_inicio,
        fecha_fin,
        fecha_reserva,
        total
    )
    VALUES (
        p_ID_Cliente,
        p_ID_Habitacione,
        p_fecha_inicio,
        p_fecha_fin,
        CURRENT_DATE(),
        total_final
    );
END$$

DELIMITER ;