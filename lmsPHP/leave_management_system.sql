-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 18 juin 2020 à 22:42
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `management`
--

-- --------------------------------------------------------

--
-- Structure de la table `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `department`
--

INSERT INTO `department` (`id`, `department`) VALUES
(3, 'Management '),
(4, 'services'),
(5, 'HR'),
(7, 'Marketing');

-- --------------------------------------------------------

--
-- Structure de la table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `paswoord` text NOT NULL,
  `department_id` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `CIN` text NOT NULL,
  `role` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `employee`
--

INSERT INTO `employee` (`id`, `name`, `email`, `mobile`, `paswoord`, `department_id`, `address`, `CIN`, `role`) VALUES
(1, 'khadija', 'khadija@gmail.com', '123456789', '123', 0, '', '0000-00-00', 1),
(2, 'amine', 'amine@gmail.com', '123456789', 'amine', 3, 'youssoufia', '2020-10-31', 2),
(3, 'kawtar', 'kawtarl@gmail.com', '03932145678', '000', 3, 'Marakech', '1987-10-31', 2),
(5, 'naima', 'naima@gmail.com', '0678954321', 'naima', 3, 'Youssoufia', 'GH98765', 2),
(6, 'mourad', 'mourad@gmail.com', '0987655432', '000', 5, 'Casablanca', 'MO6753', 2);

-- --------------------------------------------------------

--
-- Structure de la table `leave`
--

DROP TABLE IF EXISTS `leave`;
CREATE TABLE IF NOT EXISTS `leave` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `leave_id` int(11) NOT NULL,
  `leave_from` date NOT NULL,
  `leave_to` date NOT NULL,
  `leave_description` text NOT NULL,
  `leave_status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `leave`
--

INSERT INTO `leave` (`id`, `employee_id`, `leave_id`, `leave_from`, `leave_to`, `leave_description`, `leave_status`) VALUES
(2, 2, 3, '2020-01-01', '2020-01-02', 'Not well', 2),
(3, 4, 2, '2020-01-01', '2020-01-02', 'test', 3),
(4, 4, 3, '2020-01-02', '2020-01-03', 'test desc\'', 2),
(6, 3, 4, '2020-05-15', '2020-05-17', 'sick', 2);

-- --------------------------------------------------------

--
-- Structure de la table `leave_type`
--

DROP TABLE IF EXISTS `leave_type`;
CREATE TABLE IF NOT EXISTS `leave_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `leave_type` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `leave_type`
--

INSERT INTO `leave_type` (`id`, `leave_type`) VALUES
(2, 'Casual'),
(3, 'Earned'),
(4, 'Sick');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
