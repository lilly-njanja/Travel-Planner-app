-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 28, 2025 at 11:42 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `travel_planner`
--

-- --------------------------------------------------------

--
-- Table structure for table `collaborations`
--

CREATE TABLE `collaborations` (
  `collaboration_id` int(11) NOT NULL,
  `itinerary_id` int(11) NOT NULL,
  `collaborator_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `collaborations`
--

INSERT INTO `collaborations` (`collaboration_id`, `itinerary_id`, `collaborator_id`, `created_at`) VALUES
(3, 6, 13, '2024-11-08 12:56:32'),
(4, 8, 15, '2024-12-06 11:49:24'),
(5, 9, 13, '2024-12-10 06:44:59'),
(6, 10, 15, '2024-12-10 09:04:51'),
(7, 11, 16, '2024-12-10 09:10:02'),
(8, 12, 16, '2024-12-10 09:25:08');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `expense_id` int(11) NOT NULL,
  `itinerary_id` int(11) NOT NULL,
  `category` varchar(50) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `expense_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`expense_id`, `itinerary_id`, `category`, `amount`, `expense_date`, `created_at`) VALUES
(1, 6, 'Food', 5000.00, '2024-11-18', '2024-11-07 13:42:20'),
(3, 6, 'Accommodation', 35000.00, '2024-11-14', '2024-11-08 11:44:32'),
(4, 8, 'Transportation', 6000.00, '2024-12-08', '2024-12-06 11:48:11'),
(5, 8, 'Shopping', 8000.00, '2024-12-09', '2024-12-06 11:48:56'),
(6, 9, 'Transportation', 1500.00, '2024-12-17', '2024-12-10 06:44:04'),
(7, 9, 'Accommodation', 400.00, '2024-12-16', '2024-12-10 06:44:31'),
(8, 10, 'Accommodation', 788.00, '2024-12-18', '2024-12-10 09:04:12'),
(9, 11, 'Flights', 100.00, '2024-12-20', '2024-12-10 09:09:39'),
(10, 12, 'Transportation', 10000.00, '2024-12-18', '2024-12-10 09:24:28');

-- --------------------------------------------------------

--
-- Table structure for table `itineraries`
--

