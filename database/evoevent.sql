-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 27, 2025 at 01:00 PM
-- Server version: 10.6.22-MariaDB-0ubuntu0.22.04.1
-- PHP Version: 8.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `evoevent`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Singing Concert', '2025-07-26 00:19:55', '2025-07-26 00:19:55');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `event_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `user_id`, `category_id`, `name`, `image_path`, `event_date`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 'fdsf', 'events/yQNa82qGsbzT7zdBglLTsCz0CP1QxcNwoII02gi4.png', '2025-07-26', '2025-07-26 11:29:46', '2025-07-26 08:48:44', '2025-07-26 15:47:53'),
(2, 1, 1, 'sdfsf', 'events/yQNa82qGsbzT7zdBglLTsCz0CP1QxcNwoII02gi4.png', '2025-07-26', '2025-07-26 06:14:00', '2025-07-26 06:14:00', '2025-07-26 15:48:01'),
(3, 1, 1, 'CM STARK ENTERPRISE', 'events/tJrgGGV77BenHli6WBs585bsirQ6ZCPRMb7mXalu.png', '2025-07-26', '2025-07-26 06:17:10', '2025-07-26 06:17:10', '2025-07-26 15:48:03'),
(4, 1, 1, 'fdsfsdfsdf', 'events/1WYPyN4pTb5dAqSgReTvMCwSgUhOlGk942YPUaRP.png', '2025-07-26', '2025-07-26 10:18:19', '2025-07-26 10:49:24', NULL),
(5, 1, 1, NULL, NULL, NULL, '2025-07-26 10:43:50', '2025-07-26 10:43:50', NULL),
(6, 1, 1, NULL, NULL, NULL, '2025-07-26 10:44:32', '2025-07-26 10:44:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2025_07_25_172838_create_categories_table', 2),
(6, '2025_07_25_172843_create_events_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'evoevent-token', '8922edf297b2747c1409931128eb7a95d707c3e3b138adf5a8f04127f0b491f5', '[\"*\"]', NULL, NULL, '2025-07-25 12:38:09', '2025-07-25 12:38:09'),
(2, 'App\\Models\\User', 1, 'evoevent-token', '452112f143ce589b6346cbc691733ffccc63dc40cc245e2bb4ab483ff64da9c5', '[\"*\"]', NULL, NULL, '2025-07-25 22:40:36', '2025-07-25 22:40:36'),
(3, 'App\\Models\\User', 1, 'evoevent-token', 'afaa84a39288d9adb8324d8bf16f070b4e14a675be4920ce79213a293cc93a98', '[\"*\"]', '2025-07-26 11:02:07', NULL, '2025-07-25 22:50:35', '2025-07-26 11:02:07'),
(4, 'App\\Models\\User', 1, 'evoevent-token', '919faf365ddc766acb3b9b637f3421a4b6a0e11dee9715ec47a10c6dab3964d9', '[\"*\"]', NULL, NULL, '2025-07-25 22:50:42', '2025-07-25 22:50:42'),
(5, 'App\\Models\\User', 1, 'evoevent-token', '37557a9a2ee07e89b23ff30e238bb8921a02ba4c446180f380896eed27c0c78b', '[\"*\"]', NULL, NULL, '2025-07-25 23:05:01', '2025-07-25 23:05:01'),
(6, 'App\\Models\\User', 1, 'evoevent-token', '0ea5dbc9b085bea291098b07b4ba7af8a5e522271aab120ec57bf5a06c76c2df', '[\"*\"]', NULL, NULL, '2025-07-25 23:09:49', '2025-07-25 23:09:49'),
(7, 'App\\Models\\User', 1, 'evoevent-token', 'fb30bc6d4d4d367f5ea46990de0496d743d745f38e3dc4053fb6589581579b49', '[\"*\"]', NULL, NULL, '2025-07-25 23:10:12', '2025-07-25 23:10:12'),
(8, 'App\\Models\\User', 1, 'evoevent-token', '0e01ef089fba09d95b0b788a5899a00dab34be38ee99e8f591b73b2face93bed', '[\"*\"]', NULL, NULL, '2025-07-25 23:29:00', '2025-07-25 23:29:00'),
(9, 'App\\Models\\User', 1, 'evoevent-token', '5d0edb0ac1d8e8dabdf0636c4446ceaa296c254a6aae8cfd3c1dbac412de4a70', '[\"*\"]', NULL, NULL, '2025-07-26 00:42:57', '2025-07-26 00:42:57'),
(10, 'App\\Models\\User', 1, 'evoevent-token', 'ebc775c30de24eea544060f36a5cc2c2808dd604cd907fd4f8b1003437a66957', '[\"*\"]', NULL, NULL, '2025-07-26 00:44:48', '2025-07-26 00:44:48'),
(11, 'App\\Models\\User', 1, 'evoevent-token', '2562ad9fb9d8f6265f1e2596ec89f8afdeb54886cc6a0317ca1a8c26cff37659', '[\"*\"]', NULL, NULL, '2025-07-26 00:52:18', '2025-07-26 00:52:18'),
(12, 'App\\Models\\User', 1, 'evoevent-token', '2e33cdb25124463eec4469f6aff73d09cc9df1b349b5b8c70bc5d4fbf6e51307', '[\"*\"]', NULL, NULL, '2025-07-26 00:52:26', '2025-07-26 00:52:26'),
(13, 'App\\Models\\User', 1, 'evoevent-token', '964ae0eed643f20172daafec215b356eea68c22b50b26ca5fb37e559fa977780', '[\"*\"]', NULL, NULL, '2025-07-26 00:58:48', '2025-07-26 00:58:48'),
(14, 'App\\Models\\User', 1, 'evoevent-token', '1337ea99a92b9d0cf6ae271edd45e66e58c2f0af5067818845d7ee6b68045404', '[\"*\"]', NULL, NULL, '2025-07-26 00:59:26', '2025-07-26 00:59:26'),
(15, 'App\\Models\\User', 1, 'evoevent-token', '000ae46c2804d45902c7468c42b21865a78476e316a853c6a65b95031fe39a84', '[\"*\"]', NULL, NULL, '2025-07-26 01:04:53', '2025-07-26 01:04:53'),
(16, 'App\\Models\\User', 1, 'evoevent-token', '018d3b747b269c72785adb3d31b21031deb2a2dd5a95c1026117cf02d6934dc8', '[\"*\"]', NULL, NULL, '2025-07-26 01:11:41', '2025-07-26 01:11:41'),
(17, 'App\\Models\\User', 1, 'evoevent-token', '76f56f463f39b55e9f1134aa8a1a33a44aab7f4aa3198f6508122d58a021bd8e', '[\"*\"]', NULL, NULL, '2025-07-26 01:12:54', '2025-07-26 01:12:54'),
(18, 'App\\Models\\User', 1, 'evoevent-token', 'e4ea9e948c7e1b5f995f8cd51c260035503679cc36dd334fec3e75438ff4818d', '[\"*\"]', NULL, NULL, '2025-07-26 01:13:51', '2025-07-26 01:13:51'),
(19, 'App\\Models\\User', 1, 'evoevent-token', 'b481e3d56d6a6a2d9016e0b7888bc2a0902032e1f633e6c7bc3a8721c53492f8', '[\"*\"]', NULL, NULL, '2025-07-26 01:14:57', '2025-07-26 01:14:57'),
(20, 'App\\Models\\User', 1, 'evoevent-token', 'ddfe2d68a8b52ed0c7cc4d7d3e424acc34321956b37e6f4ca0e02d6f892fe285', '[\"*\"]', '2025-07-26 01:17:34', NULL, '2025-07-26 01:17:34', '2025-07-26 01:17:34'),
(21, 'App\\Models\\User', 1, 'evoevent-token', 'ebc87456acffbc9c6634a029c81c97dc699cc7d47664b43d82a55ee8c78cc7f7', '[\"*\"]', '2025-07-26 01:17:53', NULL, '2025-07-26 01:17:53', '2025-07-26 01:17:53'),
(22, 'App\\Models\\User', 1, 'evoevent-token', '55910646d1f94ad7c57f67e8b0f2794d85ef53867c2335dbfe3364a263223c4e', '[\"*\"]', NULL, NULL, '2025-07-26 01:19:10', '2025-07-26 01:19:10'),
(23, 'App\\Models\\User', 1, 'evoevent-token', 'aca1e2ecf336118dd18d46cc840b98306b92a799e8d54887400649e270fc59e1', '[\"*\"]', NULL, NULL, '2025-07-26 01:31:49', '2025-07-26 01:31:49'),
(24, 'App\\Models\\User', 1, 'evoevent-token', 'e87fc685c4b0388e63ba0884dc922b4e41886b35d3ada2341bae37516bb6921a', '[\"*\"]', '2025-07-26 04:48:42', NULL, '2025-07-26 01:34:41', '2025-07-26 04:48:42'),
(25, 'App\\Models\\User', 1, 'evoevent-token', '1949d33571259da87920fa98a6dbc858208755796031ddc034928b7df86aa4ea', '[\"*\"]', '2025-07-26 04:42:42', NULL, '2025-07-26 04:37:58', '2025-07-26 04:42:42'),
(26, 'App\\Models\\User', 1, 'evoevent-token', 'e166920aa6889e338bbd93bd7ecf3460fbf6bf8468c1f346f60c380c77e4c791', '[\"*\"]', '2025-07-26 04:47:59', NULL, '2025-07-26 04:44:02', '2025-07-26 04:47:59'),
(27, 'App\\Models\\User', 1, 'evoevent-token', '6fe1759b7d9d372a317c5b90d13cd854f8582550ee48927839cb6a53ae6fe1f1', '[\"*\"]', '2025-07-26 05:01:34', NULL, '2025-07-26 04:49:31', '2025-07-26 05:01:34'),
(28, 'App\\Models\\User', 1, 'evoevent-token', '0b2d4c365f35e9519bf3ebfdbc6f08802f5bb07e75b483054a26938c698e2f69', '[\"*\"]', NULL, NULL, '2025-07-26 05:01:45', '2025-07-26 05:01:45'),
(29, 'App\\Models\\User', 1, 'evoevent-token', '29671449a0462c571b9b7f79d1a2651f8322f97d3873ed05f84b51fb00d79d29', '[\"*\"]', NULL, NULL, '2025-07-26 05:01:53', '2025-07-26 05:01:53'),
(30, 'App\\Models\\User', 1, 'evoevent-token', 'd29f01191b1bb125876a5d6a362b55e9ad4cc4c0e2294f9be5538b4c4f6ee2bd', '[\"*\"]', NULL, NULL, '2025-07-26 05:02:08', '2025-07-26 05:02:08'),
(31, 'App\\Models\\User', 1, 'evoevent-token', '1879b6cf59578b3e6d91d8a590052ff5d9ab1081719ab11f9d61232fd34d7e60', '[\"*\"]', NULL, NULL, '2025-07-26 05:02:25', '2025-07-26 05:02:25'),
(32, 'App\\Models\\User', 1, 'evoevent-token', 'a6bbe2283c22186b232aee885a1ae39b4f1ed5a5dc88c4cf9471f22ec1917fc2', '[\"*\"]', '2025-07-26 05:24:10', NULL, '2025-07-26 05:02:57', '2025-07-26 05:24:10'),
(33, 'App\\Models\\User', 1, 'evoevent-token', '969a2cbb58fbe10e3aaaba0c87d9e2431c6944a58a205868c08d80a783fd835d', '[\"*\"]', '2025-07-26 05:25:39', NULL, '2025-07-26 05:25:39', '2025-07-26 05:25:39'),
(34, 'App\\Models\\User', 1, 'evoevent-token', '77eab2d9ef222640ac9f197bded8cfc1ab7ee1d65752800a9deee7369d661b7b', '[\"*\"]', '2025-07-26 05:27:08', NULL, '2025-07-26 05:27:08', '2025-07-26 05:27:08'),
(35, 'App\\Models\\User', 1, 'evoevent-token', '980a76810cd782c424fb637700d4959b7c10e8cd75a3684d19fd429a05947c32', '[\"*\"]', NULL, NULL, '2025-07-26 05:28:38', '2025-07-26 05:28:38'),
(36, 'App\\Models\\User', 1, 'evoevent-token', '25365621d061a2abe70946f16dd9fd394d19ebcf94583344b54e793440294ac2', '[\"*\"]', '2025-07-26 05:32:54', NULL, '2025-07-26 05:29:08', '2025-07-26 05:32:54'),
(37, 'App\\Models\\User', 1, 'evoevent-token', 'a5c944e78bea93c96c27cd3baeb969bfc06d8acc5011a03a17b66cb43b185d9a', '[\"*\"]', '2025-07-26 08:45:15', NULL, '2025-07-26 05:35:25', '2025-07-26 08:45:15'),
(38, 'App\\Models\\User', 1, 'evoevent-token', '3c29358b3ad4ab305815a49a609d3e3f05d3386f950fba789cc71d13d4cde40e', '[\"*\"]', '2025-07-26 11:09:01', NULL, '2025-07-26 08:47:53', '2025-07-26 11:09:01');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin User', 'admin@evoevent.com', NULL, '$2y$12$IGbqoy05c9Lm8nkL7Ru7oOt2cbsugenv0subS1zYUuap9JRgZNGbm', NULL, '2025-07-25 12:37:18', '2025-07-25 12:37:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `events_user_id_foreign` (`user_id`),
  ADD KEY `events_category_id_foreign` (`category_id`);

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
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

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
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `events_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
