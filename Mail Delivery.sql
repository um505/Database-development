-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jun 01, 2020 at 04:13 PM
-- Server version: 5.7.26
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `cr09_Maxim_Ulyanov_delivery`
--
CREATE DATABASE IF NOT EXISTS `cr09_Maxim_Ulyanov_delivery` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cr09_Maxim_Ulyanov_delivery`;

-- --------------------------------------------------------

--
-- Table structure for table `Customer`
--

CREATE TABLE `Customer` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `customer_city` varchar(100) DEFAULT NULL,
  `customer_zip` int(11) DEFAULT NULL,
  `customer_address` varchar(100) DEFAULT NULL,
  `customer_birth` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Customer`
--

INSERT INTO `Customer` (`customer_id`, `customer_name`, `customer_city`, `customer_zip`, `customer_address`, `customer_birth`) VALUES
(1, 'Dorothy R. Grijalva', 'STEINBRUCH', 9462, 'Alpenstrasse 40', '2063-09-30'),
(2, 'Dorthy H. Arends', 'KÖHLBICHL', 5723, 'Reinprechtsdorfer Strasse 96', '1981-08-18'),
(3, 'Laura Pfeffer', 'MANK', 3240, 'Wiener Strasse 65', '1952-12-20');

-- --------------------------------------------------------

--
-- Table structure for table `Employee`
--

