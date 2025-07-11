-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 11, 2025 at 06:55 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pharmacyapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `Orders_id` int(5) NOT NULL,
  `Orders_total_amount` int(7) NOT NULL,
  `Orders_date` date NOT NULL,
  `Orders_status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders_product`
--

CREATE TABLE `orders_product` (
  `Users_id` int(5) NOT NULL,
  `Orders_id` int(5) NOT NULL,
  `Product_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `Payment_id` int(5) NOT NULL,
  `Payment_method` varchar(10) NOT NULL,
  `Payment_amount` int(8) NOT NULL,
  `Payment_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `Product_id` int(5) NOT NULL,
  `Product_name` varchar(15) NOT NULL,
  `Product_price` int(7) NOT NULL,
  `Product_type` varchar(15) NOT NULL,
  `Product_description` varchar(15) NOT NULL,
  `Product_manufacturer` varchar(10) NOT NULL,
  `Product_expiry_date` date NOT NULL,
  `Product_image` varchar(15) NOT NULL,
  `Product_stock_status` varchar(8) NOT NULL,
  `Product_manufacture_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `Users_id` int(5) NOT NULL,
  `First_name` varchar(15) NOT NULL,
  `Last_name` varchar(10) NOT NULL,
  `Users_name` varchar(30) NOT NULL,
  `Users_password` varchar(15) NOT NULL,
  `Users_address` varchar(15) NOT NULL,
  `Users_phone_number` varchar(10) NOT NULL,
  `Users_email` varchar(25) NOT NULL,
  `Users_role` varchar(9) NOT NULL,
  `Users_gender` varchar(7) NOT NULL,
  `Users_status` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_orders`
--

CREATE TABLE `users_orders` (
  `Users_id` int(5) NOT NULL,
  `Orders_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_payment`
--

CREATE TABLE `users_payment` (
  `Users_id` int(5) NOT NULL,
  `Payment_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`Orders_id`);

--
-- Indexes for table `orders_product`
--
ALTER TABLE `orders_product`
  ADD PRIMARY KEY (`Users_id`,`Orders_id`,`Product_id`),
  ADD KEY `Orders_product_fk1` (`Orders_id`),
  ADD KEY `Orders_product_fk2` (`Product_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`Payment_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`Users_id`);

--
-- Indexes for table `users_orders`
--
ALTER TABLE `users_orders`
  ADD PRIMARY KEY (`Users_id`,`Orders_id`),
  ADD KEY `Users_Orders_fk2` (`Orders_id`);

--
-- Indexes for table `users_payment`
--
ALTER TABLE `users_payment`
  ADD PRIMARY KEY (`Users_id`,`Payment_id`),
  ADD KEY `User_payment_fk1` (`Payment_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `Orders_id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `Payment_id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `Product_id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `Users_id` int(5) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders_product`
--
ALTER TABLE `orders_product`
  ADD CONSTRAINT `Orders_product_fk` FOREIGN KEY (`Users_id`) REFERENCES `users` (`Users_id`),
  ADD CONSTRAINT `Orders_product_fk1` FOREIGN KEY (`Orders_id`) REFERENCES `orders` (`Orders_id`),
  ADD CONSTRAINT `Orders_product_fk2` FOREIGN KEY (`Product_id`) REFERENCES `product` (`Product_id`);

--
-- Constraints for table `users_orders`
--
ALTER TABLE `users_orders`
  ADD CONSTRAINT `Users_Orders_fk` FOREIGN KEY (`Users_id`) REFERENCES `users` (`Users_id`),
  ADD CONSTRAINT `Users_Orders_fk2` FOREIGN KEY (`Orders_id`) REFERENCES `orders` (`Orders_id`);

--
-- Constraints for table `users_payment`
--
ALTER TABLE `users_payment`
  ADD CONSTRAINT `User_payment_fk1` FOREIGN KEY (`Payment_id`) REFERENCES `payment` (`Payment_id`),
  ADD CONSTRAINT `Users_payment_fk` FOREIGN KEY (`Users_id`) REFERENCES `users` (`Users_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
