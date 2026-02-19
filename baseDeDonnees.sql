-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : jeu. 19 fév. 2026 à 04:27
-- Version du serveur : 5.7.24
-- Version de PHP : 8.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `clinique_reservation`
--

-- --------------------------------------------------------

--
-- Structure de la table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `slot_id` int(11) NOT NULL,
  `status` enum('booked','cancelled','completed') NOT NULL DEFAULT 'booked',
  `created_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `appointments`
--

INSERT INTO `appointments` (`id`, `user_id`, `doctor_id`, `service_id`, `slot_id`, `status`, `created_timestamp`) VALUES 
(1, 1, 1, 1, 1, 'booked', '2026-02-19 03:52:22'),
(2, 2, 1, 1, 6, 'booked', '2026-02-19 03:52:22'),
(3, 3, 2, 2, 10, 'booked', '2026-02-19 03:52:22'),
(4, 4, 2, 2, 15, 'booked', '2026-02-19 03:52:22'),
(5, 5, 3, 3, 19, 'completed', '2026-02-19 03:52:22'),
(6, 6, 3, 3, 21, 'booked', '2026-02-19 03:52:22'),
(7, 7, 4, 4, 25, 'booked', '2026-02-19 03:52:22'),
(8, 8, 4, 4, 32, 'booked', '2026-02-19 03:52:22'),
(9, 9, 5, 5, 34, 'booked', '2026-02-19 03:52:22'),
(10, 10, 5, 5, 38, 'completed', '2026-02-19 03:52:22'),
(11, 11, 6, 6, 44, 'booked', '2026-02-19 03:52:22'),
(12, 12, 6, 6, 47, 'booked', '2026-02-19 03:52:22'),
(13, 13, 7, 7, 49, 'completed', '2026-02-19 03:52:22'),
(14, 14, 7, 7, 54, 'booked', '2026-02-19 03:52:22');

-- --------------------------------------------------------

--
-- Structure de la table `doctors`
--

CREATE TABLE `doctors` (
  `id` int(11) NOT NULL,
  `full_name` varchar(120) NOT NULL,
  `specialty` varchar(120) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `created_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `doctors`
--

INSERT INTO `doctors` (`id`, `full_name`, `specialty`, `email`, `phone_number`, `created_timestamp`) VALUES
(1, 'Dr. Julien Desrosiers', 'Médecine générale', 'julien.desrosiers@cliniquemd.ca', '514-555-2001', '2026-02-17 05:45:19'),
(2, 'Dr. Mariam El Khouri', 'Dermatologie', 'mariam.elkhouri@cliniquemd.ca', '514-555-2002', '2026-02-17 05:45:19'),
(3, 'Dr. Antoine Lafleur', 'Pédiatrie', 'antoine.lafleur@cliniquemd.ca', '514-555-2003', '2026-02-17 05:45:19'),
(4, 'Dr. Sofia Benyamina', 'Santé mentale', 'sofia.benyamina@cliniquemd.ca', '514-555-2004', '2026-02-17 05:45:19'),
(5, 'Dr. Gabriel Morin', 'Cardiologie', 'gabriel.morin@cliniquemd.ca', '514-555-2005', '2026-02-17 05:45:19'),
(6, 'Dr. Leïla Azzouz', 'Gynécologie', 'leila.azzouz@cliniquemd.ca', '514-555-2006', '2026-02-17 05:45:19'),
(7, 'Dr. Farah Siddiqui', 'Vaccination', 'farah.siddiqui@cliniquemd.ca', '514-555-2008', '2026-02-17 05:45:19');

-- --------------------------------------------------------

--
-- Structure de la table `doctor_services`
--

