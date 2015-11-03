-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 03-Nov-2015 às 03:47
-- Versão do servidor: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mediaplayer`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `album`
--

CREATE TABLE IF NOT EXISTS `album` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `Ano` int(4) NOT NULL,
  `Faixa` int(99) NOT NULL,
  `FK_Artista` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Artista` (`FK_Artista`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Extraindo dados da tabela `album`
--

INSERT INTO `album` (`id`, `Nome`, `Ano`, `Faixa`, `FK_Artista`) VALUES
(1, 'IN THE CITIES', 2014, 19, 2),
(2, 'O DESTINO', 2014, 1, 1),
(3, 'IRMÃO', 2015, 18, 3),
(4, 'VIVA POR MIN', 2013, 24, 3),
(5, 'PODE ENTRAR', 2009, 12, 4),
(6, 'BEAT BELEZA', 2000, 20, 4),
(7, 'KILL EM ALL', 1983, 20, 5),
(8, 'LOAD', 1996, 14, 5),
(9, 'LULU', 2011, 11, 5),
(10, 'LIVING THINGS', 2012, 29, 6),
(11, 'METEORO', 2003, 19, 6),
(12, 'REANIMATION', 2002, 16, 6),
(13, 'RARIDADES', 2007, 18, 7),
(14, 'SEM LIMITES', 1995, 20, 8),
(15, 'GRAÇA', 2013, 20, 8),
(16, 'SOM DE ADORADORES', 2014, 22, 8),
(17, 'MÁS DE TI', 2000, 20, 8);

-- --------------------------------------------------------

--
-- Estrutura da tabela `artista`
--

CREATE TABLE IF NOT EXISTS `artista` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `Banda` varchar(45) NOT NULL,
  `FK_Genero` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Genero` (`FK_Genero`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Extraindo dados da tabela `artista`
--

INSERT INTO `artista` (`id`, `Nome`, `Banda`, `FK_Genero`) VALUES
(1, 'LUCAS LUCCO', 'LUCAS LUCCO', 1),
(2, 'CRISTIANO ARAÚJO', 'CRISTIANO ARAÚJO', 1),
(3, 'VICTOR E LEO', 'VIRTOR E LEO', 1),
(4, 'IVETE SANGALO', 'IVETE SANGALO', 5),
(5, 'MENTALLICA', 'MENTALLICA', 2),
(6, 'LINKIN PARK', 'LINKIN PARK', 2),
(7, 'ZECA PAGODINHO', 'ZECA PAGODINHO', 3),
(8, 'ALINE BARROS', 'ALINE BARROS', 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `genero`
--

CREATE TABLE IF NOT EXISTS `genero` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `genero`
--

INSERT INTO `genero` (`id`, `Nome`) VALUES
(1, 'SERTANEJO'),
(2, 'ROCK'),
(3, 'SAMBA'),
(4, 'GOSPEL'),
(5, 'AXÉ');

-- --------------------------------------------------------

--
-- Estrutura da tabela `musica`
--

CREATE TABLE IF NOT EXISTS `musica` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `Tempo` float NOT NULL,
  `Ano` int(11) NOT NULL,
  `Nota` int(11) NOT NULL,
  `FK_Album` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Album` (`FK_Album`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `musica`
--

INSERT INTO `musica` (`id`, `Nome`, `Tempo`, `Ano`, `Nota`, `FK_Album`) VALUES
(1, 'VENIMOS A ADORARTE', 50, 2000, 8, 17),
(2, 'CELEBRAD AL DIOS DE AMOR', 3.2, 2000, 7, 17),
(3, 'EU LI NA BÍBLIA', 4.2, 2011, 10, 17),
(4, 'HIT THE LIGHTS"', 4.17, 1983, 10, 7),
(5, 'BRANDENBURG GATE', 4.19, 2019, 10, 9);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `album`
--
ALTER TABLE `album`
  ADD CONSTRAINT `album_ibfk_1` FOREIGN KEY (`FK_Artista`) REFERENCES `artista` (`id`);

--
-- Limitadores para a tabela `artista`
--
ALTER TABLE `artista`
  ADD CONSTRAINT `artista_ibfk_1` FOREIGN KEY (`FK_Genero`) REFERENCES `genero` (`id`);

--
-- Limitadores para a tabela `musica`
--
ALTER TABLE `musica`
  ADD CONSTRAINT `musica_ibfk_1` FOREIGN KEY (`FK_Album`) REFERENCES `album` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