CREATE TABLE `Employee` (
  `employee_id` int(11) NOT NULL,
  `employee_name` varchar(100) DEFAULT NULL,
  `employee_birth` date DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `mail_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Employee`
--

INSERT INTO `Employee` (`employee_id`, `employee_name`, `employee_birth`, `location_id`, `mail_id`) VALUES
(1, 'Mario Reinhardt', '1986-03-18', 1, 1),
(2, 'Nicole Rothschild', '1996-10-06', 2, 2),
(3, 'René Engel', '1963-07-18', 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `Mail`
--

CREATE TABLE `Mail` (
  `mail_id` int(11) NOT NULL,
  `mail_type` enum('Package','Mail') DEFAULT NULL,
  `mail_description` varchar(255) DEFAULT NULL,
  `mail_size` char(50) DEFAULT NULL,
  `mail_wight` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `recipient_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Mail`
--

INSERT INTO `Mail` (`mail_id`, `mail_type`, `mail_description`, `mail_size`, `mail_wight`, `customer_id`, `recipient_id`) VALUES
(1, 'Package', 'Present', '10*10*10', 5, 1, 3),
(2, 'Mail', 'Documents', 'A4', 1, 2, 2),
(3, 'Mail', 'Photos', 'A5', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Post_office`
--

CREATE TABLE `Post_office` (
  `location_id` int(11) NOT NULL,
  `location_address` varchar(100) DEFAULT NULL,
  `location_city` varchar(100) DEFAULT NULL,
  `location_zip` int(11) DEFAULT NULL,
  `location_name` varchar(100) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Post_office`
--

INSERT INTO `Post_office` (`location_id`, `location_address`, `location_city`, `location_zip`, `location_name`, `customer_id`) VALUES
(1, 'Franz-Josef_Banhof', 'Vienna', 1090, 'Handy Shop Singh', 1),
(2, 'Markt Platz', 'Perchtolsdorf', 2380, 'Post Office', 2),
(3, 'Hauptstrasse 10', 'Salzburg', 5020, 'Drop-of shop', 3);

-- --------------------------------------------------------

--
-- Table structure for table `Processing_system`
--

CREATE TABLE `Processing_system` (
  `processing_system_id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `mail_id` int(11) DEFAULT NULL,
  `status_of_mail_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Processing_system`
--

INSERT INTO `Processing_system` (`processing_system_id`, `employee_id`, `mail_id`, `status_of_mail_id`) VALUES
(1, 1, 2, 2),
(2, 2, 2, 2),
(3, 3, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `Recipient`
--

CREATE TABLE `Recipient` (
  `recipient_id` int(11) NOT NULL,
  `recipient_name` varchar(100) DEFAULT NULL,
  `recipient_city` varchar(100) DEFAULT NULL,
  `recipient_zip` int(11) DEFAULT NULL,
  `recipient_address` varchar(100) DEFAULT NULL,
  `recipient_birth` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Recipient`
--

INSERT INTO `Recipient` (`recipient_id`, `recipient_name`, `recipient_city`, `recipient_zip`, `recipient_address`, `recipient_birth`) VALUES
(1, 'Paul Herman', 'GUNDERPOLLING', 4972, 'Annenstrasse 66', '1942-07-18'),
(2, 'Patrick Weber', '\r\nZIRKNITZ', 8511, 'Schulgasse 67', '1982-01-19'),
(3, 'Alexander Krueger', 'KIRCHENVIERTEL', 8255, 'Laxenburger Strasse 68', '1987-11-08');

-- --------------------------------------------------------

--
-- Table structure for table `Status_of_mail`
--

CREATE TABLE `Status_of_mail` (
  `status_of_mail_id` int(11) NOT NULL,
  `status_of_delivery` enum('delivered','in_process') DEFAULT NULL,
  `time_and_date_deposited` datetime DEFAULT NULL,
  `time_and_date_received` datetime DEFAULT NULL,
  `mail_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Status_of_mail`
--

INSERT INTO `Status_of_mail` (`status_of_mail_id`, `status_of_delivery`, `time_and_date_deposited`, `time_and_date_received`, `mail_id`) VALUES
(1, 'in_process', '2020-05-05 16:42:59', NULL, 1),
(2, 'delivered', '2020-05-20 16:43:36', '2020-07-01 16:43:36', 2),
(3, 'delivered', '2020-05-29 16:43:58', '2020-06-01 16:43:58', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Customer`
--
ALTER TABLE `Customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `Employee`
--
ALTER TABLE `Employee`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `location_id` (`location_id`),
  ADD KEY `mail_id` (`mail_id`);

--
-- Indexes for table `Mail`
--
ALTER TABLE `Mail`
  ADD PRIMARY KEY (`mail_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `recipient_id` (`recipient_id`);

--
-- Indexes for table `Post_office`
--
ALTER TABLE `Post_office`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `Processing_system`
--
ALTER TABLE `Processing_system`
  ADD PRIMARY KEY (`processing_system_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `mail_id` (`mail_id`),
  ADD KEY `status_of_mail_id` (`status_of_mail_id`);

--
-- Indexes for table `Recipient`
--
ALTER TABLE `Recipient`
  ADD PRIMARY KEY (`recipient_id`);

--
-- Indexes for table `Status_of_mail`
--
ALTER TABLE `Status_of_mail`
  ADD PRIMARY KEY (`status_of_mail_id`),
  ADD KEY `mail_id` (`mail_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Customer`
--
ALTER TABLE `Customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Employee`
--
ALTER TABLE `Employee`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Mail`
--
ALTER TABLE `Mail`
  MODIFY `mail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Post_office`
--
ALTER TABLE `Post_office`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Processing_system`
--
ALTER TABLE `Processing_system`
  MODIFY `processing_system_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Recipient`
--
ALTER TABLE `Recipient`
  MODIFY `recipient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Status_of_mail`
--
ALTER TABLE `Status_of_mail`
  MODIFY `status_of_mail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Employee`
--
ALTER TABLE `Employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `Post_office` (`location_id`),
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`mail_id`) REFERENCES `Mail` (`mail_id`);

--
-- Constraints for table `Mail`
--
ALTER TABLE `Mail`
  ADD CONSTRAINT `mail_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `Customer` (`customer_id`),
  ADD CONSTRAINT `mail_ibfk_2` FOREIGN KEY (`recipient_id`) REFERENCES `Recipient` (`recipient_id`);

--
-- Constraints for table `Post_office`
--
ALTER TABLE `Post_office`
  ADD CONSTRAINT `post_office_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `Customer` (`customer_id`);

--
-- Constraints for table `Processing_system`
--
ALTER TABLE `Processing_system`
  ADD CONSTRAINT `processing_system_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `Employee` (`employee_id`),
  ADD CONSTRAINT `processing_system_ibfk_2` FOREIGN KEY (`mail_id`) REFERENCES `Mail` (`mail_id`),
  ADD CONSTRAINT `processing_system_ibfk_3` FOREIGN KEY (`status_of_mail_id`) REFERENCES `Status_of_mail` (`status_of_mail_id`);

--
-- Constraints for table `Status_of_mail`
--
ALTER TABLE `Status_of_mail`
  ADD CONSTRAINT `status_of_mail_ibfk_1` FOREIGN KEY (`mail_id`) REFERENCES `Mail` (`mail_id`);
