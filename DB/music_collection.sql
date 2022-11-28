-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 18, 2022 at 07:56 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `category` (`category_id`, `category_name`) VALUES
(1, 'Tops'),
(2, 'Dresses'),
(3, 'Pop'),
(4, 'Country'),
(5, 'R&B'),
(6, 'Dance');

CREATE TABLE `songs` (
  `songs_id` int(11) NOT NULL,
  `songs_name` varchar(100) NOT NULL,
  `songs_image` varchar(1024) NOT NULL,
  `category_id` int(11) NOT NULL,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `songs` (`songs_id`, `songs_name`,`image`,`category_id`) VALUES
(1, 'One in a million','uploads/9464b890819e224b.jpg',3 ),
(2, 'Mad over me','uploads/452771.jpg',3),
(3, 'baby','uploads/791a047636136702e25ba1096b11cfe7.jpg',4),
(4, 'Soulful','uploads/pexels-photo-4654051.jpg',4),
(5, 'Say something'),
(6, 'Someday','uploads/pexels-photo-3756774.jpeg',5),
(7, 'Everywhere is home','uploads/pexels-photo-3757004.jpeg',5),
(8, 'She be mine','uploads/Rihanna.-Photo-W-Magazine.jpg',6 ),
(9, 'Play all the way','uploads/Sarkodie.jpg',6);


CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
 `isAdmin` int(11) NOT NULL DEFAULT 0,
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `users` (`user_id`,`username`,`email`, `password`,`isAdmin`) VALUES
(1, 'Admin', 'admin@gmail.com', '12345',1),
(2, 'Mohona', 'test@gmail.com', '6789', 0);


ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);


ALTER TABLE `songs`
  ADD PRIMARY KEY (`songs_id`),
  ADD KEY `category_id` (`category_id`);


ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `songs`
  MODIFY `songs_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
