DELIMITER //

CREATE TRIGGER Verificar_Asiento
BEFORE INSERT ON Pasajes
FOR EACH ROW
BEGIN
    DECLARE ocupado INT;

    SELECT COUNT(*) INTO ocupado
    FROM Pasajes
    WHERE Asiento = NEW.Asiento
      AND ID_Bus = NEW.ID_Bus;

    IF ocupado > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = '❌ El asiento está ocupado';
    END IF;
END //

DELIMITER ;
