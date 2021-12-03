-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 03. Dez 2021 um 09:04
-- Server-Version: 10.4.17-MariaDB
-- PHP-Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `library`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `article`
--

CREATE TABLE `article` (
  `article_id` int(11) NOT NULL,
  `article_title` varchar(60) NOT NULL,
  `issue_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `article`
--

INSERT INTO `article` (`article_id`, `article_title`, `issue_id`) VALUES
(1, 'Hochbeet bauen', 1),
(2, 'was heißt BIO?', 1),
(3, 'Der eigene Spielplatz im eigenen Garten', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `article_author`
--

CREATE TABLE `article_author` (
  `article_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `article_author`
--

INSERT INTO `article_author` (`article_id`, `author_id`) VALUES
(1, 1),
(2, 1),
(3, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `article_keyword_relevance`
--

CREATE TABLE `article_keyword_relevance` (
  `article_id` int(11) NOT NULL,
  `keyword_id` int(11) NOT NULL,
  `relevance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `article_keyword_relevance`
--

INSERT INTO `article_keyword_relevance` (`article_id`, `keyword_id`, `relevance`) VALUES
(1, 5, 7),
(1, 6, 7),
(1, 7, 10),
(1, 8, 8),
(1, 9, 9);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `author`
--

CREATE TABLE `author` (
  `author_id` int(11) NOT NULL,
  `author_firstname` varchar(30) DEFAULT NULL,
  `author_lastname` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `author`
--

INSERT INTO `author` (`author_id`, `author_firstname`, `author_lastname`) VALUES
(1, 'Christine', 'Thürmer'),
(2, 'Nora', 'Roberts'),
(3, 'J.D.', 'Robb'),
(4, 'August', 'Zirner'),
(5, 'Ana', 'Zirner');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `book`
--

CREATE TABLE `book` (
  `isbn` varchar(30) NOT NULL,
  `book_title` varchar(100) NOT NULL,
  `publishingHouse_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `book`
--

INSERT INTO `book` (`isbn`, `book_title`, `publishingHouse_id`) VALUES
('978-3492404884', 'Laufen. Essen. Schlafen.: Eine Frau, drei Trails und 12.700 Kilometer Wildnis', 3),
('978-3745701715', 'Wo Weihnachtsträume wahr werden', 2),
('B00HCBCVPW', 'Ein sündiges Alibi', 1),
('B08MCCFR7K', 'Nach dem Sturm', 1),
('B092LCM6Z7', 'Ella und Laura: Von den Müttern unserer Väter', 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `book_author`
--

CREATE TABLE `book_author` (
  `isbn` varchar(60) NOT NULL,
  `author_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `book_author`
--

INSERT INTO `book_author` (`isbn`, `author_id`) VALUES
('978-3492404884', 1),
('978-3745701715', 2),
('B00HCBCVPW', 3),
('B08MCCFR7K', 2),
('B092LCM6Z7', 4),
('B092LCM6Z7', 5);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `book_keyword_relevance`
--

CREATE TABLE `book_keyword_relevance` (
  `isbn` varchar(30) NOT NULL,
  `keyword_id` int(11) NOT NULL,
  `relevance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `book_keyword_relevance`
--

INSERT INTO `book_keyword_relevance` (`isbn`, `keyword_id`, `relevance`) VALUES
('978-3492404884', 14, 10),
('978-3745701715', 10, 10),
('978-3745701715', 14, 7),
('B00HCBCVPW', 12, 10),
('B00HCBCVPW', 14, 5);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `book_subjectarea`
--

CREATE TABLE `book_subjectarea` (
  `isbn` varchar(30) NOT NULL,
  `subjectArea_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `book_subjectarea`
--

INSERT INTO `book_subjectarea` (`isbn`, `subjectArea_id`) VALUES
('978-3492404884', 8),
('978-3745701715', 8),
('B00HCBCVPW', 8),
('B08MCCFR7K', 8),
('B092LCM6Z7', 8);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `customer_firstname` varchar(30) NOT NULL,
  `customer_lastname` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_firstname`, `customer_lastname`) VALUES
(1, 'Michaela', 'Schmidleitner'),
(2, 'Max', 'Schmidleitner'),
(3, 'Gert', 'Schmidleitner'),
(4, 'Carolin', 'Schmidleitner'),
(5, 'Paul', 'Müller'),
(6, 'Jasmin', 'Zaunbauer');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `employee_firstname` varchar(30) NOT NULL,
  `employee_lastname` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `employee`
--

INSERT INTO `employee` (`employee_id`, `employee_firstname`, `employee_lastname`) VALUES
(1, 'Michaela', 'Bauer'),
(2, 'Max', 'Mustermann'),
(3, 'Gert', 'Neuhuber'),
(4, 'Carolin', 'Sauer'),
(5, 'Paul', 'Gross'),
(6, 'Jasmin', 'Neuner');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `journal`
--

CREATE TABLE `journal` (
  `journal_id` int(11) NOT NULL,
  `journal_name` varchar(60) NOT NULL,
  `issues_per_year` int(11) DEFAULT NULL,
  `publishingHouse_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `journal`
--

INSERT INTO `journal` (`journal_id`, `journal_name`, `issues_per_year`, `publishingHouse_id`) VALUES
(1, 'Mein schöner Garten', 12, 5);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `journal_subjectarea`
--

CREATE TABLE `journal_subjectarea` (
  `journal_id` int(11) NOT NULL,
  `subjectArea_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `journal_subjectarea`
--

INSERT INTO `journal_subjectarea` (`journal_id`, `subjectArea_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `keyword`
--

CREATE TABLE `keyword` (
  `keyword_id` int(11) NOT NULL,
  `keyword` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `keyword`
--

INSERT INTO `keyword` (`keyword_id`, `keyword`) VALUES
(1, 'Schaukel'),
(2, 'Rutsche'),
(3, 'Spielplatz'),
(4, 'Erde'),
(5, 'Schnecken'),
(6, 'Schädlinge'),
(7, 'Hochbeet'),
(8, 'Bio'),
(9, 'Gemüse anbauen'),
(10, 'Liebesroman'),
(11, 'Geschichtsroman'),
(12, 'Krimi'),
(13, 'Thriller'),
(14, 'Abenteuer');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `keyword_synonym`
--

CREATE TABLE `keyword_synonym` (
  `keyword_id` int(11) NOT NULL,
  `synonym_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `keyword_synonym`
--

INSERT INTO `keyword_synonym` (`keyword_id`, `synonym_id`) VALUES
(5, 6);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `loan`
--

CREATE TABLE `loan` (
  `loan_id` int(11) NOT NULL,
  `loan_date` date NOT NULL DEFAULT current_timestamp(),
  `physicalBook_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `responsible_for_loan` int(11) NOT NULL,
  `responsible_for_return` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `loan`
--

INSERT INTO `loan` (`loan_id`, `loan_date`, `physicalBook_id`, `customer_id`, `responsible_for_loan`, `responsible_for_return`) VALUES
(1, '2021-11-28', 3, 2, 1, NULL),
(2, '2021-11-28', 4, 2, 1, NULL),
(3, '2021-11-28', 5, 2, 1, NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `physicalbook`
--

CREATE TABLE `physicalbook` (
  `physicalBook_id` int(11) NOT NULL,
  `isbn` varchar(30) NOT NULL,
  `shelf_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `physicalbook`
--

INSERT INTO `physicalbook` (`physicalBook_id`, `isbn`, `shelf_id`) VALUES
(1, '978-3492404884', 8),
(2, '978-3745701715', 8),
(3, '978-3745701715', 8),
(4, 'B00HCBCVPW', 8),
(5, 'B00HCBCVPW', 8),
(6, 'B00HCBCVPW', 8),
(7, 'B092LCM6Z7', 8);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `publishedissue`
--

CREATE TABLE `publishedissue` (
  `issue_id` int(11) NOT NULL,
  `issue_year` int(11) NOT NULL,
  `issue_nr` int(11) NOT NULL,
  `issue_date` date DEFAULT NULL,
  `journal_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `publishedissue`
--

INSERT INTO `publishedissue` (`issue_id`, `issue_year`, `issue_nr`, `issue_date`, `journal_id`) VALUES
(1, 2020, 1, '2020-01-01', 1),
(2, 2020, 2, '2020-02-01', 1),
(3, 2020, 3, '2020-01-01', 1),
(4, 2020, 4, '2020-01-01', 1),
(5, 2020, 5, '2020-01-01', 1),
(6, 2020, 6, '2020-01-01', 1),
(7, 2020, 7, '2020-01-01', 1),
(8, 2020, 8, '2020-01-01', 1),
(9, 2020, 9, '2020-01-01', 1),
(10, 2020, 10, '2020-01-01', 1),
(11, 2020, 11, '2020-01-01', 1),
(12, 2020, 12, '2020-01-01', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `publishinghouse`
--

CREATE TABLE `publishinghouse` (
  `publishingHouse_id` int(11) NOT NULL,
  `publishingHouse_name` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `publishinghouse`
--

INSERT INTO `publishinghouse` (`publishingHouse_id`, `publishingHouse_name`) VALUES
(1, 'Blanvalet Taschenbuch Verlag'),
(2, 'MIRA Taschenbuch'),
(3, 'NG Taschenbuch'),
(4, 'Piper ebooks'),
(5, 'Hubert Burda Media');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `reservation`
--

CREATE TABLE `reservation` (
  `reservation_id` int(11) NOT NULL,
  `reservation_date` date NOT NULL DEFAULT current_timestamp(),
  `physicalBook_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `loan_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `reservation`
--

INSERT INTO `reservation` (`reservation_id`, `reservation_date`, `physicalBook_id`, `customer_id`, `loan_id`) VALUES
(1, '2021-11-28', 1, 1, NULL),
(2, '2021-11-28', 2, 1, NULL),
(3, '2021-11-28', 5, 2, 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `shelf`
--

CREATE TABLE `shelf` (
  `shelf_id` int(11) NOT NULL,
  `shelf_location` varchar(30) NOT NULL,
  `subjectArea_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `shelf`
--

INSERT INTO `shelf` (`shelf_id`, `shelf_location`, `subjectArea_id`) VALUES
(1, 'Erdgeschoß', 1),
(2, 'Erdgeschoß', 1),
(3, 'Erdgeschoß', 2),
(4, 'Erdgeschoß', 2),
(5, 'Erdgeschoß', 2),
(6, 'Erdgeschoß', 2),
(7, '1. Stock', 3),
(8, '1. Stock', 4),
(9, '1. Stock', 5),
(10, '1. Stock', 6),
(11, '2. Stock', 7),
(12, '2. Stock', 8),
(13, '2. Stock', 8),
(14, '2. Stock', 8),
(15, '2. Stock', 8),
(16, '2. Stock', 9);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `subjectarea`
--

CREATE TABLE `subjectarea` (
  `subjectArea_id` int(11) NOT NULL,
  `subjectArea_name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `subjectarea`
--

INSERT INTO `subjectarea` (`subjectArea_id`, `subjectArea_name`) VALUES
(1, 'Garten'),
(2, 'Kinder'),
(3, 'Erziehung'),
(4, 'Sport'),
(5, 'Pferd'),
(6, 'Hund'),
(7, 'Mode'),
(8, 'Roman'),
(9, 'Geschichte');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`article_id`),
  ADD KEY `issue_id` (`issue_id`);

--
-- Indizes für die Tabelle `article_author`
--
ALTER TABLE `article_author`
  ADD PRIMARY KEY (`article_id`,`author_id`),
  ADD KEY `author_id` (`author_id`);

--
-- Indizes für die Tabelle `article_keyword_relevance`
--
ALTER TABLE `article_keyword_relevance`
  ADD PRIMARY KEY (`article_id`,`keyword_id`),
  ADD KEY `keyword_id` (`keyword_id`);

--
-- Indizes für die Tabelle `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`author_id`);

--
-- Indizes für die Tabelle `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`isbn`),
  ADD KEY `publishingHouse_id` (`publishingHouse_id`);

--
-- Indizes für die Tabelle `book_author`
--
ALTER TABLE `book_author`
  ADD PRIMARY KEY (`isbn`,`author_id`),
  ADD KEY `author_id` (`author_id`);

--
-- Indizes für die Tabelle `book_keyword_relevance`
--
ALTER TABLE `book_keyword_relevance`
  ADD PRIMARY KEY (`isbn`,`keyword_id`),
  ADD KEY `keyword_id` (`keyword_id`);

--
-- Indizes für die Tabelle `book_subjectarea`
--
ALTER TABLE `book_subjectarea`
  ADD PRIMARY KEY (`isbn`,`subjectArea_id`),
  ADD KEY `subjectArea_id` (`subjectArea_id`);

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indizes für die Tabelle `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`);

--
-- Indizes für die Tabelle `journal`
--
ALTER TABLE `journal`
  ADD PRIMARY KEY (`journal_id`),
  ADD KEY `publishingHouse_id` (`publishingHouse_id`);

--
-- Indizes für die Tabelle `journal_subjectarea`
--
ALTER TABLE `journal_subjectarea`
  ADD PRIMARY KEY (`journal_id`,`subjectArea_id`),
  ADD KEY `subjectArea_id` (`subjectArea_id`);

--
-- Indizes für die Tabelle `keyword`
--
ALTER TABLE `keyword`
  ADD PRIMARY KEY (`keyword_id`);

--
-- Indizes für die Tabelle `keyword_synonym`
--
ALTER TABLE `keyword_synonym`
  ADD PRIMARY KEY (`keyword_id`,`synonym_id`),
  ADD KEY `synonym_id` (`synonym_id`);

--
-- Indizes für die Tabelle `loan`
--
ALTER TABLE `loan`
  ADD PRIMARY KEY (`loan_id`),
  ADD UNIQUE KEY `loan_date` (`loan_date`,`physicalBook_id`,`customer_id`),
  ADD KEY `physicalBook_id` (`physicalBook_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `responsible_for_loan` (`responsible_for_loan`),
  ADD KEY `responsible_for_return` (`responsible_for_return`);

--
-- Indizes für die Tabelle `physicalbook`
--
ALTER TABLE `physicalbook`
  ADD PRIMARY KEY (`physicalBook_id`),
  ADD KEY `isbn` (`isbn`),
  ADD KEY `shelf_id` (`shelf_id`);

--
-- Indizes für die Tabelle `publishedissue`
--
ALTER TABLE `publishedissue`
  ADD PRIMARY KEY (`issue_id`),
  ADD UNIQUE KEY `issue_year` (`issue_year`,`issue_nr`),
  ADD KEY `journal_id` (`journal_id`);

--
-- Indizes für die Tabelle `publishinghouse`
--
ALTER TABLE `publishinghouse`
  ADD PRIMARY KEY (`publishingHouse_id`);

--
-- Indizes für die Tabelle `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `physicalBook_id` (`physicalBook_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `loan_id` (`loan_id`);

--
-- Indizes für die Tabelle `shelf`
--
ALTER TABLE `shelf`
  ADD PRIMARY KEY (`shelf_id`),
  ADD KEY `subjectArea_id` (`subjectArea_id`);

--
-- Indizes für die Tabelle `subjectarea`
--
ALTER TABLE `subjectarea`
  ADD PRIMARY KEY (`subjectArea_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `article`
--
ALTER TABLE `article`
  MODIFY `article_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `author`
--
ALTER TABLE `author`
  MODIFY `author_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `journal`
--
ALTER TABLE `journal`
  MODIFY `journal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `keyword`
--
ALTER TABLE `keyword`
  MODIFY `keyword_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT für Tabelle `loan`
--
ALTER TABLE `loan`
  MODIFY `loan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `physicalbook`
--
ALTER TABLE `physicalbook`
  MODIFY `physicalBook_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `publishedissue`
--
ALTER TABLE `publishedissue`
  MODIFY `issue_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT für Tabelle `publishinghouse`
--
ALTER TABLE `publishinghouse`
  MODIFY `publishingHouse_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `reservation`
--
ALTER TABLE `reservation`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `shelf`
--
ALTER TABLE `shelf`
  MODIFY `shelf_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT für Tabelle `subjectarea`
--
ALTER TABLE `subjectarea`
  MODIFY `subjectArea_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `article_ibfk_1` FOREIGN KEY (`issue_id`) REFERENCES `publishedissue` (`issue_id`);

--
-- Constraints der Tabelle `article_author`
--
ALTER TABLE `article_author`
  ADD CONSTRAINT `article_author_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`),
  ADD CONSTRAINT `article_author_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`);

--
-- Constraints der Tabelle `article_keyword_relevance`
--
ALTER TABLE `article_keyword_relevance`
  ADD CONSTRAINT `article_keyword_relevance_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `article` (`article_id`),
  ADD CONSTRAINT `article_keyword_relevance_ibfk_2` FOREIGN KEY (`keyword_id`) REFERENCES `keyword` (`keyword_id`);

--
-- Constraints der Tabelle `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`publishingHouse_id`) REFERENCES `publishinghouse` (`publishingHouse_id`);

--
-- Constraints der Tabelle `book_author`
--
ALTER TABLE `book_author`
  ADD CONSTRAINT `book_author_ibfk_1` FOREIGN KEY (`isbn`) REFERENCES `book` (`isbn`),
  ADD CONSTRAINT `book_author_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`);

--
-- Constraints der Tabelle `book_keyword_relevance`
--
ALTER TABLE `book_keyword_relevance`
  ADD CONSTRAINT `book_keyword_relevance_ibfk_1` FOREIGN KEY (`isbn`) REFERENCES `book` (`isbn`),
  ADD CONSTRAINT `book_keyword_relevance_ibfk_2` FOREIGN KEY (`keyword_id`) REFERENCES `keyword` (`keyword_id`);

--
-- Constraints der Tabelle `book_subjectarea`
--
ALTER TABLE `book_subjectarea`
  ADD CONSTRAINT `book_subjectarea_ibfk_1` FOREIGN KEY (`isbn`) REFERENCES `book` (`isbn`),
  ADD CONSTRAINT `book_subjectarea_ibfk_2` FOREIGN KEY (`subjectArea_id`) REFERENCES `subjectarea` (`subjectArea_id`);

--
-- Constraints der Tabelle `journal`
--
ALTER TABLE `journal`
  ADD CONSTRAINT `journal_ibfk_1` FOREIGN KEY (`publishingHouse_id`) REFERENCES `publishinghouse` (`publishingHouse_id`);

--
-- Constraints der Tabelle `journal_subjectarea`
--
ALTER TABLE `journal_subjectarea`
  ADD CONSTRAINT `journal_subjectarea_ibfk_1` FOREIGN KEY (`journal_id`) REFERENCES `journal` (`journal_id`),
  ADD CONSTRAINT `journal_subjectarea_ibfk_2` FOREIGN KEY (`subjectArea_id`) REFERENCES `subjectarea` (`subjectArea_id`);

--
-- Constraints der Tabelle `keyword_synonym`
--
ALTER TABLE `keyword_synonym`
  ADD CONSTRAINT `keyword_synonym_ibfk_1` FOREIGN KEY (`keyword_id`) REFERENCES `keyword` (`keyword_id`),
  ADD CONSTRAINT `keyword_synonym_ibfk_2` FOREIGN KEY (`synonym_id`) REFERENCES `keyword` (`keyword_id`);

--
-- Constraints der Tabelle `loan`
--
ALTER TABLE `loan`
  ADD CONSTRAINT `loan_ibfk_1` FOREIGN KEY (`physicalBook_id`) REFERENCES `physicalbook` (`physicalBook_id`),
  ADD CONSTRAINT `loan_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `loan_ibfk_3` FOREIGN KEY (`responsible_for_loan`) REFERENCES `employee` (`employee_id`),
  ADD CONSTRAINT `loan_ibfk_4` FOREIGN KEY (`responsible_for_return`) REFERENCES `employee` (`employee_id`);

--
-- Constraints der Tabelle `physicalbook`
--
ALTER TABLE `physicalbook`
  ADD CONSTRAINT `physicalbook_ibfk_1` FOREIGN KEY (`isbn`) REFERENCES `book` (`isbn`),
  ADD CONSTRAINT `physicalbook_ibfk_2` FOREIGN KEY (`shelf_id`) REFERENCES `shelf` (`shelf_id`);

--
-- Constraints der Tabelle `publishedissue`
--
ALTER TABLE `publishedissue`
  ADD CONSTRAINT `publishedissue_ibfk_1` FOREIGN KEY (`journal_id`) REFERENCES `journal` (`journal_id`);

--
-- Constraints der Tabelle `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`physicalBook_id`) REFERENCES `physicalbook` (`physicalBook_id`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`loan_id`) REFERENCES `loan` (`loan_id`);

--
-- Constraints der Tabelle `shelf`
--
ALTER TABLE `shelf`
  ADD CONSTRAINT `shelf_ibfk_1` FOREIGN KEY (`subjectArea_id`) REFERENCES `subjectarea` (`subjectArea_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