CREATE TABLE `itineraries` (
  `itinerary_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `destination` varchar(100) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `itineraries`
--

INSERT INTO `itineraries` (`itinerary_id`, `user_id`, `destination`, `start_date`, `end_date`, `created_at`) VALUES
(2, 13, 'Atlanta, Georgia', '2024-11-15', '2024-11-29', '2024-11-07 10:37:33'),
(5, 14, 'Kisumu', '2024-11-14', '2024-11-21', '2024-11-07 13:27:47'),
(6, 15, 'Mt.Kenya', '2024-11-19', '2024-11-26', '2024-11-07 13:38:54'),
(7, 14, 'Zanzibar', '2024-12-01', '2024-12-07', '2024-11-09 09:11:45'),
(8, 14, 'Mt.Kenya', '2024-12-13', '2024-12-27', '2024-12-06 11:46:46'),
(9, 17, 'Malindi', '2024-12-23', '2024-12-30', '2024-12-10 06:34:26'),
(10, 18, 'malawi', '2024-12-11', '2024-12-18', '2024-12-10 09:03:46'),
(11, 19, 'machakos', '2024-12-26', '2024-12-25', '2024-12-10 09:09:04'),
(12, 20, 'Diani', '2024-12-19', '2024-12-26', '2024-12-10 09:23:41'),
(13, 21, 'Meru', '2025-06-02', '2025-06-21', '2025-05-28 07:14:07');

-- --------------------------------------------------------

--
-- Table structure for table `suggestions`
--

CREATE TABLE `suggestions` (
  `suggestion_id` int(11) NOT NULL,
  `destination` varchar(100) NOT NULL,
  `activity` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `user_rating` int(11) DEFAULT NULL CHECK (`user_rating` between 1 and 5),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `suggestions`
--

INSERT INTO `suggestions` (`suggestion_id`, `destination`, `activity`, `description`, `user_rating`, `created_at`, `user_id`) VALUES
(1, 'Mt.Kenya', 'Hiking', 'best hike', 5, '2024-11-08 14:15:39', 14),
(2, 'Malindi', 'Beach Day', 'Basking under the hot sun as you stare at the beach and the cool waves and strong winds push the waters and give you a relaxing cool breeze.', 5, '2024-12-10 06:49:32', 17),
(3, 'Diani', 'Beach Day', 'cool', 5, '2024-12-10 09:26:04', 20);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password_hash`, `created_at`) VALUES
(13, 'lilian', 'njanjalillian@gmail.com', '$2y$10$A54SJumRTdkQnHebz9cNNuj5xggFM4kWvdtuli.bg7kRhYnc0CsYm', '2024-11-07 08:05:21'),
(14, 'mark', 'markmunene@gmail.com', '$2y$10$dAI3vX0isaF9I4UG6wzalOi1Bh0AU5xx8tYRcRgJ9LOASl207xscW', '2024-11-07 11:17:06'),
(15, 'melody', 'melodykinyaa@gmail.com', '$2y$10$.oQ3f1kF8kGXBLMxD/HFj.qXkJoaHmnw/CfTqhvQ./mSF6pXVGMjq', '2024-11-07 13:37:01'),
(16, 'justine', 'justine@gmail.com', '$2y$10$FoI.d7BAAp1BPBXPWoYWT.SfH81tu/JvAP2cr5Skh/JQWd4LN.V.q', '2024-11-24 09:23:59'),
(17, 'joy', 'joy@gmail.com', '$2y$10$vlmhU8ZHciWeluSuCZd58OMLZgHymgUBagSwIG9NcuMnBcVLZd4lK', '2024-12-10 05:35:54'),
(18, 'ruth', 'ruth@gmail.com', '$2y$10$ya69NmfcufowCG1Me4WNVeBkyFUc6.vLz03t8noIc.RvXEFxgc2Ga', '2024-12-10 09:02:00'),
(19, 'adams', 'adams@gmail.com', '$2y$10$c4qq5ouHgEp9ym5ZuIxoIetdRfOToirtkKkdmbD4jvIofFvPYkAXW', '2024-12-10 09:07:12'),
(20, 'douglas', 'douglas@gmail.com', '$2y$10$/G/5nn4WQDoEgmtbbvqh2.Wm0sQdmBtcaiGWbs5oyfCJXEMwDosk.', '2024-12-10 09:20:26'),
(21, 'pesh', 'peninah@gmail.com', '$2y$10$5ybPo7rDUxgY.U6vdsrbCO65clcZ2M4phZR7MTGhJIx00xcU55Aiq', '2025-05-28 07:11:07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `collaborations`
--
ALTER TABLE `collaborations`
  ADD PRIMARY KEY (`collaboration_id`),
  ADD KEY `itinerary_id` (`itinerary_id`),
  ADD KEY `collaborator_id` (`collaborator_id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`expense_id`),
  ADD KEY `itinerary_id` (`itinerary_id`);

--
-- Indexes for table `itineraries`
--
ALTER TABLE `itineraries`
  ADD PRIMARY KEY (`itinerary_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `suggestions`
--
ALTER TABLE `suggestions`
  ADD PRIMARY KEY (`suggestion_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `collaborations`
--
ALTER TABLE `collaborations`
  MODIFY `collaboration_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `expense_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `itineraries`
--
ALTER TABLE `itineraries`
  MODIFY `itinerary_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `suggestions`
--
ALTER TABLE `suggestions`
  MODIFY `suggestion_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `collaborations`
--
ALTER TABLE `collaborations`
  ADD CONSTRAINT `collaborations_ibfk_1` FOREIGN KEY (`itinerary_id`) REFERENCES `itineraries` (`itinerary_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `collaborations_ibfk_2` FOREIGN KEY (`collaborator_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_ibfk_1` FOREIGN KEY (`itinerary_id`) REFERENCES `itineraries` (`itinerary_id`) ON DELETE CASCADE;

--
-- Constraints for table `itineraries`
--
ALTER TABLE `itineraries`
  ADD CONSTRAINT `itineraries_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
