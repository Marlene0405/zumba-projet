-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 28 mai 2019 à 13:10
-- Version du serveur :  5.7.23
-- Version de PHP :  7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `zumbab2m`
--
CREATE DATABASE IF NOT EXISTS `zumbab2m` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `zumbab2m`;

-- --------------------------------------------------------

--
-- Structure de la table `adherent`
--

DROP TABLE IF EXISTS `adherent`;
CREATE TABLE IF NOT EXISTS `adherent` (
  `ID_ADHERENT` int(11) NOT NULL AUTO_INCREMENT,
  `LOGIN_ADHERENT` varchar(255) NOT NULL,
  `NOM_ADHERENT` varchar(255) NOT NULL,
  `PRENOM_ADHERENT` varchar(255) NOT NULL,
  `MDP_ADHERENT` varchar(255) NOT NULL,
  `STATUT_ADHERENT` int(11) NOT NULL,
  `ADRESSE_ADHERENT` varchar(255) NOT NULL,
  `CP_ADHERENT` int(5) NOT NULL,
  `VILLE_ADHERENT` varchar(255) NOT NULL,
  `TEL_ADHERENT` int(10) NOT NULL,
  `MAIL_ADHERENT` varchar(255) NOT NULL,
  `PHOTO_ADHERENT` varchar(255) NOT NULL,
  `DATE_ADHERENT` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_ADHERENT`),
  KEY `LOGIN_ADHERENT` (`LOGIN_ADHERENT`),
  KEY `STATUT_ADHERENT` (`STATUT_ADHERENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `appartient`
--

DROP TABLE IF EXISTS `appartient`;
CREATE TABLE IF NOT EXISTS `appartient` (
  `ID_ADHERENT` int(11) NOT NULL,
  `ID_STATUT` int(11) NOT NULL,
  PRIMARY KEY (`ID_ADHERENT`,`ID_STATUT`),
  KEY `ID_ADHERENT` (`ID_ADHERENT`,`ID_STATUT`),
  KEY `FK_STATUT` (`ID_STATUT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `soiree`
--

DROP TABLE IF EXISTS `soiree`;
CREATE TABLE IF NOT EXISTS `soiree` (
  `ID_SOIREE` int(11) NOT NULL AUTO_INCREMENT,
  `TITRE_SOIREE` varchar(255) NOT NULL,
  `DATE_SOIREE` date NOT NULL,
  `HEURE_SOIREE` time NOT NULL,
  `DESCRIPTION_SOIREE` text NOT NULL,
  `PHOTO_SOIREE` varchar(255) NOT NULL,
  PRIMARY KEY (`ID_SOIREE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `statut`
--

DROP TABLE IF EXISTS `statut`;
CREATE TABLE IF NOT EXISTS `statut` (
  `ID_STATUT` int(11) NOT NULL AUTO_INCREMENT,
  `NOM_STATUT` varchar(255) NOT NULL,
  PRIMARY KEY (`ID_STATUT`),
  KEY `ID_STATUT` (`ID_STATUT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `appartient`
--
ALTER TABLE `appartient`
  ADD CONSTRAINT `FK_ADHERENT` FOREIGN KEY (`ID_ADHERENT`) REFERENCES `adherent` (`ID_ADHERENT`),
  ADD CONSTRAINT `FK_STATUT` FOREIGN KEY (`ID_STATUT`) REFERENCES `statut` (`ID_STATUT`);

--
-- Contraintes pour la table `soiree`
--
ALTER TABLE `soiree`
  ADD CONSTRAINT `FK_LIEE` FOREIGN KEY (`ID_SOIREE`) REFERENCES `adherent` (`ID_ADHERENT`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
