-- phpMyAdmin SQL Dump
-- version 3.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 05, 2012 at 11:37 AM
-- Server version: 5.5.25a
-- PHP Version: 5.4.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `servicio`
--

-- --------------------------------------------------------

--
-- Table structure for table `aereo`
--

CREATE TABLE IF NOT EXISTS `aereo` (
  `ID_Aereo` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID_Aereo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `destinatario`
--

CREATE TABLE IF NOT EXISTS `destinatario` (
  `ID_Destinatario` int(10) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(12) COLLATE utf8mb4_spanish_ci NOT NULL,
  `Direccion` varchar(12) COLLATE utf8mb4_spanish_ci NOT NULL,
  `No_Telefonico` varchar(12) COLLATE utf8mb4_spanish_ci NOT NULL,
  `Pais` char(10) COLLATE utf8mb4_spanish_ci NOT NULL,
  `Ciudad` char(10) COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`ID_Destinatario`),
  KEY `ID_Destinatario` (`ID_Destinatario`),
  KEY `ID_Destinatario_2` (`ID_Destinatario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `empresa_asociada`
--

CREATE TABLE IF NOT EXISTS `empresa_asociada` (
  `ID_Empresa_Asociada` int(10) NOT NULL AUTO_INCREMENT,
  `Nit` varchar(12) COLLATE utf8mb4_spanish_ci NOT NULL,
  `Nombre` char(12) COLLATE utf8mb4_spanish_ci NOT NULL,
  `Direccion` char(10) COLLATE utf8mb4_spanish_ci NOT NULL,
  `Pais` char(10) COLLATE utf8mb4_spanish_ci NOT NULL,
  `Ciudad` char(12) COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`ID_Empresa_Asociada`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `envio`
--

CREATE TABLE IF NOT EXISTS `envio` (
  `ID_Envio` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Formas_Envio` int(11) NOT NULL COMMENT 'FK',
  `ID_Formulario` int(11) NOT NULL COMMENT 'FK',
  `ID_Estado` int(11) NOT NULL COMMENT 'FK',
  `ID_Mensajero` int(11) NOT NULL COMMENT 'FK',
  PRIMARY KEY (`ID_Envio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `estado`
--

CREATE TABLE IF NOT EXISTS `estado` (
  `ID_Estado` int(11) NOT NULL AUTO_INCREMENT,
  `Entregado` tinyint(1) NOT NULL,
  `No_Entrega` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID_Estado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `facturacion`
--

CREATE TABLE IF NOT EXISTS `facturacion` (
  `ID_Facturacion` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Envio` int(11) NOT NULL COMMENT 'FK',
  `Firma_Destinatario` char(12) COLLATE utf8mb4_spanish_ci NOT NULL,
  `Firma_Mensajero` char(12) COLLATE utf8mb4_spanish_ci NOT NULL,
  `Costo_Envio` double NOT NULL,
  PRIMARY KEY (`ID_Facturacion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `formas_envio`
--

CREATE TABLE IF NOT EXISTS `formas_envio` (
  `ID_Formas_Envio` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Terrestre` int(11) NOT NULL COMMENT 'FK',
  `ID_Aereo` int(11) NOT NULL COMMENT 'FK',
  PRIMARY KEY (`ID_Formas_Envio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `formas_pago`
--

CREATE TABLE IF NOT EXISTS `formas_pago` (
  `ID_Formas_Pago` int(11) NOT NULL AUTO_INCREMENT,
  `Remitente` tinyint(1) NOT NULL,
  `Destinatario` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID_Formas_Pago`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `formulario`
--

CREATE TABLE IF NOT EXISTS `formulario` (
  `ID_Formulario` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Destinatario` int(11) NOT NULL COMMENT 'FK',
  `ID_Tipo_Remitente` int(11) NOT NULL COMMENT 'FK',
  `ID_Forma_Pago` int(11) NOT NULL COMMENT 'FK',
  `ID_Paquete` int(11) NOT NULL COMMENT 'FK',
  PRIMARY KEY (`ID_Formulario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mensajero`
--

CREATE TABLE IF NOT EXISTS `mensajero` (
  `ID_Mensajero` int(10) NOT NULL AUTO_INCREMENT,
  `Nombre` char(12) COLLATE utf8mb4_spanish_ci NOT NULL,
  `Cedula` varchar(10) COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`ID_Mensajero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `paquete`
--

CREATE TABLE IF NOT EXISTS `paquete` (
  `ID_Paquete` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Politica_Costo` int(11) NOT NULL COMMENT 'FK',
  `Valor` double NOT NULL,
  `Peso` double NOT NULL,
  `Tamaño` double NOT NULL,
  PRIMARY KEY (`ID_Paquete`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `politica_costo`
--

CREATE TABLE IF NOT EXISTS `politica_costo` (
  `ID_Politica_Costo` int(10) NOT NULL AUTO_INCREMENT,
  `Tamaño` double NOT NULL,
  `Peso` double NOT NULL,
  `Volumen` double NOT NULL,
  `Pais` char(12) COLLATE utf8mb4_spanish_ci NOT NULL,
  `Ciudad` char(12) COLLATE utf8mb4_spanish_ci NOT NULL,
  `Cantidad` int(10) NOT NULL,
  PRIMARY KEY (`ID_Politica_Costo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `remitente`
--

CREATE TABLE IF NOT EXISTS `remitente` (
  `ID_Remitente` int(10) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(12) COLLATE utf8mb4_spanish_ci NOT NULL,
  `Cedula` int(10) NOT NULL,
  `Direccion` char(10) COLLATE utf8mb4_spanish_ci NOT NULL,
  `Pais` char(12) COLLATE utf8mb4_spanish_ci NOT NULL,
  `Ciudad` char(12) COLLATE utf8mb4_spanish_ci NOT NULL,
  PRIMARY KEY (`ID_Remitente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `terrestre`
--

CREATE TABLE IF NOT EXISTS `terrestre` (
  `ID_Terrestre` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID_Terrestre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tipo_remitente`
--

CREATE TABLE IF NOT EXISTS `tipo_remitente` (
  `ID_Tipo_Remitente` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Rmitente` int(11) NOT NULL COMMENT 'FK',
  `ID_Empresa_Asociada` int(11) NOT NULL COMMENT 'FK',
  PRIMARY KEY (`ID_Tipo_Remitente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
