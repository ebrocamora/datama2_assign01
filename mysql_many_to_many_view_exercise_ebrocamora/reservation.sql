-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 02, 2019 at 04:39 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `reservation`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `custfirstname` varchar(45) NOT NULL,
  `custlastname` varchar(45) NOT NULL,
  `custtype` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `custfirstname`, `custlastname`, `custtype`) VALUES
(7171, 'Niall', 'Horan', 'New'),
(7272, 'Zayn', 'Malik', 'Old'),
(7373, 'Liam', 'Payne', 'New'),
(7474, 'Harry', 'Styles', 'Old'),
(7575, 'Louis', 'Tomlinson', 'Old');

-- --------------------------------------------------------

--
-- Stand-in structure for view `customer_ticket`
-- (See below for the actual view)
--
CREATE TABLE `customer_ticket` (
`custlastname` varchar(45)
,`custfirstname` varchar(45)
,`custtype` varchar(45)
,`movietitle` varchar(45)
,`moviesched` date
,`movieduration` time(6)
,`dateofpurchase` date
,`id` int(11)
,`ticket_id` int(11)
,`customer_id` int(11)
,`cinema_number` varchar(45)
);

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `ticket_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `cinema_number` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`ticket_id`, `customer_id`, `id`, `cinema_number`) VALUES
(8787, 7171, 4545, '4'),
(8484, 7171, 4646, '2'),
(8888, 7373, 5151, '3'),
(8787, 7373, 5252, '2'),
(8484, 7272, 6161, '2'),
(8686, 7272, 6262, '1'),
(8585, 7474, 7777, '4'),
(8585, 7474, 7878, '2'),
(8686, 7575, 8989, '2'),
(8787, 7575, 9191, '3');

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `id` int(11) NOT NULL,
  `movietitle` varchar(45) NOT NULL,
  `moviesched` date NOT NULL,
  `movieduration` time(6) NOT NULL,
  `dateofpurchase` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`id`, `movietitle`, `moviesched`, `movieduration`, `dateofpurchase`) VALUES
(8484, 'After', '2019-11-20', '04:15:15.000000', '2019-11-03'),
(8585, 'Eli', '2019-11-30', '08:00:17.194000', '2019-11-17'),
(8686, 'The How\'s of Us', '2019-11-24', '12:05:00.000000', '2019-11-01'),
(8787, 'Last Christmas', '2019-11-18', '10:07:11.000000', '2019-11-21'),
(8888, 'As the gods\' Will', '2019-11-12', '01:21:00.000000', '2019-11-14');

-- --------------------------------------------------------

--
-- Structure for view `customer_ticket`
--
DROP TABLE IF EXISTS `customer_ticket`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `customer_ticket`  AS  select `customer`.`custlastname` AS `custlastname`,`customer`.`custfirstname` AS `custfirstname`,`customer`.`custtype` AS `custtype`,`ticket`.`movietitle` AS `movietitle`,`ticket`.`moviesched` AS `moviesched`,`ticket`.`movieduration` AS `movieduration`,`ticket`.`dateofpurchase` AS `dateofpurchase`,`id` AS `id`,`ticket_id` AS `ticket_id`,`customer_id` AS `customer_id`,`cinema_number` AS `cinema_number` from ((`customer` join `reservation` on(`customer`.`id` = `customer_id`)) join `ticket` on(`ticket`.`id` = `ticket_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ticket_has_customer_customer1_idx` (`customer_id`),
  ADD KEY `fk_ticket_has_customer_ticket_idx` (`ticket_id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9192;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `fk_ticket_has_customer_customer1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ticket_has_customer_ticket` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
