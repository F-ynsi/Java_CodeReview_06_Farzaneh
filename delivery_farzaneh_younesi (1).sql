-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 08, 2020 at 02:07 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `delivery_farzaneh_younesi`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `ID` int(11) NOT NULL,
  `CITY` varchar(50) NOT NULL,
  `STREET` varchar(50) NOT NULL,
  `HOUSENUMBER` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`ID`, `CITY`, `STREET`, `HOUSENUMBER`) VALUES
(1, 'WIEN', 'FF', 10),
(2, 'SALZBURG', 'PP', 20),
(3, 'LINZ', 'AA', 25);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(50) NOT NULL,
  `SURNAME` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`ID`, `NAME`, `SURNAME`) VALUES
(1, 'EVA', 'YOUNESI'),
(2, 'RIV', 'HOSS'),
(3, 'SABINE', 'SHNEE');

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `ID` int(11) NOT NULL,
  `WEIGHT` double NOT NULL,
  `DESCRIPTION` varchar(50) NOT NULL,
  `EMPLOYEE_ID` int(11) NOT NULL,
  `SENDER_NAME` varchar(50) NOT NULL,
  `SENDER_ADDRESS_ID` int(11) NOT NULL,
  `ENTRY_DATE` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`ID`, `WEIGHT`, `DESCRIPTION`, `EMPLOYEE_ID`, `SENDER_NAME`, `SENDER_ADDRESS_ID`, `ENTRY_DATE`) VALUES
(1, 30, 'GLASS', 1, 'SARA', 1, '2018-02-08 11:32:10'),
(3, 50, 'GLASS', 1, 'SARi', 1, '2019-02-08 10:20:10');

-- --------------------------------------------------------

--
-- Table structure for table `processing_system`
--

CREATE TABLE `processing_system` (
  `ID` int(11) NOT NULL,
  `RECIEVED_DATE` datetime DEFAULT NULL,
  `RECIEVER_NAME` varchar(50) NOT NULL,
  `RECIEVER_ADDRESS_ID` int(11) NOT NULL,
  `PACKAGE_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `processing_system`
--

INSERT INTO `processing_system` (`ID`, `RECIEVED_DATE`, `RECIEVER_NAME`, `RECIEVER_ADDRESS_ID`, `PACKAGE_ID`) VALUES
(1, '2020-02-08 10:33:20', 'LISA', 1, 1),
(2, '2018-02-08 11:38:10', 'LARA', 2, 1),
(3, '2015-02-08 12:30:12', 'LIM', 3, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `SENDER_ADDRESS_ID` (`SENDER_ADDRESS_ID`),
  ADD KEY `EMPLOYEE_ID` (`EMPLOYEE_ID`);

--
-- Indexes for table `processing_system`
--
ALTER TABLE `processing_system`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `PACKAGE_ID` (`PACKAGE_ID`),
  ADD KEY `RECIEVER_ADDRESS_ID` (`RECIEVER_ADDRESS_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `processing_system`
--
ALTER TABLE `processing_system`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `packages`
--
ALTER TABLE `packages`
  ADD CONSTRAINT `packages_ibfk_1` FOREIGN KEY (`SENDER_ADDRESS_ID`) REFERENCES `address` (`ID`),
  ADD CONSTRAINT `packages_ibfk_2` FOREIGN KEY (`EMPLOYEE_ID`) REFERENCES `employees` (`ID`);

--
-- Constraints for table `processing_system`
--
ALTER TABLE `processing_system`
  ADD CONSTRAINT `processing_system_ibfk_1` FOREIGN KEY (`PACKAGE_ID`) REFERENCES `packages` (`ID`),
  ADD CONSTRAINT `processing_system_ibfk_2` FOREIGN KEY (`RECIEVER_ADDRESS_ID`) REFERENCES `address` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
