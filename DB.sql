-- phpMyAdmin SQL Dump
-- version 4.0.10.6
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Окт 03 2017 г., 16:31
-- Версия сервера: 5.6.22-log
-- Версия PHP: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `iconix`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Categories`
--

CREATE TABLE IF NOT EXISTS `Categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) NOT NULL,
  `image` varchar(500) NOT NULL,
  `key` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=53 ;

--
-- Дамп данных таблицы `Categories`
--

INSERT INTO `Categories` (`id`, `category_name`, `image`, `key`) VALUES
(45, 'Art', 'painting-palette.svg', '9073f7e57c326f08f2bac85f6c181296'),
(46, 'Cinema', 'video-camera.svg', '94f2ac313fd8ba7bd5703e89db6f6746'),
(47, 'Arrows', 'play-button.svg', '0a13cd9655ec3ee8c4550ed7f86508e4'),
(48, 'City', 'cityscape.svg', '9dfcb47729b3b39f7cba893517e35fcd'),
(49, 'Store', 'online-store.svg', 'c2fca64ec8e2c8fa20d4190863c90ea7'),
(50, 'Buildings', 'industry.svg', '5f526ed656165af4c9b118d8a1436c38'),
(51, 'Communications', 'speak.svg', '5456a556296f564e24b50d4fac00362d'),
(52, 'Ecology', 'sprout.svg', '1213d0a8cd2f1064102ab1db91a5fce2');

-- --------------------------------------------------------

--
-- Структура таблицы `Icons`
--

