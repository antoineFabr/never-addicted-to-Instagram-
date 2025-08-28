-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : db:3306
-- Généré le : jeu. 28 août 2025 à 07:32
-- Version du serveur : 8.0.30
-- Version de PHP : 8.0.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `db_instagram`
--

-- --------------------------------------------------------

--
-- Structure de la table `instagram_session`
--

CREATE TABLE `instagram_session` (
  `id` int NOT NULL,
  `sessionid` varchar(50) NOT NULL,
  `csrftoken` varchar(50) NOT NULL,
  `mid` varchar(50) DEFAULT NULL,
  `ig_did` varchar(50) DEFAULT NULL,
  `rur` varchar(50) DEFAULT NULL,
  `ds_user_id` varchar(50) NOT NULL,
  `id_user` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `mail` varchar(155) NOT NULL,
  `clef_login` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `sel` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `mail`, `clef_login`, `sel`) VALUES
(1, 'antoine.fabre@gmail.com', '12345', '12345'),
(2, 'antoine.fabre222@gmail.com', '$2b$10$1e4HCAphMSDV0OuJzmq/ZuNWV9s2NioVPc9ys/yZ6DHlJHd9xwddu', '$2b$10$1e4HCAphMSDV0OuJzmq/Zu'),
(4, 'antoine.fabre2@gmail.com', '$2b$10$RdmRB4Uubd.f4RWCpM.S3ekGDCMGGqDgVPN86ayhaKV5dUAEgrGSy', '$2b$10$RdmRB4Uubd.f4RWCpM.S3e'),
(5, 'antoine.fabre1@gmail.com', '$2b$10$R8BXDMQ/qjJiSTYlQt7s5.9hvR89abrcOMt1VjYcBvw5GRfq5ZQUy', '$2b$10$R8BXDMQ/qjJiSTYlQt7s5.'),
(6, 'antoine.fabre12@gmail.com', '$2b$10$RpCyMf0wNpVkwezm/.etxOqIq1TPTiJNRE0eMlpp55Gca7eDUY88K', '$2b$10$RpCyMf0wNpVkwezm/.etxO'),
(7, 'antoine.fabre123@gmail.com', '$2b$10$7VxZw3AxShsU7J0j5bjecOWhA8fnkizP2CqzDxXLHPR2gAX5eYzqW', '$2b$10$7VxZw3AxShsU7J0j5bjecO');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `instagram_session`
--
ALTER TABLE `instagram_session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mail` (`mail`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `instagram_session`
--
ALTER TABLE `instagram_session`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `instagram_session`
--
ALTER TABLE `instagram_session`
  ADD CONSTRAINT `instagram_session_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
