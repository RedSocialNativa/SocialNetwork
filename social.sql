-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 10-12-2017 a las 19:39:12
-- Versión del servidor: 10.0.31-MariaDB-0ubuntu0.16.04.2
-- Versión de PHP: 7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `social`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `post_body` text COLLATE utf8_spanish_ci NOT NULL,
  `posted_by` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `posted_to` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `date_added` datetime NOT NULL,
  `removed` varchar(3) COLLATE utf8_spanish_ci NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `username` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `body` text COLLATE utf8_spanish_ci NOT NULL,
  `added_by` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `user_to` varchar(60) COLLATE utf8_spanish_ci NOT NULL,
  `date_added` datetime NOT NULL,
  `user_closed` varchar(3) COLLATE utf8_spanish_ci NOT NULL,
  `deleted` varchar(3) COLLATE utf8_spanish_ci NOT NULL,
  `likes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `posts`
--

INSERT INTO `posts` (`id`, `body`, `added_by`, `user_to`, `date_added`, `user_closed`, `deleted`, `likes`) VALUES
(1, 'this is the first post', 'diego_mamani', 'none', '2017-10-16 16:47:01', 'no', 'no', 0),
(2, 'this is the first post', 'diego_mamani', 'none', '2017-10-16 16:56:48', 'no', 'no', 0),
(3, 'another post', 'diego_mamani', 'none', '2017-10-16 17:07:24', 'no', 'no', 0),
(4, 'hey everyone!', 'alex_mamani', 'none', '2017-11-04 17:57:04', 'no', 'no', 0),
(5, 'hi man, whats up!', 'diego_mamani', 'none', '2017-11-20 19:04:04', 'no', 'no', 0),
(6, 'alert(sdf)', 'diego_mamani', 'none', '2017-11-20 19:04:41', 'no', 'no', 0),
(7, 'toma', 'diego_mamani', 'none', '2017-11-25 17:59:38', 'no', 'no', 0),
(8, 'ptrp mas', 'diego_mamani', 'none', '2017-11-25 18:00:16', 'no', 'no', 0),
(9, 'what up men', 'diego_mamani', 'none', '2017-11-25 18:00:51', 'no', 'no', 0),
(10, 'are you kidding me?', 'diego_mamani', 'none', '2017-11-25 18:01:02', 'no', 'no', 0),
(11, 'what the fuck men', 'diego_mamani', 'none', '2017-11-25 18:01:25', 'no', 'no', 0),
(12, 'why?', 'diego_mamani', 'none', '2017-11-25 18:01:44', 'no', 'no', 0),
(13, 'why are you lie to me?', 'diego_mamani', 'none', '2017-11-25 18:02:09', 'no', 'no', 0),
(14, 'tell me why?', 'diego_mamani', 'none', '2017-11-25 18:02:39', 'no', 'no', 0),
(15, 'tell me why?', 'diego_mamani', 'none', '2017-11-25 18:17:34', 'no', 'no', 0),
(16, 'funciona hcuck', 'diego_mamani', 'none', '2017-11-25 18:19:44', 'no', 'no', 0),
(17, 'hi man', 'nuevo_mamani', 'none', '2017-11-25 18:50:51', 'no', 'no', 0),
(18, 'what up men', 'nuevo_mamani', 'none', '2017-11-25 18:50:59', 'no', 'no', 0),
(19, 'i think this is bad', 'pip_piper', 'none', '2017-12-07 19:45:56', 'no', 'no', 0),
(20, 'yeah!', 'nuevo_mamani', 'none', '2017-12-07 19:46:57', 'no', 'no', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `last_name` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `username` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `signup_date` date NOT NULL,
  `profile_pic` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `num_posts` int(11) NOT NULL,
  `num_likes` int(11) NOT NULL,
  `user_closed` varchar(3) COLLATE utf8_spanish_ci NOT NULL,
  `friend_array` text COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `username`, `email`, `password`, `signup_date`, `profile_pic`, `num_posts`, `num_likes`, `user_closed`, `friend_array`) VALUES
(1, 'san', 'mama', 'sanma', 'san@hotmail.com', 'hola', '2017-08-01', 'jkhk', 1, 1, 'no', ','),
(2, 'San', 'Ma', 'san_ma', 'Sanb@hotmail.com', '16e1e3ddad96b6b479e04ba5694db570', '2017-08-28', 'assets/images/profile_pics/defaults/head_deep_blue.png', 0, 0, 'no', ','),
(3, 'San', 'Ma', 'san_ma_1', 'Sanbh@hotmail.com', '32d4eef57716f241e62566676cb3d247', '2017-08-28', '', 0, 0, 'no', ','),
(4, 'San', 'Maa', 'san_maa', 'Sanbha@hotmail.com', '16e1e3ddad96b6b479e04ba5694db570', '2017-08-28', 'assets/images/profile_pics/defaults/head_emerald.png', 0, 0, 'no', ','),
(5, 'San', 'Maah', 'san_maah', 'Sanbhha@hotmail.com', '16e1e3ddad96b6b479e04ba5694db570', '2017-08-28', 'assets/images/profile_pics/defaults/head_emerald.png', 0, 0, 'no', ','),
(6, 'Diego', 'Mamani', 'diego_mamani', 'Diego@gmail.com', '078c007bd92ddec308ae2f5115c1775d', '2017-09-01', 'assets/images/profile_pics/defaults/head_emerald.png', 13, 0, 'no', ',alex_mamani,bart_simpson,pip_piper,'),
(7, 'Alex', 'Mamani', 'alex_mamani', 'Alex@gmail.com', '078c007bd92ddec308ae2f5115c1775d', '2017-09-01', 'assets/images/profile_pics/defaults/head_emerald.png', 1, 0, 'no', ',diego_mamani,'),
(8, 'Nuevo', 'Mamani', 'nuevo_mamani', 'Nuevo@gmail.com', '078c007bd92ddec308ae2f5115c1775d', '2017-11-25', 'assets/images/profile_pics/defaults/head_emerald.png', 3, 0, 'no', ','),
(9, 'Bart', 'Simpson', 'bart_simpson', 'Bart@gmail.com', '078c007bd92ddec308ae2f5115c1775d', '2017-12-07', 'assets/images/profile_pics/defaults/head_deep_blue.png', 0, 0, 'no', ',diego_mamani,'),
(10, 'Pip', 'Piper', 'pip_piper', 'Pip@gmail.com', '078c007bd92ddec308ae2f5115c1775d', '2017-12-07', 'assets/images/profile_pics/defaults/head_emerald.png', 1, 0, 'no', ',diego_mamani,');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