CREATE TABLE IF NOT EXISTS `Icons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(200) NOT NULL,
  `file` varchar(500) NOT NULL,
  `name` varchar(100) NOT NULL,
  `rating` int(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=151 ;

--
-- Дамп данных таблицы `Icons`
--

INSERT INTO `Icons` (`id`, `category`, `file`, `name`, `rating`) VALUES
(41, 'Store', 'online-store.svg', 'online store', 54),
(43, 'Store', 'shopping-cart.svg', 'cart', 1),
(44, 'Store', 'shopping-bag.svg', 'bag', 1),
(45, 'Store', 'online-shop.svg', 'online Shop', 1),
(46, 'Communications', 'smartphone.svg', 'smart', 1),
(47, 'Communications', 'chat.svg', 'chat', 56),
(48, 'Store', 'basket.svg', 'basket', 0),
(49, 'Store', 'groceries.svg', 'groceries', 0),
(50, 'Store', 'shopping-store.svg', 'shopping-store', 0),
(52, 'Store', 'shopping-store (1).svg', 'shopping-store', 1),
(53, 'Store', 'close.svg', 'close', 0),
(54, 'Store', 'shop.svg', 'shop', 0),
(55, 'Store', 'shopping-basket.svg', 'shopping-basket', 0),
(56, 'Ecology', 'flame.svg', 'flame', 0),
(57, 'Ecology', 'recycle.svg', 'recy', 0),
(58, 'Ecology', 'mill.svg', 'mill', 1),
(59, 'Ecology', 'windmills.svg', 'windmills', 0),
(60, 'Ecology', 'eco.svg', 'eco', 1),
(61, 'Ecology', 'dry-tree.svg', 'tree', 0),
(62, 'Ecology', 'sprout.svg', 'sprout', 0),
(63, 'Ecology', 'wind-mill.svg', 'wind-mill', 0),
(64, 'Ecology', 'earth-globe.svg', 'earch', 0),
(65, 'Ecology', 'sprout (1).svg', 'sprout', 0),
(66, 'Communications', 'phone-call.svg', 'phone', 0),
(67, 'Communications', 'hand-gesture.svg', 'hand', 0),
(68, 'Communications', 'mailing.svg', 'mailing', 0),
(69, 'Communications', 'chatting.svg', 'chat', 0),
(70, 'Communications', 'gmail.svg', 'gmail', 0),
(71, 'Communications', 'webcam.svg', 'web', 1),
(72, 'Communications', 'wifi-signal.svg', 'wifi', 0),
(73, 'Communications', 'weekly-calendar.svg', 'calendar', 0),
(74, 'Communications', 'satellite.svg', 'sattelite', 0),
(75, 'Communications', 'megaphone.svg', 'megaphone', 0),
(76, 'Buildings', 'blueprint.svg', 'blue', 0),
(77, 'Buildings', 'house.svg', 'house', 1),
(78, 'Buildings', 'cityscape.svg', 'city', 0),
(79, 'Buildings', 'bank.svg', 'bank', 0),
(80, 'Buildings', 'home.svg', 'home', 0),
(81, 'Buildings', 'village.svg', 'village', 0),
(82, 'Buildings', 'fireplace.svg', 'fireplace', 0),
(83, 'Buildings', 'bridge.svg', 'bridge', 0),
(84, 'Buildings', 'nuclear-plant.svg', 'nuclear-plant', 0),
(85, 'Buildings', 'ruins.svg', 'ruins', 0),
(86, 'Buildings', 'real-estate.svg', 'real-estate', 0),
(88, 'Buildings', 'traffic-lights.svg', 'traffic-lights', 1),
(89, 'City', 'new-york.svg', 'new', 0),
(90, 'City', 'supermarket.svg', 'supermarket', 0),
(91, 'City', 'hotel.svg', 'hotel', 0),
(92, 'City', 'skyscraper.svg', 'skyscraper', 0),
(93, 'City', 'bridge (1).svg', 'bridge', 0),
(94, 'City', 'cityscape (1).svg', 'cityscape', 0),
(95, 'City', 'school.svg', 'school', 0),
(96, 'Arrows', 'navigation.svg', 'nav', 0),
(97, 'Arrows', 'repeat.svg', 'repeat', 0),
(98, 'Arrows', 'target.svg', 'target', 0),
(99, 'Arrows', 'right-arrow.svg', 'right', 0),
(100, 'Arrows', 'refresh.svg', 'refresh', 0),
(101, 'Arrows', 'play.svg', 'play', 0),
(102, 'Arrows', 'next.svg', 'next', 0),
(103, 'Arrows', 'maps-and-flags.svg', 'maps', 0),
(104, 'Arrows', 'loss.svg', 'loss', 0),
(105, 'Arrows', 'graph.svg', 'graph', 0),
(106, 'Arrows', 'exit.svg', 'exit', 0),
(107, 'Arrows', 'download.svg', 'download', 0),
(108, 'Arrows', 'download (1).svg', 'download', 0),
(109, 'Arrows', 'diagram.svg', 'diagram', 0),
(110, 'Arrows', 'cloud-computing.svg', 'cloud', 0),
(111, 'Arrows', 'businessman.svg', 'bussinessman', 0),
(112, 'Arrows', 'back.svg', 'back', 0),
(113, 'Cinema', 'videos.svg', 'videos', 0),
(114, 'Cinema', 'video-play.svg', 'video play', 1),
(115, 'Cinema', 'video-camera.svg', 'video camera', 0),
(116, 'Cinema', 'video-camera (1).svg', 'video camera', 0),
(117, 'Cinema', 'tickets.svg', 'tickets', 0),
(118, 'Cinema', 'recorder.svg', 'recorder', 0),
(119, 'Cinema', 'popcorn.svg', 'popcorn', 0),
(120, 'Cinema', 'popcorn (3).svg', 'popcorn', 0),
(121, 'Cinema', 'popcorn (2).svg', 'popcorn', 0),
(122, 'Cinema', 'popcorn (1).svg', 'popcorn', 0),
(123, 'Cinema', 'film-reel.svg', 'film-reel', 0),
(124, 'Cinema', 'film.svg', 'film', 0),
(125, 'Cinema', 'configuration.svg', 'configuration', 1),
(126, 'Cinema', 'clapperboard.svg', 'clapperboard', 1),
(127, 'Cinema', 'clapperboard (2).svg', 'clapperboard (2)', 0),
(128, 'Cinema', 'clapperboard (1).svg', 'clapperboard (1)', 1),
(129, 'Art', 'tools.svg', 'tools', 0),
(130, 'Art', 'pantone.svg', 'pantone', 0),
(131, 'Art', 'pantone (1).svg', 'pantone', 0),
(132, 'Art', 'palette.svg', 'palette', 0),
(133, 'Art', 'paint-roller.svg', 'paint roller', 0),
(134, 'Art', 'paint-palette.svg', 'paint-palette', 0),
(135, 'Art', 'paint-palette (2).svg', 'paint-palette', 0),
(136, 'Art', 'paint-palette (1).svg', 'paint-palette', 0),
(137, 'Art', 'paint-brush.svg', 'paint-brush', 0),
(138, 'Art', 'paint-brush (4).svg', 'paint-brush', 0),
(139, 'Art', 'paint-brush (3).svg', 'paint-brush', 0),
(140, 'Art', 'paint-brush (2).svg', 'paint-brush', 0),
(141, 'Art', 'paint-brush (1).svg', 'paint-brush', 1),
(142, 'Art', 'graphic-tool.svg', 'graphic-tool', 0),
(143, 'Art', 'graphic-tablet.svg', 'graphic-tablet', 1),
(144, 'Art', 'graphic-design.svg', 'graphic-design', 1),
(145, 'Art', 'graphic-design (1).svg', 'graphic-design', 0),
(146, 'Art', 'gallery.svg', 'gallery', 0),
(147, 'Art', 'edit-tools.svg', 'edit-tools', 0),
(148, 'Art', 'drawing.svg', 'drawing', 1),
(149, 'Art', 'creative-process.svg', 'creative-process', 0),
(150, 'Art', 'brush.svg', 'brush', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `likes`
--

CREATE TABLE IF NOT EXISTS `likes` (
  `username` varchar(100) NOT NULL,
  `post_id` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=37 ;

--
-- Дамп данных таблицы `likes`
--

INSERT INTO `likes` (`username`, `post_id`, `id`) VALUES
('admin', 46, 13),
('admin', 44, 14),
('admin', 47, 15),
('admin', 45, 16),
('admin', 40, 17),
('admin', 41, 18),
('admin', 43, 19),
('admin', 58, 20),
('admin', 60, 21),
('admin', 52, 22),
('admin', 88, 23),
('admin', 128, 24),
('admin', 126, 25),
('admin', 125, 26),
('user145', 150, 27),
('user145', 141, 28),
('user145', 114, 29),
('admin', 77, 30),
('admin', 71, 31),
('admin', 150, 32),
('undefined', 148, 33),
('undefined', 143, 34),
('undefined', 150, 35),
('admin', 144, 36);

-- --------------------------------------------------------

--
-- Структура таблицы `Users`
--

CREATE TABLE IF NOT EXISTS `Users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` varchar(100) NOT NULL,
  `admin` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;

--
-- Дамп данных таблицы `Users`
--

INSERT INTO `Users` (`id`, `first_name`, `last_name`, `username`, `password`, `admin`) VALUES
(1, 'Evgeniy', 'Prosviryn', 'admin', 'admin123', 1),
(28, 'Evgeniy', 'Prosviryn', 'user145', 'user145', 0),
(29, 'undefined', 'undefined', 'undefined', 'undefined', 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
