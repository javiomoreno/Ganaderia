-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-07-2016 a las 17:38:46
-- Versión del servidor: 5.6.17
-- Versión de PHP: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `ganaderiadb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_assignment`
--

CREATE TABLE IF NOT EXISTS `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('administrador', '1', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_item`
--

CREATE TABLE IF NOT EXISTS `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('administrador', 1, 'Administrador del Sistema', NULL, NULL, NULL, NULL),
('usuario', 1, 'Usuario del Sistema', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_item_child`
--

CREATE TABLE IF NOT EXISTS `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_rule`
--

CREATE TABLE IF NOT EXISTS `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ganados`
--

CREATE TABLE IF NOT EXISTS `ganados` (
  `ganaiden` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gananomb` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ganadesc` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ganaespe` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ganapeso` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ganaiden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ganados_pastos`
--

CREATE TABLE IF NOT EXISTS `ganados_pastos` (
  `gapaiden` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Ganados_ganaiden` int(10) unsigned NOT NULL,
  `Pastos_pastiden` int(10) unsigned NOT NULL,
  PRIMARY KEY (`gapaiden`),
  KEY `Ganados_Pastos_FKIndex1` (`Pastos_pastiden`),
  KEY `Ganados_Pastos_FKIndex2` (`Ganados_ganaiden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migration`
--

CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1468080889),
('m140506_102106_rbac_init', 1468080933);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pastos`
--

CREATE TABLE IF NOT EXISTS `pastos` (
  `pastiden` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pastnomb` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pastdesc` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pastespe` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`pastiden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pastos_tierras`
--

CREATE TABLE IF NOT EXISTS `pastos_tierras` (
  `patiiden` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Suelos_sueliden` int(10) unsigned NOT NULL,
  `Pastos_pastiden` int(10) unsigned NOT NULL,
  PRIMARY KEY (`patiiden`),
  KEY `Pastos_Tierras_FKIndex1` (`Pastos_pastiden`),
  KEY `Pastos_Tierras_FKIndex2` (`Suelos_sueliden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reglasinferencias`
--

CREATE TABLE IF NOT EXISTS `reglasinferencias` (
  `reiniden` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Usuarios_usuaiden` int(10) unsigned NOT NULL,
  `reinfech` date DEFAULT NULL,
  `reincons` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`reiniden`),
  KEY `ReglasInferencias_FKIndex1` (`Usuarios_usuaiden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `suelos`
--

CREATE TABLE IF NOT EXISTS `suelos` (
  `sueliden` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `suelnomb` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sueldesc` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sueltipo` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `suelcons` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `suelcomp` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`sueliden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tierras_ganados`
--

CREATE TABLE IF NOT EXISTS `tierras_ganados` (
  `tigaiden` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Suelos_sueliden` int(10) unsigned NOT NULL,
  `Ganados_ganaiden` int(10) unsigned NOT NULL,
  PRIMARY KEY (`tigaiden`),
  KEY `Tierras_Ganados_FKIndex1` (`Suelos_sueliden`),
  KEY `Tierras_Ganados_FKIndex2` (`Ganados_ganaiden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipousuarios`
--

CREATE TABLE IF NOT EXISTS `tipousuarios` (
  `tiusiden` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tiusnomb` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tiusdesc` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`tiusiden`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `tipousuarios`
--

INSERT INTO `tipousuarios` (`tiusiden`, `tiusnomb`, `tiusdesc`) VALUES
(1, 'Administrador', 'Administrador del Sistema'),
(2, 'Usuario', 'Usuario del Sistema');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `usuaiden` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TipoUsuarios_tiusiden` int(10) unsigned NOT NULL,
  `usuanomb` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usuaapel` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usuatele` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usuadire` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usuacorr` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usuapass` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`usuaiden`),
  KEY `Usuarios_FKIndex1` (`TipoUsuarios_tiusiden`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usuaiden`, `TipoUsuarios_tiusiden`, `usuanomb`, `usuaapel`, `usuatele`, `usuadire`, `usuacorr`, `usuapass`) VALUES
(1, 1, 'Administrador', 'Administrador', NULL, NULL, 'admin@ganaderia.com', 'MTIzNDU2');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ganados_pastos`
--
ALTER TABLE `ganados_pastos`
  ADD CONSTRAINT `ganados_pastos_ibfk_1` FOREIGN KEY (`Pastos_pastiden`) REFERENCES `pastos` (`pastiden`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ganados_pastos_ibfk_2` FOREIGN KEY (`Ganados_ganaiden`) REFERENCES `ganados` (`ganaiden`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pastos_tierras`
--
ALTER TABLE `pastos_tierras`
  ADD CONSTRAINT `pastos_tierras_ibfk_1` FOREIGN KEY (`Pastos_pastiden`) REFERENCES `pastos` (`pastiden`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pastos_tierras_ibfk_2` FOREIGN KEY (`Suelos_sueliden`) REFERENCES `suelos` (`sueliden`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `reglasinferencias`
--
ALTER TABLE `reglasinferencias`
  ADD CONSTRAINT `reglasinferencias_ibfk_1` FOREIGN KEY (`Usuarios_usuaiden`) REFERENCES `usuarios` (`usuaiden`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tierras_ganados`
--
ALTER TABLE `tierras_ganados`
  ADD CONSTRAINT `tierras_ganados_ibfk_1` FOREIGN KEY (`Suelos_sueliden`) REFERENCES `suelos` (`sueliden`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tierras_ganados_ibfk_2` FOREIGN KEY (`Ganados_ganaiden`) REFERENCES `ganados` (`ganaiden`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`TipoUsuarios_tiusiden`) REFERENCES `tipousuarios` (`tiusiden`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
