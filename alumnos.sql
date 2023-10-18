-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 18, 2023 at 09:27 PM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `alumnos`
--

-- --------------------------------------------------------

--
-- Table structure for table `alumnos`
--

DROP TABLE IF EXISTS `alumnos`;
CREATE TABLE IF NOT EXISTS `alumnos` (
  `idAlumno` int NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Apellido` varchar(45) NOT NULL,
  `Telefono` int NOT NULL,
  `FechaNacimiento` varchar(45) NOT NULL,
  `Direccion` varchar(45) NOT NULL,
  `idCuotas` int NOT NULL,
  `Materias_idMaterias` int NOT NULL,
  PRIMARY KEY (`idAlumno`,`Materias_idMaterias`),
  UNIQUE KEY `idAlumno` (`idAlumno`),
  KEY `fk_Alumnos_Materias1_idx` (`Materias_idMaterias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `alumnos`
--

INSERT INTO `alumnos` (`idAlumno`, `Nombre`, `Apellido`, `Telefono`, `FechaNacimiento`, `Direccion`, `idCuotas`, `Materias_idMaterias`) VALUES
(0, 'pepe', 'honguito', 4, '', '', 0, 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
