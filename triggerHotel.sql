/*TRIGGER*/
DELIMITER //

CREATE TRIGGER disponibilidad
AFTER INSERT ON reservas
FOR EACH ROW
BEGIN
    UPDATE habitaciones
    SET disponible = FALSE
    WHERE ID_Habitacione = NEW.ID_Habitacione;
END;
//

DELIMITER ;


DELIMITER //

CREATE TRIGGER liberar_habitacion
AFTER DELETE ON reservas
FOR EACH ROW
BEGIN
    UPDATE habitaciones
    SET disponible = TRUE
    WHERE ID_Habitacione = OLD.ID_Habitacione;
END;
//

DELIMITER ;