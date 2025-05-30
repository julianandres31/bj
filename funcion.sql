USE `terminal`;
DROP function IF EXISTS `Precio`;

DELIMITER $$
USE `terminal`$$
CREATE FUNCTION Precio(distancia FLOAT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE precio INT;
    SET precio = distancia * 800; 
    RETURN precio;
END$$

DELIMITER ;