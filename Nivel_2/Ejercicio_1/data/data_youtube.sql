-- Inserción de datos para la tabla `canal`
INSERT INTO `canal` (`ID_Canal`, `Nombre`, `Descripcion`, `Fecha_Creacion`, `ID_Usuario`) VALUES
(1, 'Canal de Cocina', 'Recetas y técnicas de cocina.', '2024-01-01 10:00:00', 1),
(2, 'Canal de Viajes', 'Aventuras y guías de viaje.', '2024-01-05 12:00:00', 2);

-- Inserción de datos para la tabla `comentario`
INSERT INTO `comentario` (`ID_Comentario`, `Text`, `Fecha_Comentario`, `ID_Video`, `ID_Usuario`) VALUES
(1, '¡Me encantó esta receta!', '2024-01-02 11:00:00', 1, 2),
(2, 'Increíbles paisajes!', '2024-01-06 15:00:00', 2, 1);

-- Inserción de datos para la tabla `etiqueta`
INSERT INTO `etiqueta` (`ID_Etiqueta`, `Nombre_Etiqueta`) VALUES
(1, 'Cocina'),
(2, 'Viajes'),
(3, 'Aventura');

-- Inserción de datos para la tabla `like_dislike_comentario`
INSERT INTO `like_dislike_comentario` (`ID_Comentario`, `ID_Usuario`, `Tipo_Voto`, `Fecha_Voto`) VALUES
(1, 1, 'Like', '2024-01-02 12:00:00'),
(2, 2, 'Dislike', '2024-01-06 16:00:00');

-- Inserción de datos para la tabla `like_dislike_video`
INSERT INTO `like_dislike_video` (`ID_Usuario`, `ID_Video`, `Tipo_Voto`, `Fecha_Voto`) VALUES
(1, 1, 'Like', '2024-01-01 09:00:00'),
(2, 2, 'Like', '2024-01-05 14:00:00');

-- Inserción de datos para la tabla `playlist`
INSERT INTO `playlist` (`ID_Playlist`, `Nombre`, `Fecha_Creacion`, `Estado`, `ID_Usuario`) VALUES
(1, 'Mis Recetas Favoritas', '2024-01-01 10:00:00', 'Publica', 1),
(2, 'Viajes por el Mundo', '2024-01-06 12:00:00', 'Privada', 2);

-- Inserción de datos para la tabla `playlist_video`
INSERT INTO `playlist_video` (`ID_Playlist`, `ID_Video`, `Fecha_Adicion`) VALUES
(1, 1, '2024-01-01 10:00:00'),
(2, 2, '2024-01-06 12:00:00');

-- Inserción de datos para la tabla `suscripcion`
INSERT INTO `suscripcion` (`ID_Usuario`, `ID_Canal`, `Fecha_Suscripcion`) VALUES
(1, 1, '2024-01-01 10:00:00'),
(2, 2, '2024-01-06 12:00:00');

-- Inserción de datos para la tabla `usuario`
INSERT INTO `usuario` (`ID_Usuario`, `Email`, `Password`, `Nombre_Usuario`, `Fecha_Nacimiento`, `Sexo`, `Pais`, `Codigo_Postal`) VALUES
(1, 'usuario1@example.com', 'password1', 'Usuario Uno', '1990-01-01', 'Masculino', 'España', '28001'),
(2, 'usuario2@example.com', 'password2', 'Usuario Dos', '1992-02-02', 'Femenino', 'España', '28002');

-- Inserción de datos para la tabla `video`
INSERT INTO `video` (`ID_Video`, `Titulo`, `Descripcion`, `Tamano`, `Nombre_Archivo`, `Duracion`, `Thumbnail`, `Numero_Reproducciones`, `Numero_Likes`, `Numero_Dislikes`, `Estado`, `Fecha_Publicacion`, `ID_Usuario`) VALUES
(1, 'Receta de Pasta', 'Deliciosa receta de pasta.', 204800, 'pasta.mp4', '00:05:00', 'pasta_thumbnail.jpg', 100, 10, 2, 'Público', '2024-01-01 09:00:00', 1),
(2, 'Guía de París', 'Descubre los mejores lugares de París.', 307200, 'paris.mp4', '00:10:00', 'paris_thumbnail.jpg', 200, 20, 1, 'Público', '2024-01-05 14:00:00', 2);

-- Inserción de datos para la tabla `video_etiqueta`
INSERT INTO `video_etiqueta` (`ID_Video`, `ID_Etiqueta`) VALUES
(1, 1),
(2, 2),
(2, 3);
