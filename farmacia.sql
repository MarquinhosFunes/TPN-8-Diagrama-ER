-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 02, 2024 at 12:03 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `farmacia`
--

-- --------------------------------------------------------

--
-- Table structure for table `bancos`
--

CREATE TABLE `bancos` (
  `Id_Banco` int(11) NOT NULL,
  `NombreTitular_Banco` int(11) NOT NULL,
  `NumTarjeta_Banco` varchar(255) NOT NULL,
  `CVV_Banco` int(11) NOT NULL,
  `FechaVence_Banco` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clientes`
--

CREATE TABLE `clientes` (
  `Id_Cliente` int(11) NOT NULL,
  `Id_Banco` int(11) NOT NULL,
  `ConCredito_Cliente` tinyint(1) NOT NULL,
  `Nombre_Cliente` varchar(255) NOT NULL,
  `Apellido_Cliente` varchar(255) NOT NULL,
  `Direccion_Cliente` varchar(255) NOT NULL,
  `TelMovil_Cliente` varchar(255) NOT NULL,
  `Email_Cliente` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `empleado_laboratorio`
--

CREATE TABLE `empleado_laboratorio` (
  `Id_Empleado_Laboratorio` int(11) NOT NULL,
  `Nombre_Empleado_Laboratorio` varchar(255) NOT NULL,
  `Apellido_Empleado_Laboratorio` varchar(255) NOT NULL,
  `DNI_Empleado_Laboratorio` varchar(255) NOT NULL,
  `TelMovil_Empleado_Laboratorio` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `familia`
--

CREATE TABLE `familia` (
  `Id_Familia` int(11) NOT NULL,
  `Nombre_Familia` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `laboratorios`
--

CREATE TABLE `laboratorios` (
  `Id_Laboratorio` int(11) NOT NULL,
  `Id_EmpleadoContacto` int(11) NOT NULL,
  `Nombre_Laboratorio` varchar(255) NOT NULL,
  `Telefono_Laboratorio` varchar(255) NOT NULL,
  `Direccion_Laboratorio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `medicamentos`
--

CREATE TABLE `medicamentos` (
  `Id_Medicamento` int(11) NOT NULL,
  `Id_Laboratorio` int(11) NOT NULL,
  `Id_Familia` int(11) NOT NULL,
  `Nombre_Medicamento` varchar(255) NOT NULL,
  `Tipo_Medicamento` varchar(255) NOT NULL,
  `CantStock_Medicamento` int(11) NOT NULL,
  `CantVendida_Medicamento` int(11) NOT NULL,
  `Precio_Medicamento` int(11) NOT NULL,
  `RequiereReceta_Medicamento` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pedidos`
--

CREATE TABLE `pedidos` (
  `Id_Pedido` int(11) NOT NULL,
  `Id_Cliente` int(11) NOT NULL,
  `Id_Medicamento` int(11) NOT NULL,
  `Cantidad_Pedido` int(11) NOT NULL,
  `Fecha_Pedido` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bancos`
--
ALTER TABLE `bancos`
  ADD PRIMARY KEY (`Id_Banco`),
  ADD UNIQUE KEY `Id_Banco` (`Id_Banco`);

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`Id_Cliente`),
  ADD UNIQUE KEY `Id_Cliente` (`Id_Cliente`),
  ADD KEY `Clientes_fk1` (`Id_Banco`);

--
-- Indexes for table `empleado_laboratorio`
--
ALTER TABLE `empleado_laboratorio`
  ADD PRIMARY KEY (`Id_Empleado_Laboratorio`),
  ADD UNIQUE KEY `Id_Empleado_Laboratorio` (`Id_Empleado_Laboratorio`);

--
-- Indexes for table `familia`
--
ALTER TABLE `familia`
  ADD PRIMARY KEY (`Id_Familia`),
  ADD UNIQUE KEY `Id_Familia` (`Id_Familia`);

--
-- Indexes for table `laboratorios`
--
ALTER TABLE `laboratorios`
  ADD PRIMARY KEY (`Id_Laboratorio`),
  ADD UNIQUE KEY `Id_Laboratorio` (`Id_Laboratorio`),
  ADD KEY `Laboratorios_fk1` (`Id_EmpleadoContacto`);

--
-- Indexes for table `medicamentos`
--
ALTER TABLE `medicamentos`
  ADD PRIMARY KEY (`Id_Medicamento`),
  ADD UNIQUE KEY `Id_Medicamento` (`Id_Medicamento`),
  ADD KEY `Medicamentos_fk1` (`Id_Laboratorio`),
  ADD KEY `Medicamentos_fk2` (`Id_Familia`);

--
-- Indexes for table `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`Id_Pedido`),
  ADD UNIQUE KEY `Id_Pedido` (`Id_Pedido`),
  ADD KEY `Pedidos_fk1` (`Id_Cliente`),
  ADD KEY `Pedidos_fk2` (`Id_Medicamento`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bancos`
--
ALTER TABLE `bancos`
  MODIFY `Id_Banco` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clientes`
--
ALTER TABLE `clientes`
  MODIFY `Id_Cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `empleado_laboratorio`
--
ALTER TABLE `empleado_laboratorio`
  MODIFY `Id_Empleado_Laboratorio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `familia`
--
ALTER TABLE `familia`
  MODIFY `Id_Familia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `laboratorios`
--
ALTER TABLE `laboratorios`
  MODIFY `Id_Laboratorio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medicamentos`
--
ALTER TABLE `medicamentos`
  MODIFY `Id_Medicamento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `Id_Pedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `Clientes_fk1` FOREIGN KEY (`Id_Banco`) REFERENCES `bancos` (`Id_Banco`);

--
-- Constraints for table `laboratorios`
--
ALTER TABLE `laboratorios`
  ADD CONSTRAINT `Laboratorios_fk1` FOREIGN KEY (`Id_EmpleadoContacto`) REFERENCES `empleado_laboratorio` (`Id_Empleado_Laboratorio`);

--
-- Constraints for table `medicamentos`
--
ALTER TABLE `medicamentos`
  ADD CONSTRAINT `Medicamentos_fk1` FOREIGN KEY (`Id_Laboratorio`) REFERENCES `laboratorios` (`Id_Laboratorio`),
  ADD CONSTRAINT `Medicamentos_fk2` FOREIGN KEY (`Id_Familia`) REFERENCES `familia` (`Id_Familia`);

--
-- Constraints for table `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `Pedidos_fk1` FOREIGN KEY (`Id_Cliente`) REFERENCES `clientes` (`Id_Cliente`),
  ADD CONSTRAINT `Pedidos_fk2` FOREIGN KEY (`Id_Medicamento`) REFERENCES `medicamentos` (`Id_Medicamento`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
