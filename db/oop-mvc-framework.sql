-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Gegenereerd op: 28 jan 2023 om 18:38
-- Serverversie: 5.7.31
-- PHP-versie: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `oop-mvc-framework`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Adres`
--

DROP TABLE IF EXISTS `Adres`;
CREATE TABLE IF NOT EXISTS `Adres` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `PersoonId` int(11) NOT NULL,
  `AdresType` varchar(20) NOT NULL,
  `Straatnaam` varchar(50) NOT NULL,
  `Huisnummer` int(5) NOT NULL,
  `Toevoeging` varchar(5) DEFAULT NULL,
  `Postcode` varchar(6) NOT NULL,
  `Woonplaats` varchar(100) NOT NULL,
  `IsActief` bit(1) NOT NULL,
  `Opmerking` varchar(100) DEFAULT NULL,
  `DateAangemaakt` datetime NOT NULL,
  `DateGewijzigd` datetime NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Adres_PersoonId_Persoon_Id` (`PersoonId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Conctact`
--

DROP TABLE IF EXISTS `Conctact`;
CREATE TABLE IF NOT EXISTS `Conctact` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `PersoonId` int(11) NOT NULL,
  `ContactType` varchar(20) NOT NULL,
  `Email` varchar(75) NOT NULL,
  `Mobiel` varchar(11) NOT NULL,
  `Website` varchar(50) DEFAULT NULL,
  `IsActief` bit(1) NOT NULL,
  `Opmerking` varchar(100) DEFAULT NULL,
  `DateAangemaakt` datetime NOT NULL,
  `DateGewijzigd` datetime NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Contact_PersoonId_Persoon_Id` (`PersoonId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `country`
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `Id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `CapitalCity` varchar(100) NOT NULL,
  `Continent` enum('Europa','Azie','Noord Amerika','Zuid Amerika','Oceanie','Antartica','Afrika') NOT NULL,
  `Population` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `country`
--

INSERT INTO `country` (`Id`, `Name`, `CapitalCity`, `Continent`, `Population`) VALUES
(1, 'Nederlandje', 'Amsterdammetje', 'Noord Amerika', 17000001),
(2, 'Belgi&euml;', 'Brusseltje', 'Noord Amerika', 11500001),
(5, 'China', 'Bejing', 'Europa', 333000001);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Instructeur`
--

DROP TABLE IF EXISTS `Instructeur`;
CREATE TABLE IF NOT EXISTS `Instructeur` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Voornaam` varchar(50) NOT NULL,
  `Tussenvoegsel` varchar(25) DEFAULT NULL,
  `Achternaam` varchar(50) NOT NULL,
  `Mobiel` varchar(11) NOT NULL,
  `DatumInDienst` date NOT NULL,
  `AantalSterren` varchar(5) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `Instructeur`
--

INSERT INTO `Instructeur` (`Id`, `Voornaam`, `Tussenvoegsel`, `Achternaam`, `Mobiel`, `DatumInDienst`, `AantalSterren`) VALUES
(1, 'LI', NULL, 'Zhan', '06-28493827', '2015-04-17', '***'),
(2, 'Leroy', NULL, 'Boerhaven', '06-39398734', '2018-06-25', '*'),
(3, 'Yoeri', 'Van', 'Veen', '06-24383291', '2010-05-12', '***'),
(4, 'Bert', 'Van', 'Sali', '06-48293823', '2023-05-10', '****'),
(5, 'Mohammed', 'Van', 'Yassidi', '06-34291234', '2010-06-14', '*****');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `instructeurs`
--

DROP TABLE IF EXISTS `instructeurs`;
CREATE TABLE IF NOT EXISTS `instructeurs` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Email` varchar(100) NOT NULL,
  `Naam` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `instructeurs`
--

INSERT INTO `instructeurs` (`Id`, `Email`, `Naam`) VALUES
(1, 'groen@mail.nl', 'Groen'),
(2, 'konijn@google.com', 'Konijn'),
(3, 'frasi@google.sp', 'Frasi');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `leerling`
--

DROP TABLE IF EXISTS `leerling`;
CREATE TABLE IF NOT EXISTS `leerling` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Naam` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `leerling`
--

INSERT INTO `leerling` (`Id`, `Naam`) VALUES
(3, 'Konijn'),
(4, 'Slavink'),
(6, 'Otto');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `les`
--

DROP TABLE IF EXISTS `les`;
CREATE TABLE IF NOT EXISTS `les` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Datum` datetime NOT NULL,
  `LeerlingId` int(11) NOT NULL,
  `InstructeurId` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Les_InstructeurId_Instructeur_Id` (`InstructeurId`),
  KEY `FK_Les_LeerlingId_Leerling_Id` (`LeerlingId`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `les`
--

INSERT INTO `les` (`Id`, `Datum`, `LeerlingId`, `InstructeurId`) VALUES
(45, '2022-05-20 00:00:00', 3, 1),
(46, '2022-05-20 00:00:00', 6, 3),
(47, '2022-05-21 00:00:00', 4, 2),
(48, '2022-05-21 00:00:00', 6, 3),
(49, '2022-05-22 00:00:00', 3, 1),
(50, '2022-05-28 00:00:00', 4, 2),
(51, '2022-06-01 00:00:00', 3, 2),
(52, '2022-06-12 00:00:00', 3, 1),
(53, '2022-06-22 00:00:00', 3, 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `onderwerp`
--

DROP TABLE IF EXISTS `onderwerp`;
CREATE TABLE IF NOT EXISTS `onderwerp` (
  `OnderwerpId` int(11) NOT NULL AUTO_INCREMENT,
  `LesId` int(11) NOT NULL,
  `Onderwerp` varchar(50) NOT NULL,
  PRIMARY KEY (`OnderwerpId`),
  KEY `FK_Onderwerp_LesId_Les_Id` (`LesId`)
) ENGINE=InnoDB AUTO_INCREMENT=2355 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `onderwerp`
--

INSERT INTO `onderwerp` (`OnderwerpId`, `LesId`, `Onderwerp`) VALUES
(2343, 45, 'File parkeren'),
(2344, 46, 'Achteruit rijden'),
(2345, 49, 'File parkeren'),
(2346, 49, 'Invoegen snelweg'),
(2347, 50, 'Achteruit rijden'),
(2348, 52, 'Achteruit rijden'),
(2349, 52, 'Invoegen snelweg'),
(2350, 52, 'File parkeren'),
(2351, 51, 'Achteruit rijden'),
(2352, 51, 'File parkeren'),
(2353, 51, 'Steken'),
(2354, 51, 'Straatje keren');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `opmerking`
--

DROP TABLE IF EXISTS `opmerking`;
CREATE TABLE IF NOT EXISTS `opmerking` (
  `OpmerkingId` int(11) NOT NULL AUTO_INCREMENT,
  `LesId` int(11) NOT NULL,
  `Opmerking` varchar(100) NOT NULL,
  PRIMARY KEY (`OpmerkingId`),
  KEY `FK_Opmerking_LesId_Les_Id` (`LesId`)
) ENGINE=InnoDB AUTO_INCREMENT=1145 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `opmerking`
--

INSERT INTO `opmerking` (`OpmerkingId`, `LesId`, `Opmerking`) VALUES
(1123, 45, 'File parkeren kan beter'),
(1124, 46, 'Beter in spiegel kijken'),
(1125, 49, 'Opletten op aankomend verkeer'),
(1126, 49, 'Langer doorrijden bij invoegen'),
(1127, 50, 'Langzaam aan'),
(1128, 52, 'Beter in spiegels kijken'),
(1129, 52, 'Richtingaanwijzer aan'),
(1130, 51, '0'),
(1131, 51, '0'),
(1132, 51, '0'),
(1133, 51, '0'),
(1134, 51, '0'),
(1135, 47, '0'),
(1136, 47, '0'),
(1137, 47, '0'),
(1138, 51, '0'),
(1139, 51, '0'),
(1140, 51, 'Achteruit rijden kan beter'),
(1141, 51, '0'),
(1142, 51, '0'),
(1143, 51, 'File parkeren moet beter'),
(1144, 50, 'Let op verkeersborden');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Persoon`
--

DROP TABLE IF EXISTS `Persoon`;
CREATE TABLE IF NOT EXISTS `Persoon` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Voornaam` varchar(50) NOT NULL,
  `Achternaam` varchar(50) NOT NULL,
  `Geboortedatum` date NOT NULL,
  `IsActief` bit(1) NOT NULL,
  `Opmerking` varchar(100) DEFAULT NULL,
  `DateAangemaakt` datetime NOT NULL,
  `DateGewijzigd` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `TypeVoertuig`
--

DROP TABLE IF EXISTS `TypeVoertuig`;
CREATE TABLE IF NOT EXISTS `TypeVoertuig` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `TypeVoertuig` varchar(50) NOT NULL,
  `Rijbewijscategorie` varchar(5) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `TypeVoertuig`
--

INSERT INTO `TypeVoertuig` (`Id`, `TypeVoertuig`, `Rijbewijscategorie`) VALUES
(1, 'Personenauto', 'B'),
(2, 'Vrachtwagen', 'C'),
(3, 'Bus', 'D'),
(4, 'Bromfiets', 'AM');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Voertuig`
--

DROP TABLE IF EXISTS `Voertuig`;
CREATE TABLE IF NOT EXISTS `Voertuig` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Kenteken` varchar(8) NOT NULL,
  `Type` varchar(50) NOT NULL,
  `Bouwjaar` date NOT NULL,
  `Brandstof` varchar(25) NOT NULL,
  `TypeVoertuigId` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Voertuig_TypeVoertuigId_TypeVoertuig_Id` (`TypeVoertuigId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `Voertuig`
--

INSERT INTO `Voertuig` (`Id`, `Kenteken`, `Type`, `Bouwjaar`, `Brandstof`, `TypeVoertuigId`) VALUES
(1, 'AU-67-IO', 'Golf', '2017-06-12', 'Diesel', 1),
(2, 'TR-24-OP', 'DAF', '2019-05-23', 'Diesel', 2),
(3, 'TH-78-KL', 'Mercedes', '2023-01-01', 'Benzine', 1),
(4, '90-KL-TR', 'Fiat 500', '2021-09-12', 'Benzine', 1),
(9, 'ST-FZ-28', 'Scania', '2015-03-13', 'Diesel', 2),
(10, 'YY-OP-78', 'BMW M5', '2022-05-13', 'Diesel', 1),
(11, 'UU-HH-JK', 'M.A.N', '2017-12-03', 'Diesel', 2),
(12, 'ST-FZ-28', 'Citroen', '2018-01-20', 'Elektrisch', 1),
(13, '123-FR-T', 'Piaggio ZIP', '2022-03-21', 'Benzine', 4),
(14, 'DRS-52-P', 'Vespa', '2022-03-21', 'Benzine', 4),
(15, 'STP-12-U', 'Kymco', '2022-07-02', 'Benzine', 4),
(16, '45-SD-23', 'Renault', '2023-01-01', 'Diesel', 3);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `VoertuigInstructeur`
--

DROP TABLE IF EXISTS `VoertuigInstructeur`;
CREATE TABLE IF NOT EXISTS `VoertuigInstructeur` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `VoertuigId` int(11) NOT NULL,
  `InstructeurId` int(11) NOT NULL,
  `DatumToekenning` date NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_VoertuigInstructeur_VoertuigId_Voertuig_Id` (`VoertuigId`),
  KEY `FK_VoertuigInstructeur_InstructeurId_Instructeur_Id` (`InstructeurId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `VoertuigInstructeur`
--

INSERT INTO `VoertuigInstructeur` (`Id`, `VoertuigId`, `InstructeurId`, `DatumToekenning`) VALUES
(1, 1, 5, '2017-06-18'),
(2, 3, 1, '2021-09-26'),
(3, 13, 1, '2021-09-27'),
(4, 3, 4, '2022-08-01'),
(5, 9, 1, '2019-08-30'),
(6, 14, 5, '2020-02-02');

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `les`
--
ALTER TABLE `les`
  ADD CONSTRAINT `FK_Les_InstructeurId_Instructeur_Id` FOREIGN KEY (`InstructeurId`) REFERENCES `instructeurs` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_Les_LeerlingId_Leerling_Id` FOREIGN KEY (`LeerlingId`) REFERENCES `leerling` (`Id`);

--
-- Beperkingen voor tabel `onderwerp`
--
ALTER TABLE `onderwerp`
  ADD CONSTRAINT `FK_Onderwerp_LesId_Les_Id` FOREIGN KEY (`LesId`) REFERENCES `les` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `opmerking`
--
ALTER TABLE `opmerking`
  ADD CONSTRAINT `FK_Opmerking_LesId_Les_Id` FOREIGN KEY (`LesId`) REFERENCES `les` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `Voertuig`
--
ALTER TABLE `Voertuig`
  ADD CONSTRAINT `FK_Voertuig_TypeVoertuigId_TypeVoertuig_Id` FOREIGN KEY (`TypeVoertuigId`) REFERENCES `TypeVoertuig` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `VoertuigInstructeur`
--
ALTER TABLE `VoertuigInstructeur`
  ADD CONSTRAINT `FK_VoertuigInstructeur_InstructeurId_Instructeur_Id` FOREIGN KEY (`InstructeurId`) REFERENCES `Instructeur` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_VoertuigInstructeur_VoertuigId_Voertuig_Id` FOREIGN KEY (`VoertuigId`) REFERENCES `Voertuig` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
