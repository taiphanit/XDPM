-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 12, 2019 at 04:36 PM
-- Server version: 5.7.24
-- PHP Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `xemay`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
CREATE TABLE IF NOT EXISTS `account` (
  `Ida` int(11) NOT NULL AUTO_INCREMENT,
  `username` text CHARACTER SET utf8,
  `password` text CHARACTER SET utf8,
  PRIMARY KEY (`Ida`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`Ida`, `username`, `password`) VALUES
(7, 'trinhthaonguyen', '1'),
(9, 'luongthaisang', '2'),
(11, 'phananhtai', '3'),
(14, 'nguyenhuynhtuanbao', '4'),
(15, 'truongtanhuy', '5');

-- --------------------------------------------------------

--
-- Table structure for table `loaixe`
--

DROP TABLE IF EXISTS `loaixe`;
CREATE TABLE IF NOT EXISTS `loaixe` (
  `Idlx` int(11) NOT NULL AUTO_INCREMENT,
  `Tenlx` text CHARACTER SET utf8,
  PRIMARY KEY (`Idlx`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loaixe`
--

INSERT INTO `loaixe` (`Idlx`, `Tenlx`) VALUES
(1, 'Xe Tay Ga'),
(2, 'Xe số'),
(3, 'Xe Leo Núi');

-- --------------------------------------------------------

--
-- Table structure for table `xe`
--

DROP TABLE IF EXISTS `xe`;
CREATE TABLE IF NOT EXISTS `xe` (
  `Idx` int(11) NOT NULL AUTO_INCREMENT,
  `Tenx` text CHARACTER SET utf8,
  `Thongtinx` text CHARACTER SET utf8,
  `Gia` int(11) DEFAULT NULL,
  `Hinh` text CHARACTER SET utf8,
  `Idlx` int(11) NOT NULL,
  PRIMARY KEY (`Idx`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `xe`
--

INSERT INTO `xe` (`Idx`, `Tenx`, `Thongtinx`, `Gia`, `Hinh`, `Idlx`) VALUES
(1, 'PIAGGIO Vespa LXV 3V i.e 125 2014 Xanh Biển Đen', 'LXV 3Vie đời 2014 màu xanh tím nguyên bản thời trang, đẹp miễn chê.', 36800000, 'Hinh/1.png', 1),
(2, 'HONDA SH 150i 2011 Xám', 'Nhà dư xe sh 150 số máy 107.xe zin máy chưa đụng chạm.nước chưa làm chao chưa mở.. Xem xe tại nhà..giá trên con thương lượng.', 58500000, 'Hinh/2.png', 1),
(6, 'Honda 1569', 'Xe Ð?p và An toàn', 5800000, 'Hinh/', 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
