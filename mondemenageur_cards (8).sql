-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 30, 2021 at 10:07 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mondemenageur_cards`
--

-- --------------------------------------------------------

--
-- Table structure for table `cartes`
--

CREATE TABLE `cartes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `CodeUnique` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NomApporteur` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `PrenomApporteur` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `EntreprisePartenaire` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ville` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rue` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `residances` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quartier` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Adresse` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `MontantMissionRecto` int(11) DEFAULT NULL,
  `MontantremiseCo` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PrixDeVenteCarte` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ActivationCodeUnique` tinyint(1) NOT NULL DEFAULT 0,
  `RectoMissionEnvViaCashplus` tinyint(1) NOT NULL DEFAULT 0,
  `VenteDesCartesEff` tinyint(1) NOT NULL DEFAULT 0,
  `DejaUtliliser` tinyint(1) NOT NULL DEFAULT 0,
  `DateExperation` date NOT NULL DEFAULT '2022-01-01',
  `NomActivateur` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cartes`
--

INSERT INTO `cartes` (`id`, `CodeUnique`, `Description`, `NomApporteur`, `PrenomApporteur`, `tel`, `EntreprisePartenaire`, `ville`, `rue`, `residances`, `quartier`, `Adresse`, `MontantMissionRecto`, `MontantremiseCo`, `PrixDeVenteCarte`, `ActivationCodeUnique`, `RectoMissionEnvViaCashplus`, `VenteDesCartesEff`, `DejaUtliliser`, `DateExperation`, `NomActivateur`, `created_at`, `updated_at`) VALUES
(46, 'CV_977508', 'Carte Vsite ', 'Poe', 'Jason', '0677777777', ' ', 'Casablanca', '', '', '', '3757  Elliot Avenue', 0, '0', '5000 dhs à définir ', 1, 0, 0, 0, '2024-05-12', 'Ihab Benchekroun ', '2021-07-01 08:28:08', '2021-07-01 08:33:02'),
(47, 'CV_716054', 'Carte Vsite ', 'Poe', 'Jason', '0677777777', ' ', 'Casablanca', '', '', '', '3757  Elliot Avenue', 0, '0', '5000 dhs à définir ', 1, 0, 0, 0, '2024-05-12', 'Ihab Benchekroun ', '2021-07-01 08:28:08', '2021-07-01 08:33:02'),
(48, 'CV_356877', 'Carte Vsite ', 'Poe', 'Jason', '0677777777', ' ', 'Casablanca', '', '', '', '3757  Elliot Avenue', 0, '0', '5000 dhs à définir ', 1, 0, 0, 0, '2024-05-12', 'Ihab Benchekroun ', '2021-07-01 08:28:08', '2021-07-01 08:49:55'),
(49, 'CV_561962', 'Carte Vsite ', ' ', ' ', ' ', ' ', ' ', '', '', '', ' ', 0, '0', '5000 dhs à définir ', 1, 0, 0, 0, '2024-05-12', 'Ihab Benchekroun ', '2021-07-01 08:28:08', '2021-07-01 08:28:08'),
(50, 'CV_440700', 'Carte Vsite ', ' ', ' ', ' ', ' ', ' ', '', '', '', ' ', 0, '0', '5000 dhs à définir ', 1, 0, 0, 0, '2024-05-12', 'Ihab Benchekroun ', '2021-07-01 08:28:08', '2021-07-01 08:28:08'),
(51, 'CV_310344', 'Carte Vsite ', ' ', ' ', ' ', ' ', ' ', '', '', '', ' ', 0, '0', '5000 dhs à définir ', 1, 0, 0, 0, '2024-05-12', 'Ihab Benchekroun ', '2021-07-01 08:28:08', '2021-07-01 08:28:08'),
(52, 'CV_157904', 'Carte Vsite ', ' ', ' ', ' ', ' ', ' ', '', '', '', ' ', 0, '0', '5000 dhs à définir ', 1, 0, 0, 0, '2024-05-12', 'Ihab Benchekroun ', '2021-07-01 08:28:08', '2021-07-01 08:28:08'),
(53, 'CV_291127', 'Carte Vsite ', ' ', ' ', ' ', ' ', ' ', '', '', '', ' ', 0, '0', '5000 dhs à définir ', 1, 0, 0, 0, '2024-05-12', 'Ihab Benchekroun ', '2021-07-01 08:28:08', '2021-07-01 08:28:08'),
(54, 'CV_641714', 'Carte Vsite ', ' ', ' ', ' ', ' ', ' ', '', '', '', ' ', 0, '0', '5000 dhs à définir ', 1, 0, 0, 0, '2024-05-12', 'Ihab Benchekroun ', '2021-07-01 08:28:09', '2021-07-01 08:28:09'),
(55, 'CV_124572', 'Carte Vsite ', ' ', ' ', ' ', ' ', ' ', '', '', '', ' ', 0, '0', '5000 dhs à définir ', 1, 0, 0, 0, '2024-05-12', 'Ihab Benchekroun ', '2021-07-01 08:28:09', '2021-07-01 08:28:09'),
(56, 'CPP_353142', 'Carte Parinage Premium ', 'Poe', 'Jason', '0677777777', ' ', 'Casablanca', '', '', '', '3757  Elliot Avenue', 0, '0', '5000 dhs à définir ', 1, 0, 0, 0, '2024-05-12', 'Samir  ', '2021-07-01 08:31:27', '2021-07-01 08:33:02'),
(57, 'CPP_836312', 'Carte Parinage Premium ', 'BOUSAFI', 'khalid', '0610111213', ' ', 'Casablanca', 'bourgone 10 kamalo', NULL, 'burge', ' ', 0, '0', '5000 dhs à définir ', 1, 0, 0, 0, '2024-05-12', 'Samir  ', '2021-07-01 08:31:27', '2021-07-13 15:12:09'),
(58, 'CPP_270576', 'Carte Parinage Premium ', 'Poe', 'Jason', '0677777777', ' ', 'Casablanca', '', '', '', '3757  Elliot Avenue', 0, '0', '5000 dhs à définir ', 1, 0, 0, 0, '2024-05-12', 'Samir  ', '2021-07-01 08:31:27', '2021-07-01 08:33:02'),
(59, 'CPG_765028', 'Carte Parinage Gold ', 'damir', 'Khalid', '0677777777', ' ', 'Kenitra', '', '', '', 'bourgone 123 casablanca', 500, '500', '0 dhs ', 1, 0, 0, 0, '2024-05-12', 'Hamid  ', '2021-07-07 10:43:31', '2021-07-09 13:10:06'),
(60, 'CPG_736272', 'Carte Parinage Gold ', 'WARd', 'Hossam', '0677777777', ' ', 'Tetouan', '', '', '', 'testttttstts', 500, '500', '0 dhs ', 1, 0, 0, 0, '2024-05-12', 'Hamid  ', '2021-07-07 10:43:32', '2021-07-09 13:16:23'),
(61, 'CPG_352631', 'Carte Parinage Gold ', 'Sellami', 'Ahmed', '0677777777', ' ', 'Rabat', '', '', '', 'bourgone 123 casablanca', 500, '500', '0 dhs ', 1, 0, 0, 0, '2024-05-12', 'Hamid  ', '2021-07-07 10:43:32', '2021-07-09 13:09:03'),
(62, 'CPG_212516', 'Carte Parinage Gold ', 'ADILI', 'Amine', '0677777777', ' ', 'Mohemadia', '', '', '', 'bourgone 123 casablanca', 500, '500', '0 dhs ', 1, 0, 0, 0, '2024-05-12', 'Hamid  ', '2021-07-07 10:43:32', '2021-07-09 13:11:46'),
(63, 'CC_967447', 'Carte Cadeau ', ' ', ' ', ' ', ' ', ' ', '', '', '', ' ', 0, '100% à definir', '5000 dhs à définir', 0, 0, 0, 0, '2024-05-12', 'Hamid  ', '2021-07-07 10:51:18', '2021-07-07 10:51:18'),
(64, 'CC_360420', 'Carte Cadeau ', ' ', ' ', ' ', ' ', ' ', '', '', '', ' ', 0, '100% à definir', '5000 dhs à définir', 0, 0, 0, 0, '2024-05-12', 'Hamid  ', '2021-07-07 10:51:19', '2021-07-07 10:51:19'),
(65, 'CC_232322', 'Carte Cadeau ', ' ', ' ', ' ', ' ', ' ', '', '', '', ' ', 0, '100% à definir', '5000 dhs à définir', 0, 0, 0, 0, '2024-05-12', 'Hamid  ', '2021-07-07 10:51:19', '2021-07-07 10:51:19'),
(66, 'CC_844352', 'Carte Cadeau ', ' ', ' ', ' ', ' ', ' ', '', '', '', ' ', 0, '100% à definir', '5000 dhs à définir', 0, 0, 0, 0, '2024-05-12', 'Hamid  ', '2021-07-07 10:51:19', '2021-07-07 10:51:19'),
(67, 'CC_973275', 'Carte Cadeau ', 'KHadiri', 'Said', '0677777777', ' ', 'Mohemadia', '', '', '', 'bourgone 123 casablanca', 0, '100% à definir', '5000 dhs à définir', 1, 0, 0, 1, '2024-05-12', 'Hamid  ', '2021-07-09 08:50:27', '2021-07-09 13:10:58'),
(68, 'CC_992393', 'Carte Cadeau ', 'Poe', 'Jason', '0677777777', ' ', 'Casablanca', '', '', '', '3757  Elliot Avenue', 0, '100% à definir', '5000 dhs à définir', 1, 0, 0, 1, '2024-05-12', 'Hamid  ', '2021-07-09 08:50:27', '2021-07-09 08:54:19');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2021_06_23_124155_create_cartes_table', 2),
(6, '2021_06_25_084022_add_tel_to_cartes_table', 3),
(7, '2021_06_25_084739_add_ville_to_cartes_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('houard@ubikom-digital.com', '$2y$10$878I832SEvxn/.l.nKLaveFOnoBxI/CNND3m4ZrIWzUOATxOdPvYi', '2021-06-22 10:50:30');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'ouard', 'houard@ubikom-digital.com', NULL, '$2y$10$3oxdLRE4W7gtSxUnhXW.Ve4Gs3byS8hxGh3GddF.yRNbj1AZJ3k82', 'ldHGuGUEksejg7BXGcl2tydokB6lTG7K8qKjRiTSUkj8fp2V5OJ8iBrrasHs', '2021-06-22 10:48:02', '2021-06-22 10:48:02'),
(2, 'Hossam', 'oneouard14@gmail.com', NULL, '$2y$10$G.zVh2KhabO7ivzD9UYvHetElbNeQlddKRfIM.3qi0vdl0lF869kq', 'vKAJCHUyTSOzpZ50HPjHW3ujEFHC9sv1nE7YWp3K8yfuePcRp6bKtRqXHKMN', '2021-07-08 13:23:53', '2021-07-08 13:23:53'),
(3, 'Ihab', 'ibenchekroun@ubikom-digital.com', NULL, '$2y$10$p1gnLHe4nL6fpImIctTS0uktO8.d.4vTiRXDsQZO02s0DuSgXA/s.', NULL, '2021-07-09 06:53:23', '2021-07-09 06:53:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cartes`
--
ALTER TABLE `cartes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cartes_codeunique_unique` (`CodeUnique`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cartes`
--
ALTER TABLE `cartes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
