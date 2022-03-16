-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 16 mars 2022 à 17:44
-- Version du serveur : 5.7.36
-- Version de PHP : 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ecode2022`
--

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `poids` int(3) NOT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `name`, `poids`, `create_time`, `update_time`) VALUES
(1, 'administrateur', 100, '2022-03-03 14:18:13', '2022-03-03 14:18:13'),
(3, 'toto', 60, '2022-03-03 15:04:00', '2022-03-03 15:56:50'),
(5, 'prof', 30, '2022-03-03 15:24:36', '2022-03-03 15:24:36'),
(7, 'seb', 25, '2022-03-03 16:19:16', '2022-03-03 16:19:16'),
(8, 'aspirant', 10, '2022-03-09 13:26:27', '2022-03-09 13:26:27');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lastName` varchar(50) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `is_infected` tinyint(1) NOT NULL,
  `birth` date NOT NULL,
  `mail` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `is_public` tinyint(1) NOT NULL DEFAULT '1',
  `image` varchar(255) DEFAULT NULL,
  `id_role` int(11) NOT NULL DEFAULT '8',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `createTime`, `updateTime`, `lastName`, `firstName`, `is_infected`, `birth`, `mail`, `password`, `is_public`, `image`, `id_role`) VALUES
(1, '2022-02-09 09:48:52', '2022-02-09 11:03:18', 'alaplage', 'martine', 1, '2022-02-04', '', '', 0, NULL, 0),
(2, '2022-02-09 09:48:52', '2022-02-09 11:03:28', 'patagueule', 'james', 0, '2015-02-06', '', '', 0, NULL, 0),
(3, '2022-02-09 09:48:52', '2022-02-09 11:03:36', 'bon', 'jean', 0, '2016-02-06', '', '', 0, NULL, 0),
(4, '2022-02-09 09:48:52', '2022-02-09 11:33:30', 'balkany', 'patoche', 1, '2012-02-04', '', '', 0, NULL, 0),
(6, '2022-02-10 13:59:23', '2022-02-10 13:59:23', 'Ducros', 'Cedric', 0, '2018-01-18', 'cedricducros1@gmail.com', 'pitfcxgnebfsdf:iu', 0, NULL, 0),
(7, '2022-02-10 14:00:44', '2022-02-10 14:00:44', '', '', 1, '2018-07-22', '', '', 0, NULL, 0),
(8, '2022-02-10 14:25:47', '2022-02-10 14:25:47', 'heraud', 'seb', 0, '2018-07-18', 'seb@gmil.com', 'joblj', 0, NULL, 0),
(9, '2022-02-10 14:26:02', '2022-02-10 14:26:02', '', ':ùobo', 0, '2018-07-22', '', '', 0, NULL, 0),
(10, '2022-02-10 14:27:01', '2022-02-10 14:27:01', 'coco', 'balou', 1, '2018-03-22', 'pouet@yahoo.fr', 'defzfrzfrcz', 0, NULL, 0),
(11, '2022-02-10 14:57:57', '2022-02-10 14:57:57', 'efaefa', 'Cedric', 0, '2018-07-05', 'cedricducros1@gmail.com', 'gsregsrtghsrthtr', 0, NULL, 0),
(12, '2022-02-11 07:42:55', '2022-02-11 07:42:55', 'mariba', 'benoit', 0, '2018-07-06', 'moi@rhzbfre.com', '$2y$10$k1zqrmJs/ZUEUPbnrOW4LOczO0iz1jTEWN53eAyzDY5aJBnDpRJHq', 0, NULL, 0),
(13, '2022-02-11 08:13:01', '2022-02-11 08:13:01', 'barre', 'samuel', 1, '2018-07-19', 'sam@ihoebc.fr', '$2y$10$DxwU7VjDo0nd21.hZlqYQuhnXNHh/eGaFZJUmSwLM2UiWJpfy8gWi', 0, NULL, 0),
(14, '2022-02-11 08:13:36', '2022-02-11 08:13:36', 'pennequin', 'adam', 0, '2018-07-24', 'bibec@qvbqew.com', '$2y$10$cCAPIaBWRj.F6.m83rEm5Oxta6mmsANn4WYC.KmDVFtH7g6NvPddW', 0, NULL, 0),
(15, '2022-02-11 09:29:11', '2022-02-11 09:29:11', 'ducros', 'arno', 0, '2018-07-22', 'arno@gmail.com', '$2y$10$dnisB1DRvWENjYWtwS8LX.L.rXgU9fuLyKQBcV8c3Yod6r/Ye9Mia', 0, NULL, 0),
(16, '2022-02-11 12:13:51', '2022-02-11 12:13:51', 'sey(s\'hx', 'trhrdh', 0, '2018-07-22', 'rgserhse@segbrsthxn', '$2y$10$Sa.lKvf2rKvYZoX2g/qADOT2P2tF.EGyXhR4/X1wq0WuHRzW78ILW', 0, NULL, 0),
(17, '2022-02-11 12:43:22', '2022-02-11 12:43:22', '', '', 0, '2018-07-22', '', '$2y$10$2GyUbu4RKXVsUba2DSseXOvavXUe7cV94rs/44M8yCJ6K.X/925/K', 0, NULL, 0),
(18, '2022-02-18 08:03:39', '2022-03-02 09:42:00', 'jussieux', 'beatrice', 0, '2018-07-22', 'cedricduuty@gmail.com', '$2y$10$G7tcCbz0ANiuaKF5HAgsVO/SfTPwnv4iYUmY.xr31uSvZR.EcSHJW', 0, NULL, 0),
(19, '2022-02-18 09:27:55', '2022-02-18 09:27:55', 'toto', 'tutu', 0, '2018-07-22', 'toto@gmail.com', '$2y$10$Br4oB69ym12xHskVzZZpx.330Ts2U74NRf9/I.asNL41OwauJNPSC', 0, NULL, 0),
(20, '2022-02-18 09:47:25', '2022-02-18 09:47:25', '', '', 0, '2018-07-22', 'jbvbobvtr@knzjfv', '$2y$10$SsYO.QmPGrddl2kV3G25U.ND/UKPqkrHHBeH444he/fwm7pIuTq3m', 0, NULL, 0),
(21, '2022-02-18 10:07:14', '2022-02-18 10:07:14', '', '', 0, '2018-07-22', 'iurbvr@vuzeyc', '$2y$10$Q6xNWI9OwZ0ZY60VWI0bvuqofBstDIjL6fMi/EmfyNDAYWvCegN/u', 0, NULL, 0),
(22, '2022-02-18 10:22:38', '2022-03-04 10:46:50', 'jhvuv', '', 0, '2018-07-22', 'uyvuv@khvgck', '$2y$10$WuvKZoPLrMDb4Pr6GbsUheyp4WTLGVYTYOs0U0G4xoOU/zy2XpNNS', 1, NULL, 0),
(23, '2022-02-18 12:18:56', '2022-03-09 10:12:58', 'srgqwegrqe', '', 0, '2018-07-22', 'qzec@egzgqg', '$2y$10$vY7JIavk.JyHWAKs.rjJMOt4xWvGAwxZwJbMbWWCiEkdCNZadzZLS', 1, 'logo.png', 0),
(30, '2022-03-03 10:25:07', '2022-03-09 12:30:10', 'ducros', 'cedric', 1, '2018-07-22', 'cedric@gmail.com', '$2y$10$csveo2n.PG3T0K6zVqGtTOxf.uJpOv2x7NSUv2j7anIs0HE0lZF3y', 1, 'atome.png', 1),
(31, '2022-03-04 11:02:10', '2022-03-04 11:02:10', 'mouroux', 'melwyne', 0, '2018-07-22', 'melwyne@gmail.com', '$2y$10$jGWVTyL4CbcRRmoSvtBzh.T0Ocou1vD7UNz9m9m.42LSuOr097juO', 0, NULL, 0),
(32, '2022-03-04 11:12:17', '2022-03-04 11:12:17', 'chabanais', 'jeremie', 0, '2018-07-22', 'jeremie@gmail.com', '$2y$10$5ighVxNBncRLK6uK6iHN/.rctQaY/9l5lFVuqbUZBP/ayQdKOGML6', 0, NULL, 0),
(33, '2022-03-04 11:13:15', '2022-03-04 15:13:42', 'cherdoune', 'hakim', 0, '2018-07-05', 'hakim@gmail.com', '$2y$10$Ld/tHcsy.hNRdNIkiHK8iu7YeGKKh.d8QX6tSu4/myg7DrJHQdnvu', 1, NULL, 0),
(34, '2022-03-04 12:34:57', '2022-03-04 12:34:57', 'guillemette', 'thomas', 1, '2018-07-22', 'thomas@gmail.com', '$2y$10$mKjcucT8qxiM7LLR3IcIbe4.nEuyIG2UUXn1vmbJartffB9ruwtG2', 1, NULL, 0),
(35, '2022-03-04 12:40:37', '2022-03-07 11:00:47', 'heraud', 'sebastien', 1, '2018-07-22', 'sebastien@gmail.com', '$2y$10$no82OEtjKqfn1Iz4XQy6Z.DbtWxNdvTlurjYs3IXZRNPIfcTVivoe', 1, 'ampoule.png', 0),
(36, '2022-03-07 08:42:04', '2022-03-09 09:53:35', 'boutonnet', 'delphine', 0, '2018-07-22', 'delphine@gmail.com', '$2y$10$PXsu8TdBdq5.nqv4.SUpO..uPvdBa0TUCkkBlsGCCVdEJYh87Y9Tq', 1, 'crayon.png', 0),
(37, '2022-03-07 08:54:31', '2022-03-07 08:54:31', 'deride', 'john', 0, '2018-07-22', 'john@gmail.com', '$2y$10$VKt/tqVpE3z/FZn.eMUVB..6O35fOAy5qaOaNnW/a.hmCeI7VKK8i', 1, 'ampoule.png', 0),
(38, '2022-03-07 09:46:38', '2022-03-07 09:46:38', 'farges', 'chris', 0, '2018-07-22', 'chris@gmail.com', '$2y$10$R1vl6RvHV0Z6sIz8DOEyLe9j828rKOS7cA4Sgg0eHCJdqSXZeN.QG', 1, 'crayon.png', 0),
(39, '2022-03-07 09:50:18', '2022-03-10 09:18:06', 'masclefffff', 'gilles', 1, '2018-07-22', 'gilles@gmail.com', '$2y$10$2y0Fm.OHQ/.McwCaAGJ3r.HEsjpievIadDqSctLcqd0VffGjIZo56', 1, 'youtube.png', 8),
(41, '2022-03-07 09:55:38', '2022-03-09 12:38:22', 'eguia', 'paul', 0, '2018-07-22', 'paul@gmail.com', '$2y$10$ZgAdJBA8qk1byfu2Nt7TnO1BSOHxQPwja8EMn2XZfeeRnLgunHcZO', 1, 'logo.png', 1),
(42, '2022-03-10 09:23:23', '2022-03-10 09:23:23', 'bidault', 'pauline', 1, '2018-07-22', 'pops@gmail.com', '$2y$10$7TuRh31xPrs6n3kULrjW7eHCSKxwmrHK.jng3KbchL2SOA/MVMJxq', 1, 'logo.png', 8);

-- --------------------------------------------------------

--
-- Structure de la table `vaccines`
--

DROP TABLE IF EXISTS `vaccines`;
CREATE TABLE IF NOT EXISTS `vaccines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `vaccines`
--

INSERT INTO `vaccines` (`id`, `name`, `date`, `create_time`, `update_time`, `id_user`) VALUES
(1, 'toto', '2022-07-20', '2022-03-07 13:03:41', '2022-03-07 13:03:41', 41),
(2, 'covid', '2019-05-13', '2022-03-07 13:44:47', '2022-03-07 13:44:47', 41),
(3, 'polio', '2022-07-01', '2022-03-07 14:59:07', '2022-03-07 14:59:07', 39),
(4, 'rubeole', '2020-06-12', '2022-03-07 14:59:21', '2022-03-07 14:59:21', 39),
(5, 'tetanos', '2022-07-03', '2022-03-07 14:59:32', '2022-03-07 14:59:32', 39),
(6, 'toto', '2022-07-26', '2022-03-10 09:16:14', '2022-03-10 09:16:14', 39);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
