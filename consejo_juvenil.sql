-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 01-02-2023 a las 08:38:58
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `consejo_juvenil`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calificacion`
--

CREATE TABLE `calificacion` (
  `id` int(11) NOT NULL,
  `id_ext` int(11) NOT NULL,
  `id_jurado` int(11) NOT NULL,
  `documento` int(11) NOT NULL,
  `calificacion` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `calificacion`
--

INSERT INTO `calificacion` (`id`, `id_ext`, `id_jurado`, `documento`, `calificacion`, `fecha`) VALUES
(1, 1, 6, 1, 10, '2023-02-01 01:25:05'),
(3, 1, 6, 9, 6, '2023-02-01 01:35:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogo_documentos`
--

CREATE TABLE `catalogo_documentos` (
  `id` int(11) NOT NULL,
  `documento` varchar(50) NOT NULL,
  `subtitulo` varchar(50) NOT NULL,
  `descripcion` varchar(300) NOT NULL,
  `link` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `catalogo_documentos`
--

INSERT INTO `catalogo_documentos` (`id`, `documento`, `subtitulo`, `descripcion`, `link`) VALUES
(1, 'Carta exposición de motivos ', 'Carta exposición de motivos ', 'Carta exposición de motivos dirigida al Titular del Instituto de la Juventud, en la cual se expresen las razones por las cuales tiene interés en postularse como integrante del Consejo Juvenil del Estado de Zacatecas', '0'),
(2, 'Documento que acredite OSC', 'Documento que acredite OSC', 'Documento acredite pertenecer a Organización de la Sociedad Civil que tenga relación con el desarrollo de la juventud; Titular de Instancia Municipal; inscrito (a) en Institución Educativa Nivel Medio Superior o Superior', '0'),
(3, 'Copia simple del acta de Nacimiento', 'Copia simple del acta de Nacimiento', 'Copia simple del acta de Nacimiento', '0'),
(4, 'Copia simple de credencial de elector', 'Copia simple de credencial de elector', 'Copia simple de credencial de elector; en caso de ser menor de edad debe presentar copia del padre de familia o tutor', '0'),
(5, 'Copia simple de la CURP', 'Copia simple de la CURP', 'Copia simple de la CURP', '0'),
(6, 'Copia simple de comprobante de domicilio', 'Copia simple de comprobante de domicilio', 'Copia simple de comprobante de domicilio', '0'),
(7, 'Carta de no antecedentes penales', 'Carta de no antecedentes penales', 'Carta en la cual manifieste bajo protesta de decir verdad, no estar sujeto a algún proceso penal, o haber sido sentenciado por delitos graves', '0'),
(8, 'Carta en la cual manifieste de decir verdad', 'Carta en la cual manifieste de decir verdad', 'Carta en la cual manifieste bajo protesta de decir verdad, no encontrarse desempeñando algún cargo de elección popular', '0'),
(9, 'Currículum vitae actualizado', 'Currículum vitae actualizado', 'Currículum vitae actualizado', '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos`
--

CREATE TABLE `documentos` (
  `id` int(11) NOT NULL,
  `documento` int(11) NOT NULL COMMENT 'Tipo documento numerado',
  `id_ext` int(11) NOT NULL,
  `link` varchar(45) NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `documentos`
--

INSERT INTO `documentos` (`id`, `documento`, `id_ext`, `link`, `fecha`) VALUES
(1, 1, 1, 'docs/archivo1_.pdf', '2023-01-25 00:23:38'),
(2, 2, 1, 'docs/archivo2_usr1.pdf', '2023-01-25 00:31:50'),
(3, 3, 1, 'docs/archivo3_usr1.pdf', '2023-01-25 00:32:41'),
(4, 4, 1, 'docs/archivo4_usr1.pdf', '2023-01-25 00:38:57'),
(5, 5, 1, 'docs/archivo5_usr1.pdf', '2023-01-25 00:45:05'),
(6, 6, 1, 'docs/archivo6_usr1.pdf', '2023-01-25 00:55:14'),
(7, 7, 1, 'docs/archivo7_usr1.pdf', '2023-01-25 00:56:35'),
(8, 8, 1, 'docs/archivo8_usr1.pdf', '2023-01-25 01:01:36'),
(11, 9, 1, 'docs/archivo9_1.pdf', '2023-01-25 01:31:42'),
(12, 1, 2, 'docs/archivo1_2.pdf', '2023-01-25 14:51:24'),
(13, 6, 2, 'docs/archivo6_2.pdf', '2023-01-25 14:51:39'),
(14, 8, 2, 'docs/archivo8_2.pdf', '2023-01-25 14:52:25'),
(15, 1, 3, 'docs/archivo1_3.pdf', '2023-01-25 16:29:43'),
(16, 2, 3, 'docs/archivo2_3.pdf', '2023-01-25 16:33:49'),
(17, 9, 3, 'docs/archivo9_3.pdf', '2023-01-25 16:34:02'),
(18, 3, 3, 'docs/archivo3_3.pdf', '2023-01-25 16:34:58'),
(19, 5, 3, 'docs/archivo5_3.pdf', '2023-01-26 10:11:55'),
(20, 1, 16, 'docs/archivo1_16.pdf', '2023-01-30 13:45:00'),
(21, 8, 16, 'docs/archivo8_16.pdf', '2023-01-30 13:45:48'),
(22, 3, 16, 'docs/archivo3_16.pdf', '2023-01-30 13:46:06'),
(23, 4, 16, 'docs/archivo4_16.pdf', '2023-01-30 15:54:37'),
(24, 6, 16, 'docs/archivo6_16.pdf', '2023-01-30 15:54:59'),
(25, 5, 16, 'docs/archivo5_16.pdf', '2023-01-30 15:55:08'),
(26, 9, 16, 'docs/archivo9_16.pdf', '2023-01-30 15:55:14'),
(27, 2, 16, 'docs/archivo2_16.pdf', '2023-01-30 15:55:22'),
(28, 7, 16, 'docs/archivo7_16.pdf', '2023-01-30 15:55:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipio`
--

CREATE TABLE `municipio` (
  `id` int(11) NOT NULL,
  `municipio` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `municipio`
--

INSERT INTO `municipio` (`id`, `municipio`) VALUES
(1, 'Apozol'),
(2, 'Apulco'),
(3, 'Atolinga'),
(4, 'Benito Juárez'),
(5, 'Calera'),
(6, 'Cañitas de Felipe Pescador'),
(7, 'Concepción del Oro'),
(8, 'Cuauhtémoc'),
(9, 'Chalchihuites'),
(10, 'Fresnillo'),
(11, 'Trinidad García de la Cadena'),
(12, 'Genaro Codina'),
(13, 'General Enrique Estrada'),
(14, 'General Francisco R. Murguía'),
(15, 'El Plateado de Joaquín Amaro'),
(16, 'General Pánfilo Natera'),
(17, 'Guadalupe'),
(18, 'Huanusco'),
(19, 'Jalpa'),
(20, 'Jerez'),
(21, 'Jiménez del Teul'),
(22, 'Juan Aldama'),
(23, 'Juchipila'),
(24, 'Loreto'),
(25, 'Luis Moya'),
(26, 'Mazapil'),
(27, 'Melchor Ocampo'),
(28, 'Mezquital del Oro'),
(29, 'Miguel Auza'),
(30, 'Momax'),
(31, 'Monte Escobedo'),
(32, 'Morelos'),
(33, 'Moyahua de Estrada'),
(34, 'Nochistlán de Mejía'),
(35, 'Noria de Ángeles'),
(36, 'Ojocaliente'),
(37, 'Pánuco'),
(38, 'Pinos'),
(39, 'Río Grande'),
(40, 'Sain Alto'),
(41, 'El Salvador'),
(42, 'Sombrerete'),
(43, 'Susticacán'),
(44, 'Tabasco'),
(45, 'Tepechitlán'),
(46, 'Tepetongo'),
(47, 'Teúl de González Ortega'),
(48, 'Tlaltenango de Sánchez Román'),
(49, 'Valparaíso'),
(50, 'Vetagrande'),
(51, 'Villa de Cos'),
(52, 'Villa García'),
(53, 'Villa González Ortega'),
(54, 'Villa Hidalgo'),
(55, 'Villanueva'),
(56, 'Zacatecas'),
(57, 'Trancoso'),
(58, 'Santa María de la Paz');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usr`
--

CREATE TABLE `usr` (
  `id` int(11) NOT NULL,
  `usr` varchar(36) NOT NULL,
  `pwd` varchar(20) NOT NULL,
  `perfil` int(11) NOT NULL,
  `curp` varchar(18) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `edad` int(11) NOT NULL,
  `municipio` int(11) DEFAULT NULL,
  `telefono` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usr`
--

INSERT INTO `usr` (`id`, `usr`, `pwd`, `perfil`, `curp`, `nombre`, `edad`, `municipio`, `telefono`) VALUES
(1, 'usr1', '123456789', 1, 'LEVJ810924HZSXLS04', '', 0, 1, 0),
(2, 'usr2', '123456789', 1, 'LEVJ810924HZSXLS05', '', 0, 2, 0),
(3, 'usr3', '123456789', 1, 'LEVJ810924HZSXLS06', 'Jesus R', 45, 4, 0),
(4, 'admin', '123456789', 2, 'LEVJ', '', 0, 45, 0),
(5, 'admin2', '123456789', 2, NULL, '', 0, 12, 0),
(6, 'califica1', '123456789', 3, NULL, '', 0, 10, 0),
(7, 'califica2', '123456789', 3, NULL, '', 0, 34, 0),
(8, 'califica3', '123456789', 3, NULL, '', 0, 32, 0),
(9, 'jesusrlvrojo@gmail.com', '123456789', 1, 'DELJ020727HZSLVNA7', 'JesusRLV', 20, 56, 2147483647),
(14, 'jesusrlvrojo@gmail.com', '123456789', 1, 'LOMS031124HZSPRMA2', 'Jesus Rodolfo', 19, 6, 4915000),
(16, 'DHJSY63HD8@gmail.com', '123456789', 4, 'DHJSY63HD8', 'JesusRLV USA', 23, NULL, 4915000);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `calificacion`
--
ALTER TABLE `calificacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `catalogo_documentos`
--
ALTER TABLE `catalogo_documentos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `documentos`
--
ALTER TABLE `documentos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `municipio`
--
ALTER TABLE `municipio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usr`
--
ALTER TABLE `usr`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `calificacion`
--
ALTER TABLE `calificacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `catalogo_documentos`
--
ALTER TABLE `catalogo_documentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `documentos`
--
ALTER TABLE `documentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `municipio`
--
ALTER TABLE `municipio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT de la tabla `usr`
--
ALTER TABLE `usr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