CREATE TABLE `doctor_services` (
  `doctor_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `doctor_services`
--

INSERT INTO `doctor_services` (`doctor_id`, `service_id`) VALUES
(1, 1),
(1, 2),
(2, 4),
(3, 3),
(3, 9),
(4, 5),
(5, 7),
(6, 6),
(7, 8),
(7, 9);

-- --------------------------------------------------------

--
-- Structure de la table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `service_name` varchar(120) NOT NULL,
  `description` text,
  `duration_min` int(11) NOT NULL,
  `created_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `services`
--

INSERT INTO `services` (`id`, `service_name`, `description`, `duration_min`, `created_timestamp`) VALUES
(1, 'Consultation générale', 'Consultation avec un médecin généraliste pour symptômes courants, suivi ou référence.', 30, '2026-02-17 05:50:15'),
(2, 'Bilan de santé annuel', 'Examen préventif et revue de santé (antécédents, tension, conseils, etc.)', 30, '2026-02-17 05:50:15'),
(3, 'Consultation pédiatrique', 'Consultation pour enfants: suivi, symptômes, conseils et examens de base.', 30, '2026-02-17 05:50:15'),
(4, 'Consultation dermatologique', 'Évaluation de problèmes de peau (acné, eczéma, irritation, etc.).', 30, '2026-02-17 05:50:15'),
(5, 'Consultation santé mentale', 'Évaluation et suivi pour stress, anxiété, humeur et bien-être.', 30, '2026-02-17 05:50:15'),
(6, 'Consultation gynécologique', 'Suivi gynécologique, dépistage, contraception et consultation.', 30, '2026-02-17 05:50:15'),
(7, 'Bilan cardiaque (clinique)', 'Évaluation cardiovasculaire de base et suivi (selon disponibilité).', 30, '2026-02-17 05:50:15'),
(8, 'Vaccination (adulte)', 'Vaccination et rappels pour adultes (inclut questions et vérification).', 30, '2026-02-17 05:50:15'),
(9, 'Vaccination (enfant)', 'Vaccination pédiatrique et rappels (avec évaluation rapide).', 30, '2026-02-17 05:50:15');

-- --------------------------------------------------------

--
-- Structure de la table `time_slots`
--

CREATE TABLE `time_slots` (
  `id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `status` enum('available','booked') NOT NULL DEFAULT 'available',
  `created_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `time_slots`
--

INSERT INTO `time_slots` (`id`, `doctor_id`, `start_time`, `end_time`, `status`, `created_timestamp`) VALUES
(1, 1, '2026-02-23 09:00:00', '2026-02-23 09:30:00', 'booked', '2026-02-19 03:28:34'),
(2, 1, '2026-02-23 09:30:00', '2026-02-23 10:00:00', 'available', '2026-02-19 03:28:34'),
(3, 1, '2026-02-23 10:00:00', '2026-02-23 10:30:00', 'available', '2026-02-19 03:28:34'),
(4, 1, '2026-02-23 10:30:00', '2026-02-23 11:00:00', 'available', '2026-02-19 03:28:34'),
(5, 1, '2026-02-23 13:00:00', '2026-02-23 13:30:00', 'available', '2026-02-19 03:28:34'),
(6, 1, '2026-02-23 13:30:00', '2026-02-23 14:00:00', 'booked', '2026-02-19 03:28:34'),
(7, 1, '2026-02-23 14:00:00', '2026-02-23 14:30:00', 'available', '2026-02-19 03:28:34'),
(8, 1, '2026-02-23 14:30:00', '2026-02-23 15:00:00', 'available', '2026-02-19 03:28:34'),
(9, 2, '2026-02-23 09:00:00', '2026-02-23 09:30:00', 'available', '2026-02-19 03:28:34'),
(10, 2, '2026-02-23 09:30:00', '2026-02-23 10:00:00', 'booked', '2026-02-19 03:28:34'),
(11, 2, '2026-02-23 10:00:00', '2026-02-23 10:30:00', 'available', '2026-02-19 03:28:34'),
(12, 2, '2026-02-23 10:30:00', '2026-02-23 11:00:00', 'available', '2026-02-19 03:28:34'),
(13, 2, '2026-02-23 13:00:00', '2026-02-23 13:30:00', 'available', '2026-02-19 03:28:34'),
(14, 2, '2026-02-23 13:30:00', '2026-02-23 14:00:00', 'available', '2026-02-19 03:28:34'),
(15, 2, '2026-02-23 14:00:00', '2026-02-23 14:30:00', 'booked', '2026-02-19 03:28:34'),
(16, 2, '2026-02-23 14:30:00', '2026-02-23 15:00:00', 'available', '2026-02-19 03:28:34'),
(17, 3, '2026-02-23 09:00:00', '2026-02-23 09:30:00', 'available', '2026-02-19 03:28:34'),
(18, 3, '2026-02-23 09:30:00', '2026-02-23 10:00:00', 'available', '2026-02-19 03:28:34'),
(19, 3, '2026-02-23 10:00:00', '2026-02-23 10:30:00', 'booked', '2026-02-19 03:28:34'),
(20, 3, '2026-02-23 10:30:00', '2026-02-23 11:00:00', 'available', '2026-02-19 03:28:34'),
(21, 3, '2026-02-23 13:00:00', '2026-02-23 13:30:00', 'booked', '2026-02-19 03:28:34'),
(22, 3, '2026-02-23 13:30:00', '2026-02-23 14:00:00', 'available', '2026-02-19 03:28:34'),
(23, 3, '2026-02-23 14:00:00', '2026-02-23 14:30:00', 'available', '2026-02-19 03:28:34'),
(24, 3, '2026-02-23 14:30:00', '2026-02-23 15:00:00', 'available', '2026-02-19 03:28:34'),
(25, 4, '2026-02-23 09:00:00', '2026-02-23 09:30:00', 'booked', '2026-02-19 03:28:34'),
(26, 4, '2026-02-23 09:30:00', '2026-02-23 10:00:00', 'available', '2026-02-19 03:28:34'),
(27, 4, '2026-02-23 10:00:00', '2026-02-23 10:30:00', 'available', '2026-02-19 03:28:34'),
(28, 4, '2026-02-23 10:30:00', '2026-02-23 11:00:00', 'available', '2026-02-19 03:28:34'),
(29, 4, '2026-02-23 13:00:00', '2026-02-23 13:30:00', 'available', '2026-02-19 03:28:34'),
(30, 4, '2026-02-23 13:30:00', '2026-02-23 14:00:00', 'available', '2026-02-19 03:28:34'),
(31, 4, '2026-02-23 14:00:00', '2026-02-23 14:30:00', 'available', '2026-02-19 03:28:34'),
(32, 4, '2026-02-23 14:30:00', '2026-02-23 15:00:00', 'booked', '2026-02-19 03:28:34'),
(33, 5, '2026-02-23 09:00:00', '2026-02-23 09:30:00', 'available', '2026-02-19 03:28:34'),
(34, 5, '2026-02-23 09:30:00', '2026-02-23 10:00:00', 'booked', '2026-02-19 03:28:34'),
(35, 5, '2026-02-23 10:00:00', '2026-02-23 10:30:00', 'available', '2026-02-19 03:28:34'),
(36, 5, '2026-02-23 10:30:00', '2026-02-23 11:00:00', 'available', '2026-02-19 03:28:34'),
(37, 5, '2026-02-23 13:00:00', '2026-02-23 13:30:00', 'available', '2026-02-19 03:28:34'),
(38, 5, '2026-02-23 13:30:00', '2026-02-23 14:00:00', 'booked', '2026-02-19 03:28:34'),
(39, 5, '2026-02-23 14:00:00', '2026-02-23 14:30:00', 'available', '2026-02-19 03:28:34'),
(40, 5, '2026-02-23 14:30:00', '2026-02-23 15:00:00', 'available', '2026-02-19 03:28:34'),
(41, 6, '2026-02-23 09:00:00', '2026-02-23 09:30:00', 'available', '2026-02-19 03:28:34'),
(42, 6, '2026-02-23 09:30:00', '2026-02-23 10:00:00', 'available', '2026-02-19 03:28:34'),
(43, 6, '2026-02-23 10:00:00', '2026-02-23 10:30:00', 'available', '2026-02-19 03:28:34'),
(44, 6, '2026-02-23 10:30:00', '2026-02-23 11:00:00', 'booked', '2026-02-19 03:28:34'),
(45, 6, '2026-02-23 13:00:00', '2026-02-23 13:30:00', 'available', '2026-02-19 03:28:34'),
(46, 6, '2026-02-23 13:30:00', '2026-02-23 14:00:00', 'available', '2026-02-19 03:28:34'),
(47, 6, '2026-02-23 14:00:00', '2026-02-23 14:30:00', 'booked', '2026-02-19 03:28:34'),
(48, 6, '2026-02-23 14:30:00', '2026-02-23 15:00:00', 'available', '2026-02-19 03:28:34'),
(49, 7, '2026-02-23 09:00:00', '2026-02-23 09:30:00', 'booked', '2026-02-19 03:28:34'),
(50, 7, '2026-02-23 09:30:00', '2026-02-23 10:00:00', 'available', '2026-02-19 03:28:34'),
(51, 7, '2026-02-23 10:00:00', '2026-02-23 10:30:00', 'available', '2026-02-19 03:28:34'),
(52, 7, '2026-02-23 10:30:00', '2026-02-23 11:00:00', 'available', '2026-02-19 03:28:34'),
(53, 7, '2026-02-23 13:00:00', '2026-02-23 13:30:00', 'available', '2026-02-19 03:28:34'),
(54, 7, '2026-02-23 13:30:00', '2026-02-23 14:00:00', 'booked', '2026-02-19 03:28:34'),
(55, 7, '2026-02-23 14:00:00', '2026-02-23 14:30:00', 'available', '2026-02-19 03:28:34'),
(56, 7, '2026-02-23 14:30:00', '2026-02-23 15:00:00', 'available', '2026-02-19 03:28:34');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('patient','admin') NOT NULL DEFAULT 'patient',
  `created_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password_hash`, `role`, `created_timestamp`) VALUES
(1, 'Alice Tremblay', 'alice.tremblay@gmail.com', 'test123', 'patient', '2026-02-17 05:33:29'),
(2, 'Samuel Gagnon', 'samuel.gagnon@gmail.com', 'test123', 'patient', '2026-02-17 05:33:29'),
(3, 'Fatima Hassan', 'fatima.hassan@gmail.com', 'test123', 'patient', '2026-02-17 05:33:29'),
(4, 'Olivier Martin', 'olivier.martin@gmail.com', 'test123', 'patient', '2026-02-17 05:33:29'),
(5, 'Maya Benali', 'maya.benali@gmail.com', 'test123', 'patient', '2026-02-17 05:33:29'),
(6, 'Liam Roy', 'liam.roy@gmail.com', 'test123', 'patient', '2026-02-17 05:33:29'),
(7, 'Sarah Nguyen', 'sarah.nguyen@gmail.com', 'test123', 'patient', '2026-02-17 05:33:29'),
(8, 'Adam Bouchard', 'adam.bouchard@gmail.com', 'test123', 'patient', '2026-02-17 05:33:29'),
(9, 'Nafisa Begum', 'nafisa.begum@gmail.com', 'test123', 'patient', '2026-02-17 05:33:29'),
(10, 'Leila Karim', 'leila.karim@gmail.com', 'test123', 'patient', '2026-02-17 05:33:29'),
(11, 'Nathan Fortin', 'nathan.fortin@gmail.com', 'test123', 'patient', '2026-02-17 05:33:29'),
(12, 'Yasmine Kader', 'yasmine.kader@gmail.com', 'test123', 'patient', '2026-02-17 05:33:29'),
(13, 'Hugo Lambert', 'hugo.lambert@gmail.com', 'test123', 'patient', '2026-02-17 05:33:29'),
(14, 'Ines Haddad', 'ines.haddad@gmail.com', 'test123', 'patient', '2026-02-17 05:33:29'),
(15, 'Amir Rahman', 'amir.rahman@gmail.com', 'test123', 'patient', '2026-02-17 05:33:29'),
(16, 'Admin Clinique', 'admin@clinique.com', 'admin123', 'admin', '2026-02-17 05:33:29');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Index pour la table `doctor_services`
--
ALTER TABLE `doctor_services`
  ADD PRIMARY KEY (`doctor_id`,`service_id`);

--
-- Index pour la table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `time_slots`
--
ALTER TABLE `time_slots`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT pour la table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `time_slots`
--
ALTER TABLE `time_slots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
