-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 10, 2017 at 02:10 AM
-- Server version: 10.1.26-MariaDB-0+deb9u1
-- PHP Version: 7.0.19-1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `SIMP2`
--

-- --------------------------------------------------------

--
-- Table structure for table `ardsensor`
--

CREATE TABLE `ardsensor` (
  `id_ardsensor` int(10) NOT NULL,
  `id_arduinos` int(10) NOT NULL,
  `id_sensores` int(10) NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ardsensor`
--

INSERT INTO `ardsensor` (`id_ardsensor`, `id_arduinos`, `id_sensores`, `activo`) VALUES
(1, 1, 1, 1),
(2, 2, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `arduinos`
--

CREATE TABLE `arduinos` (
  `id_arduinos` int(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `ubicacion` varchar(100) NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `arduinos`
--

INSERT INTO `arduinos` (`id_arduinos`, `nombre`, `ubicacion`, `activo`) VALUES
(1, 'Arduino1', 'tecoman', 1),
(2, 'arduino2', 'manzanillo', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mediciones`
--

CREATE TABLE `mediciones` (
  `id_mediciones` int(11) NOT NULL,
  `id_sensor` int(11) NOT NULL,
  `id_arduino` int(100) NOT NULL,
  `valor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mediciones`
--

INSERT INTO `mediciones` (`id_mediciones`, `id_sensor`, `id_arduino`, `valor`) VALUES
(1, 1, 1, 30),
(2, 1, 1, 20),
(3, 2, 1, 20),
(4, 2, 2, 20),
(5, 2, 2, 20),
(6, 2, 2, 15),
(7, 1, 1, 20),
(8, 2, 1, 15),
(9, 1, 1, 20),
(10, 2, 1, 15),
(11, 3, 1, 30),
(12, 4, 1, 32),
(13, 1, 1, 20),
(14, 2, 1, 15),
(15, 3, 1, 30),
(16, 4, 1, 32),
(17, 1, 1, 20),
(18, 2, 1, 15),
(19, 3, 1, 30),
(20, 4, 1, 32),
(21, 1, 1, 20),
(22, 2, 1, 15),
(23, 3, 1, 30),
(24, 4, 1, 32),
(25, 1, 2, 20),
(26, 2, 2, 15),
(27, 3, 2, 30),
(28, 4, 2, 32),
(29, 1, 1, 20),
(30, 2, 1, 15),
(31, 3, 1, 30),
(32, 4, 1, 32),
(33, 1, 2, 20),
(34, 2, 2, 15),
(35, 3, 2, 30),
(36, 4, 2, 32);

-- --------------------------------------------------------

--
-- Table structure for table `sensores`
--

CREATE TABLE `sensores` (
  `id_sensores` int(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `unidad` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sensores`
--

INSERT INTO `sensores` (`id_sensores`, `nombre`, `unidad`) VALUES
(1, 'sensor_temperatura', 'Grados'),
(2, 'sensor_humedad', 'Humedad'),
(3, 'sensor_profundidad', 'Metros'),
(4, 'sensor_humedad_suelo', 'Humedad');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(10) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `clave` varchar(50) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `super_usuario` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `clave`, `correo`, `super_usuario`) VALUES
(1, 'administrador', 'colima', 'lchavez@rootsecurity.team', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ardsensor`
--
ALTER TABLE `ardsensor`
  ADD PRIMARY KEY (`id_ardsensor`),
  ADD KEY `id_arduinos` (`id_arduinos`),
  ADD KEY `id` (`id_sensores`);

--
-- Indexes for table `arduinos`
--
ALTER TABLE `arduinos`
  ADD PRIMARY KEY (`id_arduinos`);

--
-- Indexes for table `mediciones`
--
ALTER TABLE `mediciones`
  ADD PRIMARY KEY (`id_mediciones`),
  ADD KEY `id_sensor` (`id_sensor`),
  ADD KEY `id_arduino` (`id_arduino`);

--
-- Indexes for table `sensores`
--
ALTER TABLE `sensores`
  ADD PRIMARY KEY (`id_sensores`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ardsensor`
--
ALTER TABLE `ardsensor`
  MODIFY `id_ardsensor` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `arduinos`
--
ALTER TABLE `arduinos`
  MODIFY `id_arduinos` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `mediciones`
--
ALTER TABLE `mediciones`
  MODIFY `id_mediciones` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `sensores`
--
ALTER TABLE `sensores`
  MODIFY `id_sensores` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `ardsensor`
--
ALTER TABLE `ardsensor`
  ADD CONSTRAINT `ardsensor_ibfk_1` FOREIGN KEY (`id_arduinos`) REFERENCES `arduinos` (`id_arduinos`),
  ADD CONSTRAINT `ardsensor_ibfk_2` FOREIGN KEY (`id_sensores`) REFERENCES `sensores` (`id_sensores`);

--
-- Constraints for table `mediciones`
--
ALTER TABLE `mediciones`
  ADD CONSTRAINT `mediciones_ibfk_1` FOREIGN KEY (`id_sensor`) REFERENCES `sensores` (`id_sensores`),
  ADD CONSTRAINT `mediciones_ibfk_2` FOREIGN KEY (`id_arduino`) REFERENCES `arduinos` (`id_arduinos`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
