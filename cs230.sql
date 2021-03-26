-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 26, 2021 at 05:03 PM
-- Server version: 5.7.33-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cs230`
--

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `pid` int(11) NOT NULL,
  `title` varchar(60) NOT NULL,
  `descript` text NOT NULL,
  `picpath` varchar(80) NOT NULL,
  `upload_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rating` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`pid`, `title`, `descript`, `picpath`, `upload_date`, `rating`) VALUES
(5, 'A Silent Voice ', '2', '../gallery/604831fb7cdc96.00717645.jpg', '2021-03-09 21:42:03', NULL),
(6, 'Attack on Titan: Final Season', '4', '../gallery/6048323ce02e23.49165953.webp', '2021-03-09 21:43:08', NULL),
(7, 'Vinland Saga', '1', '../gallery/60483277b08195.64059769.jpeg', '2021-03-09 21:44:07', NULL),
(8, 'Your Lie in April', '5', '../gallery/6048439f100ab3.87755385.jpeg', '2021-03-09 22:57:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `pid` int(11) NOT NULL,
  `fname` varchar(50) DEFAULT NULL,
  `uname` varchar(50) DEFAULT NULL,
  `profpic` varchar(50) NOT NULL DEFAULT '../images//default.jpeg'
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`pid`, `fname`, `uname`, `profpic`) VALUES
(1, 'dsafgf', '1234', '../profiles/6035ab2337ff73.18055406.jpeg'),
(2, 'asd', '12345', '../images//default.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `revid` int(11) NOT NULL COMMENT 'id for each review',
  `itemid` int(11) NOT NULL COMMENT 'id for item being reviewed',
  `uname` varchar(80) NOT NULL COMMENT 'user reviewing item',
  `title` varchar(60) NOT NULL,
  `reviewtext` text NOT NULL,
  `revdate` datetime NOT NULL,
  `ratingnum` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT 'Is there at least one review'
) ENGINE=InnoDB DEFAULT CHARSET=utf16;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`revid`, `itemid`, `uname`, `title`, `reviewtext`, `revdate`, `ratingnum`, `status`) VALUES
(1, 6, '12345', 'Modern Masterpiece', 'rtghnergbertghb', '2021-03-17 22:46:41', 10, 1),
(2, 6, '12345', 'geewtr', 'gerwtgweg', '2021-03-17 22:47:12', 8, 1),
(3, 6, '12345', 'twertewr', 'twertwertwer', '2021-03-17 22:47:17', 10, 1),
(4, 6, '12345', 'tewrtwert', 'twertwertwe', '2021-03-17 22:47:20', 10, 1),
(5, 6, '12345', 'hrteherth', 'rtehherthre', '2021-03-17 22:47:24', 10, 1),
(6, 6, '12345', 'rwqerqwe', 'gbdfghsdgsdfg', '2021-03-17 23:23:19', 9, 1),
(7, 6, '12345', 'erwhgw', 'ghewrhewh', '2021-03-17 23:23:24', 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `uid` int(11) NOT NULL,
  `fname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `uname` varchar(50) DEFAULT NULL,
  `password` varchar(120) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COMMENT='user database for signup and signin';

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uid`, `fname`, `lname`, `uname`, `password`, `email`) VALUES
(2, 'fsadfasd', 'adasdf', '123', '$2y$10$.Mn/A0fkDyK0DAws1REbGuHF4.AtUzbe7RLQXIdCojZK3462H0//2', '123@1.com'),
(3, 'jhgfjghfj', 'jjghfj', '321', '$2y$10$NdIXMMjMUwFRCQdWJHrdTOIVMSQQ7CQmafc48KBbaEkKuN.jBx4Z.', '321@1.com'),
(4, 'fsdaas', 'dsafgf', '1234', '$2y$10$5s1Ph9Ylp1qs9o8dsOeNw.SDj07LD9XeD8KPlxqu4zERCXuYEB1cC', '4322@1.com'),
(5, 'dsadasd', 'asd', '12345', '$2y$10$3Aug.00IdExSBSWC00dhSuahWC8OOob8NVh4HOPXbvEvPZKVsdnBm', '123@1.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`revid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `revid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id for each review', AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
