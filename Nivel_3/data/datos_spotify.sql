 # Crear un archivo SQL con los comandos INSERT para la base de datos "spotify"
sql_commands = """
-- Inserción de datos en la tabla `usuario`
INSERT INTO `usuario` VALUES 
(1, 'juan.perez@gmail.com', 'password123', 'Juan Perez', '1990-06-15', 'Masculino', 'España', '28001', 'Free'),
(2, 'maria.garcia@hotmail.com', 'maria456', 'Maria Garcia', '1985-12-22', 'Femenino', 'México', '01000', 'Premium'),
(3, 'carlos.lopez@yahoo.com', 'carlos789', 'Carlos Lopez', '1995-03-10', 'Masculino', 'Argentina', 'C1001', 'Free'),
(4, 'lucia.martinez@outlook.com', 'lucia1234', 'Lucia Martinez', '1993-08-09', 'Femenino', 'Colombia', '11001000', 'Premium');

-- Inserción de datos en la tabla `artista`
INSERT INTO `artista` VALUES 
(1, 'Santiago Ramos', 'santiago_ramos.jpg'),
(2, 'Elena Ruiz', 'elena_ruiz.jpg'),
(3, 'Los Caminantes', 'los_caminantes.jpg'),
(4, 'Manuela Soto', 'manuela_soto.jpg');

-- Inserción de datos en la tabla `album`
INSERT INTO `album` VALUES 
(1, 'Despierta', '2021', 'despierta_portada.jpg', 1),
(2, 'Ecos del silencio', '2019', 'ecos_silencio.jpg', 2),
(3, 'Entre sombras', '2020', 'entre_sombras.jpg', 3),
(4, 'El viaje', '2022', 'el_viaje_portada.jpg', 4);

-- Inserción de datos en la tabla `cancion`
INSERT INTO `cancion` VALUES 
(1, 'Volar lejos', '3:45', 2500, 1),
(2, 'Sonido del mar', '4:15', 5000, 2),
(3, 'Silencio profundo', '2:50', 1200, 3),
(4, 'Caminos cruzados', '3:10', 8000, 4);

-- Inserción de datos en la tabla `favorita_cancion`
-- (No hay datos de ejemplo proporcionados para esta tabla, así que se omitirá)

-- Inserción de datos en la tabla `favorito_album`
-- (No hay datos de ejemplo proporcionados para esta tabla, así que se omitirá)

-- Inserción de datos en la tabla `pago`
-- (No hay datos de ejemplo proporcionados para esta tabla, así que se omitirá)

-- Inserción de datos en la tabla `playlist`
-- (No hay datos de ejemplo proporcionados para esta tabla, así que se omitirá)

-- Inserción de datos en la tabla `playlist_compartida`
-- (No hay datos de ejemplo proporcionados para esta tabla, así que se omitirá)

-- Inserción de datos en la tabla `seguimientoartistas`
-- (No hay datos de ejemplo proporcionados para esta tabla, así que se omitirá)

-- Inserción de datos en la tabla `subscripcion`
INSERT INTO `subscripcion` VALUES 
(1, 1, '2023-01-01', '2024-01-01', 'Tarjeta', '1234567890123456', 12, 2025, 123, 'juanpaypal'),
(2, 2, '2023-05-01', '2024-05-01', 'Paypal', NULL, NULL, NULL, NULL, 'mariapaypal'),
(3, 3, '2023-03-01', '2024-03-01', 'Tarjeta', '9876543210987654', 11, 2026, 321, 'carlospaypal'),
(4, 4, '2023-07-01', '2024-07-01', 'Tarjeta', '5555555555554444', 10, 2025, 456, 'luciapaypal');
"""