-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-11-2025 a las 16:17:39
-- Versión del servidor: 12.0.2-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `facturacion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_ciudad`
--

CREATE TABLE `t_ciudad` (
  `id_ciudad` int(11) NOT NULL,
  `ciudad` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_ciudad`
--

INSERT INTO `t_ciudad` (`id_ciudad`, `ciudad`) VALUES
(1, 'Bogota'),
(2, 'Medellin'),
(3, 'Dubai');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_cliente`
--

CREATE TABLE `t_cliente` (
  `id_cliente` int(11) NOT NULL,
  `nombre_cliente` varchar(100) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `id_ciudad` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_cliente`
--

INSERT INTO `t_cliente` (`id_cliente`, `nombre_cliente`, `direccion`, `id_ciudad`) VALUES
(1, 'FERRETERIA JJ', 'DIAGONAL 60', 1),
(2, 'PANADERIA DOÑITA', 'CALLE 13', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_factura`
--

CREATE TABLE `t_factura` (
  `id_factura` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `valor_unitario` float(10,2) DEFAULT NULL,
  `Total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_factura`
--

INSERT INTO `t_factura` (`id_factura`, `fecha`, `id_cliente`, `id_usuario`, `id_producto`, `cantidad`, `valor_unitario`, `Total`) VALUES
(4, '2023-02-26', 2, 2, 1, 5, 4000.00, 0),
(5, '2025-11-19', 1, 1, 1, 10, 100.00, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_producto`
--

CREATE TABLE `t_producto` (
  `id_producto` int(11) NOT NULL,
  `producto` varchar(50) DEFAULT NULL,
  `id_unidad` int(11) DEFAULT NULL,
  `valor_unitario` float(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_producto`
--

INSERT INTO `t_producto` (`id_producto`, `producto`, `id_unidad`, `valor_unitario`) VALUES
(1, 'PAN', 1, 5000.00),
(2, 'MARTILLO', 1, 4000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_rol`
--

CREATE TABLE `t_rol` (
  `id_rol` int(11) NOT NULL,
  `rol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_rol`
--

INSERT INTO `t_rol` (`id_rol`, `rol`) VALUES
(1, 0),
(2, 0),
(3, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_unidad`
--

CREATE TABLE `t_unidad` (
  `id_unidad` int(11) NOT NULL,
  `unidad` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_unidad`
--

INSERT INTO `t_unidad` (`id_unidad`, `unidad`) VALUES
(1, 'UNIDAD'),
(2, 'KILO'),
(3, 'RESMA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_usuario`
--

CREATE TABLE `t_usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `id_rol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_usuario`
--

INSERT INTO `t_usuario` (`id_usuario`, `nombre`, `apellido`, `id_rol`) VALUES
(1, 'Jeferson', 'Carranza', 1),
(2, 'Sammy', 'Gonzales', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `t_ciudad`
--
ALTER TABLE `t_ciudad`
  ADD PRIMARY KEY (`id_ciudad`);

--
-- Indices de la tabla `t_cliente`
--
ALTER TABLE `t_cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `fk_ciudad` (`id_ciudad`);

--
-- Indices de la tabla `t_factura`
--
ALTER TABLE `t_factura`
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `fk_cliente` (`id_cliente`),
  ADD KEY `fk_producto` (`id_producto`),
  ADD KEY `fk_usuario` (`id_usuario`);

--
-- Indices de la tabla `t_producto`
--
ALTER TABLE `t_producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `fk_unidad` (`id_unidad`);

--
-- Indices de la tabla `t_rol`
--
ALTER TABLE `t_rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `t_unidad`
--
ALTER TABLE `t_unidad`
  ADD PRIMARY KEY (`id_unidad`);

--
-- Indices de la tabla `t_usuario`
--
ALTER TABLE `t_usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `fk_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `t_ciudad`
--
ALTER TABLE `t_ciudad`
  MODIFY `id_ciudad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `t_cliente`
--
ALTER TABLE `t_cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `t_factura`
--
ALTER TABLE `t_factura`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `t_producto`
--
ALTER TABLE `t_producto`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `t_rol`
--
ALTER TABLE `t_rol`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `t_unidad`
--
ALTER TABLE `t_unidad`
  MODIFY `id_unidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `t_usuario`
--
ALTER TABLE `t_usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `t_cliente`
--
ALTER TABLE `t_cliente`
  ADD CONSTRAINT `fk_ciudad` FOREIGN KEY (`id_ciudad`) REFERENCES `t_ciudad` (`id_ciudad`);

--
-- Filtros para la tabla `t_factura`
--
ALTER TABLE `t_factura`
  ADD CONSTRAINT `fk_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `t_cliente` (`id_cliente`),
  ADD CONSTRAINT `fk_producto` FOREIGN KEY (`id_producto`) REFERENCES `t_producto` (`id_producto`),
  ADD CONSTRAINT `fk_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `t_usuario` (`id_usuario`);

--
-- Filtros para la tabla `t_producto`
--
ALTER TABLE `t_producto`
  ADD CONSTRAINT `fk_unidad` FOREIGN KEY (`id_unidad`) REFERENCES `t_unidad` (`id_unidad`);

--
-- Filtros para la tabla `t_usuario`
--
ALTER TABLE `t_usuario`
  ADD CONSTRAINT `fk_rol` FOREIGN KEY (`id_rol`) REFERENCES `t_rol` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
