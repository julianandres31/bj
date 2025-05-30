USE `hotel`;
CREATE  OR REPLACE VIEW Reservas_V AS
SELECT
    R.ID_Reserva,
    C.nombre AS cliente,
    H.numero AS habitacion,
    H.capacidad,
    R.fecha_inicio,
    R.fecha_fin,
    R.fecha_reserva,
    R.total
FROM reservas R
JOIN clientes C ON R.ID_Cliente = C.ID_Cliente
JOIN habitaciones H ON R.ID_Habitacione = H.ID_Habitacione;