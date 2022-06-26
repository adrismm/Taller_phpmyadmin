-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-06-2022 a las 22:01:21
-- Versión del servidor: 8.0.27
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `instituto_php`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `idAlumno` int NOT NULL,
  `dniAlumno` varchar(9) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `nombreAlumno` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `apellidosAlumno` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `cursoAlumno` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`idAlumno`, `dniAlumno`, `nombreAlumno`, `apellidosAlumno`, `cursoAlumno`) VALUES
(1, '26984555F', 'Sara', 'López Reyes', 3),
(2, '29615478G', 'Francisco', 'Sánchez Madera', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaturas`
--

CREATE TABLE `asignaturas` (
  `idAsignatura` int NOT NULL,
  `nombreAsignatura` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `asignaturas`
--

INSERT INTO `asignaturas` (`idAsignatura`, `nombreAsignatura`) VALUES
(1, 'Matemáticas'),
(2, 'Historia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `centros`
--

CREATE TABLE `centros` (
  `idCentro` int NOT NULL,
  `nombreCentro` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `direccionCentro` varchar(100) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `observacionesCentro` varchar(500) COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `centros`
--

INSERT INTO `centros` (`idCentro`, `nombreCentro`, `direccionCentro`, `observacionesCentro`) VALUES
(5, 'I.E.S. Guadiana', 'Calle Ochoa, 8', 'Es un instituto de educación secundaria grande con alumnos provenientes de los pueblos vecinos.'),
(6, 'I.E.S. Padre Jesús', 'Avda. Ramón y Cajal, 17', 'Es un instituto más bien pequeño, pero cuenta con un equipo de profesores muy cualificados.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursaciones`
--

CREATE TABLE `cursaciones` (
  `idAlumnoFK` int NOT NULL,
  `idAsignaturaFK` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fijos`
--

CREATE TABLE `fijos` (
  `idFijo` int NOT NULL,
  `anioAltaFijo` int NOT NULL,
  `bonusAntiguedadFijo` decimal(6,2) NOT NULL,
  `idProfesorFK` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imparticiones`
--

CREATE TABLE `imparticiones` (
  `idProfesorFK` int NOT NULL,
  `idAsignaturaFK` int NOT NULL,
  `fechaInicio` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `interinos`
--

CREATE TABLE `interinos` (
  `idInterino` int NOT NULL,
  `tiempoServicioInterino` int NOT NULL,
  `fechaFinalInterino` date NOT NULL,
  `idProfesorFK` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesorado`
--

CREATE TABLE `profesorado` (
  `idProfesor` int NOT NULL,
  `dniProfesor` varchar(9) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `nombreProfesor` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `apellidosProfesor` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `departamentoProfesor` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `tipoProfesor` varchar(45) COLLATE utf8mb4_spanish2_ci NOT NULL,
  `idProfesorFK` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `profesorado`
--

INSERT INTO `profesorado` (`idProfesor`, `dniProfesor`, `nombreProfesor`, `apellidosProfesor`, `departamentoProfesor`, `tipoProfesor`, `idProfesorFK`) VALUES
(1, '26548691L', 'Juan', 'Márquez Tena', 'Historia', 'Fijo', 1),
(13, '22487956S', 'Rafael', 'Núñez García', 'Matemáticas', 'Interino', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabajos`
--

CREATE TABLE `trabajos` (
  `idCentroFK` int NOT NULL,
  `idProfesorFK` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`idAlumno`);

--
-- Indices de la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  ADD PRIMARY KEY (`idAsignatura`);

--
-- Indices de la tabla `centros`
--
ALTER TABLE `centros`
  ADD PRIMARY KEY (`idCentro`);

--
-- Indices de la tabla `cursaciones`
--
ALTER TABLE `cursaciones`
  ADD PRIMARY KEY (`idAlumnoFK`,`idAsignaturaFK`),
  ADD KEY `idAlumnoFK` (`idAlumnoFK`),
  ADD KEY `idAsignaturaFK` (`idAsignaturaFK`);

--
-- Indices de la tabla `fijos`
--
ALTER TABLE `fijos`
  ADD PRIMARY KEY (`idFijo`),
  ADD KEY `idProfesorFK` (`idProfesorFK`);

--
-- Indices de la tabla `imparticiones`
--
ALTER TABLE `imparticiones`
  ADD PRIMARY KEY (`idProfesorFK`,`idAsignaturaFK`),
  ADD KEY `idProfesorFK` (`idProfesorFK`),
  ADD KEY `idAsignaturaFK` (`idAsignaturaFK`);

--
-- Indices de la tabla `interinos`
--
ALTER TABLE `interinos`
  ADD PRIMARY KEY (`idInterino`),
  ADD KEY `idProfesorFK` (`idProfesorFK`);

--
-- Indices de la tabla `profesorado`
--
ALTER TABLE `profesorado`
  ADD PRIMARY KEY (`idProfesor`),
  ADD KEY `idProfesorFK` (`idProfesorFK`);

--
-- Indices de la tabla `trabajos`
--
ALTER TABLE `trabajos`
  ADD PRIMARY KEY (`idCentroFK`,`idProfesorFK`),
  ADD KEY `idCentroFK` (`idCentroFK`),
  ADD KEY `idProfesorFK` (`idProfesorFK`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `idAlumno` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  MODIFY `idAsignatura` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `centros`
--
ALTER TABLE `centros`
  MODIFY `idCentro` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `fijos`
--
ALTER TABLE `fijos`
  MODIFY `idFijo` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `interinos`
--
ALTER TABLE `interinos`
  MODIFY `idInterino` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `profesorado`
--
ALTER TABLE `profesorado`
  MODIFY `idProfesor` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cursaciones`
--
ALTER TABLE `cursaciones`
  ADD CONSTRAINT `cursaciones_ibfk_1` FOREIGN KEY (`idAlumnoFK`) REFERENCES `alumnos` (`idAlumno`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `cursaciones_ibfk_2` FOREIGN KEY (`idAsignaturaFK`) REFERENCES `asignaturas` (`idAsignatura`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `fijos`
--
ALTER TABLE `fijos`
  ADD CONSTRAINT `fijos_ibfk_1` FOREIGN KEY (`idProfesorFK`) REFERENCES `profesorado` (`idProfesor`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `imparticiones`
--
ALTER TABLE `imparticiones`
  ADD CONSTRAINT `imparticiones_ibfk_1` FOREIGN KEY (`idAsignaturaFK`) REFERENCES `asignaturas` (`idAsignatura`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `imparticiones_ibfk_2` FOREIGN KEY (`idProfesorFK`) REFERENCES `profesorado` (`idProfesor`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `interinos`
--
ALTER TABLE `interinos`
  ADD CONSTRAINT `interinos_ibfk_1` FOREIGN KEY (`idProfesorFK`) REFERENCES `profesorado` (`idProfesor`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `profesorado`
--
ALTER TABLE `profesorado`
  ADD CONSTRAINT `profesorado_ibfk_1` FOREIGN KEY (`idProfesorFK`) REFERENCES `profesorado` (`idProfesor`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `trabajos`
--
ALTER TABLE `trabajos`
  ADD CONSTRAINT `trabajos_ibfk_1` FOREIGN KEY (`idCentroFK`) REFERENCES `centros` (`idCentro`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `trabajos_ibfk_2` FOREIGN KEY (`idProfesorFK`) REFERENCES `profesorado` (`idProfesor`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
