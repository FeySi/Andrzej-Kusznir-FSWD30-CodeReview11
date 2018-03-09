-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 07 Mar 2018, 11:24
-- Wersja serwera: 10.1.30-MariaDB
-- Wersja PHP: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `cr11_andrzej_kusznir_php_car_rental`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `car`
--

CREATE TABLE `car` (
  `car_id` int(11) NOT NULL,
  `fk_cartype_id` int(11) DEFAULT NULL,
  `fk_status_id` int(11) DEFAULT NULL,
  `fk_location_id` int(11) DEFAULT NULL,
  `fk_office_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `car`
--

INSERT INTO `car` (`car_id`, `fk_cartype_id`, `fk_status_id`, `fk_location_id`, `fk_office_id`) VALUES
(1, 4, 2, 5, 3),
(2, 6, 1, 3, 2),
(3, 6, 2, 4, 2),
(4, 1, 1, 6, 4),
(6, 3, 1, 1, 4),
(7, 6, 1, 2, 1),
(8, 6, 1, 3, 6),
(9, 5, 1, 1, 4),
(10, 2, 2, 4, 2),
(11, 1, 1, 6, 3),
(12, 3, 1, 2, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `cars_location`
--

CREATE TABLE `cars_location` (
  `location_id` int(11) NOT NULL,
  `location` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `cars_location`
--

INSERT INTO `cars_location` (`location_id`, `location`) VALUES
(1, 'Berolinastraße 9, 10178 Berlin, germany'),
(2, 'An der Kolonnade 1, 10117 Berlin, germany'),
(3, 'Am Sandtorkai 54, 20457 Hamburg, germany'),
(4, 'Am Sandtorkai 32, 20457 Hamburg, germany'),
(5, 'Bei den Mühren 91, 20457 Hamburg, germany'),
(6, 'Handelskai 343, 1020 Wien austria'),
(7, 'Mattiellistraße 2-4, 1040 Wien'),
(8, 'Millergasse, 1070 Wien'),
(9, 'Weißenwolffstraße 15, 4020 Linz'),
(10, 'Kärntnerstraße 18, 4020 Linz'),
(11, 'Karl-Wurmb-Straße 5, 5020 Salzburg'),
(12, 'Petersbrunnstraße, 5020 Salzburg'),
(13, 'Am Messezentrum 1, 5020 Salzburg');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `cartype`
--

CREATE TABLE `cartype` (
  `cartype_id` int(11) NOT NULL,
  `type` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `cartype`
--

INSERT INTO `cartype` (`cartype_id`, `type`) VALUES
(1, 'VW Arteon'),
(2, 'VW Bus'),
(3, 'BMW 1'),
(4, 'BMW 4er'),
(5, 'Mercedes-Benz CL'),
(6, 'Mercedes-Benz GLC');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `car_status`
--

CREATE TABLE `car_status` (
  `status_id` int(11) NOT NULL,
  `car_status` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `car_status`
--

INSERT INTO `car_status` (`status_id`, `car_status`) VALUES
(1, 'rented'),
(2, 'free');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `office`
--

CREATE TABLE `office` (
  `office_id` int(11) NOT NULL,
  `address` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `office`
--

INSERT INTO `office` (`office_id`, `address`) VALUES
(1, 'perusgasse 10, wien austria'),
(2, 'karlsplatz 15 Berlin Germany'),
(3, 'ruhgasse 24 Hamburg Germany'),
(4, 'Saltzburgstrasse 112 saltzburg austria'),
(5, 'schotentor 145 wien austria'),
(6, 'huptbahnhof 1 linz austria');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`car_id`),
  ADD KEY `fk_location_id` (`fk_location_id`),
  ADD KEY `fk_cartype_id` (`fk_cartype_id`),
  ADD KEY `fk_status_id` (`fk_status_id`),
  ADD KEY `fk_office_id` (`fk_office_id`);

--
-- Indexes for table `cars_location`
--
ALTER TABLE `cars_location`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `cartype`
--
ALTER TABLE `cartype`
  ADD PRIMARY KEY (`cartype_id`);

--
-- Indexes for table `car_status`
--
ALTER TABLE `car_status`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `office`
--
ALTER TABLE `office`
  ADD PRIMARY KEY (`office_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `cars_location`
--
ALTER TABLE `cars_location`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT dla tabeli `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `car_ibfk_1` FOREIGN KEY (`fk_location_id`) REFERENCES `cars_location` (`location_id`),
  ADD CONSTRAINT `car_ibfk_2` FOREIGN KEY (`fk_cartype_id`) REFERENCES `cartype` (`cartype_id`),
  ADD CONSTRAINT `car_ibfk_3` FOREIGN KEY (`fk_cartype_id`) REFERENCES `cartype` (`cartype_id`),
  ADD CONSTRAINT `car_ibfk_4` FOREIGN KEY (`fk_status_id`) REFERENCES `car_status` (`status_id`),
  ADD CONSTRAINT `car_ibfk_5` FOREIGN KEY (`fk_office_id`) REFERENCES `office` (`office_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
