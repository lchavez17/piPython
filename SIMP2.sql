-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 12, 2017 at 07:30 PM
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
  `nombre_arduino` varchar(50) NOT NULL,
  `ubicacion` varchar(100) NOT NULL,
  `activo` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `arduinos`
--

INSERT INTO `arduinos` (`id_arduinos`, `nombre_arduino`, `ubicacion`, `activo`) VALUES
(1, 'Arduino1', 'tecoman', 1),
(2, 'arduino2', 'manzanillo', 1),
(3, 'arduino3', 'armeria', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mediciones`
--

CREATE TABLE `mediciones` (
  `id_mediciones` int(11) NOT NULL,
  `id_sensor` int(11) NOT NULL,
  `id_arduino` int(100) NOT NULL,
  `valor` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mediciones`
--

INSERT INTO `mediciones` (`id_mediciones`, `id_sensor`, `id_arduino`, `valor`, `fecha`) VALUES
(495, 1, 1, 2099, '2017-11-12 07:25:17'),
(496, 2, 1, 4099, '2017-11-12 07:25:17'),
(497, 3, 1, 6099, '2017-11-12 07:25:17'),
(498, 4, 1, 8099, '2017-11-12 07:25:17'),
(499, 1, 2, 1000, '2017-11-12 07:25:17'),
(500, 2, 2, 20000, '2017-11-12 07:25:17'),
(501, 3, 2, 3000, '2017-11-12 07:25:17'),
(502, 4, 2, 4200, '2017-11-12 07:25:17'),
(503, 1, 3, 2099, '2017-11-12 07:25:17'),
(504, 2, 3, 4099, '2017-11-12 07:25:17'),
(505, 3, 3, 6099, '2017-11-12 07:25:17'),
(506, 4, 3, 8099, '2017-11-12 07:25:17'),
(507, 1, 1, 2099, '2017-11-12 16:55:02'),
(508, 2, 1, 4099, '2017-11-12 16:55:02'),
(509, 3, 1, 6099, '2017-11-12 16:55:02'),
(510, 4, 1, 8099, '2017-11-12 16:55:02'),
(511, 1, 2, 1000, '2017-11-12 16:55:03'),
(512, 2, 2, 20000, '2017-11-12 16:55:03'),
(513, 3, 2, 3000, '2017-11-12 16:55:03'),
(514, 4, 2, 4200, '2017-11-12 16:55:03'),
(515, 1, 3, 2099, '2017-11-12 16:55:03'),
(516, 2, 3, 4099, '2017-11-12 16:55:03'),
(517, 3, 3, 6099, '2017-11-12 16:55:03'),
(518, 4, 3, 8099, '2017-11-12 16:55:03'),
(519, 1, 1, 2099, '2017-11-12 17:02:35'),
(520, 2, 1, 4099, '2017-11-12 17:02:35'),
(521, 3, 1, 6099, '2017-11-12 17:02:35'),
(522, 4, 1, 8099, '2017-11-12 17:02:35'),
(523, 1, 2, 1000, '2017-11-12 17:02:35'),
(524, 2, 2, 20000, '2017-11-12 17:02:35'),
(525, 3, 2, 3000, '2017-11-12 17:02:35'),
(526, 4, 2, 4200, '2017-11-12 17:02:35'),
(527, 1, 3, 2099, '2017-11-12 17:02:35'),
(528, 2, 3, 4099, '2017-11-12 17:02:35'),
(529, 3, 3, 6099, '2017-11-12 17:02:35'),
(530, 4, 3, 8099, '2017-11-12 17:02:35'),
(531, 1, 1, 2099, '2017-11-12 17:03:11'),
(532, 2, 1, 4099, '2017-11-12 17:03:11'),
(533, 3, 1, 6099, '2017-11-12 17:03:11'),
(534, 4, 1, 8099, '2017-11-12 17:03:11'),
(535, 1, 2, 1000, '2017-11-12 17:03:11'),
(536, 2, 2, 20000, '2017-11-12 17:03:11'),
(537, 3, 2, 3000, '2017-11-12 17:03:11'),
(538, 4, 2, 4200, '2017-11-12 17:03:11'),
(539, 1, 3, 2099, '2017-11-12 17:03:11'),
(540, 2, 3, 4099, '2017-11-12 17:03:11'),
(541, 3, 3, 6099, '2017-11-12 17:03:11'),
(542, 4, 3, 8099, '2017-11-12 17:03:11'),
(543, 1, 1, 2099, '2017-11-12 17:06:30'),
(544, 2, 1, 4099, '2017-11-12 17:06:30'),
(545, 3, 1, 6099, '2017-11-12 17:06:30'),
(546, 4, 1, 8099, '2017-11-12 17:06:30'),
(547, 1, 2, 1000, '2017-11-12 17:06:30'),
(548, 2, 2, 20000, '2017-11-12 17:06:30'),
(549, 3, 2, 3000, '2017-11-12 17:06:30'),
(550, 4, 2, 4200, '2017-11-12 17:06:30'),
(551, 1, 3, 2099, '2017-11-12 17:06:30'),
(552, 2, 3, 4099, '2017-11-12 17:06:30'),
(553, 3, 3, 6099, '2017-11-12 17:06:30'),
(554, 4, 3, 8099, '2017-11-12 17:06:30'),
(555, 1, 1, 2099, '2017-11-12 17:10:07'),
(556, 2, 1, 4099, '2017-11-12 17:10:07'),
(557, 3, 1, 6099, '2017-11-12 17:10:07'),
(558, 4, 1, 8099, '2017-11-12 17:10:07'),
(559, 1, 2, 1000, '2017-11-12 17:10:07'),
(560, 2, 2, 20000, '2017-11-12 17:10:07'),
(561, 3, 2, 3000, '2017-11-12 17:10:07'),
(562, 4, 2, 4200, '2017-11-12 17:10:07'),
(563, 1, 3, 2099, '2017-11-12 17:10:07'),
(564, 2, 3, 4099, '2017-11-12 17:10:07'),
(565, 3, 3, 6099, '2017-11-12 17:10:07'),
(566, 4, 3, 8099, '2017-11-12 17:10:07'),
(567, 1, 1, 2099, '2017-11-12 19:48:27'),
(568, 2, 1, 4099, '2017-11-12 19:48:27'),
(569, 3, 1, 6099, '2017-11-12 19:48:27'),
(570, 4, 1, 8099, '2017-11-12 19:48:27'),
(571, 1, 2, 1000, '2017-11-12 19:48:27'),
(572, 2, 2, 20000, '2017-11-12 19:48:27'),
(573, 3, 2, 3000, '2017-11-12 19:48:27'),
(574, 4, 2, 4200, '2017-11-12 19:48:27'),
(575, 1, 3, 2099, '2017-11-12 19:48:27'),
(576, 2, 3, 4099, '2017-11-12 19:48:27'),
(577, 3, 3, 6099, '2017-11-12 19:48:27'),
(578, 4, 3, 8099, '2017-11-12 19:48:27'),
(579, 1, 1, 2099, '2017-11-12 22:59:28'),
(580, 2, 1, 4099, '2017-11-12 22:59:28'),
(581, 3, 1, 6099, '2017-11-12 22:59:28'),
(582, 4, 1, 8099, '2017-11-12 22:59:28'),
(583, 1, 2, 1000, '2017-11-12 22:59:28'),
(584, 2, 2, 20000, '2017-11-12 22:59:28'),
(585, 3, 2, 3000, '2017-11-12 22:59:28'),
(586, 4, 2, 4200, '2017-11-12 22:59:28'),
(587, 1, 3, 2099, '2017-11-12 22:59:28'),
(588, 2, 3, 4099, '2017-11-12 22:59:28'),
(589, 3, 3, 6099, '2017-11-12 22:59:28'),
(590, 4, 3, 8099, '2017-11-12 22:59:28'),
(591, 1, 1, 2099, '2017-11-12 22:59:52'),
(592, 2, 1, 4099, '2017-11-12 22:59:52'),
(593, 3, 1, 6099, '2017-11-12 22:59:52'),
(594, 4, 1, 29, '2017-11-12 22:59:52'),
(595, 1, 1, 2099, '2017-11-12 23:00:49'),
(596, 2, 1, 4099, '2017-11-12 23:00:49'),
(597, 3, 1, 6099, '2017-11-12 23:00:49'),
(598, 4, 1, 29, '2017-11-12 23:00:49'),
(599, 1, 1, 2099, '2017-11-13 00:21:52'),
(600, 2, 1, 4099, '2017-11-13 00:21:52'),
(601, 3, 1, 6099, '2017-11-13 00:21:52'),
(602, 4, 1, 29, '2017-11-13 00:21:52'),
(603, 1, 1, 2099, '2017-11-13 00:22:09'),
(604, 2, 1, 4099, '2017-11-13 00:22:09'),
(605, 3, 1, 6099, '2017-11-13 00:22:09'),
(606, 4, 1, 29, '2017-11-13 00:22:09'),
(607, 1, 1, 2099, '2017-11-13 00:22:10'),
(608, 2, 1, 4099, '2017-11-13 00:22:10'),
(609, 3, 1, 6099, '2017-11-13 00:22:10'),
(610, 4, 1, 29, '2017-11-13 00:22:10'),
(611, 1, 1, 2099, '2017-11-13 00:22:33'),
(612, 2, 1, 4099, '2017-11-13 00:22:33'),
(613, 3, 1, 6099, '2017-11-13 00:22:33'),
(614, 4, 1, 29, '2017-11-13 00:22:33'),
(615, 1, 1, 29, '2017-11-13 00:23:25'),
(616, 2, 1, 125, '2017-11-13 00:23:25'),
(617, 3, 1, 20, '2017-11-13 00:23:25'),
(618, 4, 1, 32, '2017-11-13 00:23:25'),
(619, 1, 2, 29, '2017-11-13 00:23:25'),
(620, 2, 2, 125, '2017-11-13 00:23:25'),
(621, 3, 2, 20, '2017-11-13 00:23:25'),
(622, 4, 2, 32, '2017-11-13 00:23:25'),
(623, 1, 1, 29, '2017-11-13 00:24:53'),
(624, 2, 1, 125, '2017-11-13 00:24:53'),
(625, 3, 1, 20, '2017-11-13 00:24:53'),
(626, 4, 1, 32, '2017-11-13 00:24:53'),
(627, 1, 2, 29, '2017-11-13 00:24:53'),
(628, 2, 2, 125, '2017-11-13 00:24:53'),
(629, 3, 2, 20, '2017-11-13 00:24:53'),
(630, 4, 2, 32, '2017-11-13 00:24:53');

-- --------------------------------------------------------

--
-- Table structure for table `sensores`
--

CREATE TABLE `sensores` (
  `id_sensores` int(10) NOT NULL,
  `nombre_sensor` varchar(50) NOT NULL,
  `unidad` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sensores`
--

INSERT INTO `sensores` (`id_sensores`, `nombre_sensor`, `unidad`) VALUES
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
  MODIFY `id_arduinos` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `mediciones`
--
ALTER TABLE `mediciones`
  MODIFY `id_mediciones` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=631;
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
