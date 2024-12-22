nilaiphpmyadmin-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Des 2024 pada 17.32
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fire_detection_system`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `sensor_readings`
--

CREATE TABLE `sensor_readings` (
  `id` int(11) NOT NULL,
  `temperature` float NOT NULL,
  `humidity` float NOT NULL,
  `smoke_level` float NOT NULL,
  `co_level` float NOT NULL,
  `timestamp` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `sensor_readings`
--

INSERT INTO `sensor_readings` (`id`, `temperature`, `humidity`, `smoke_level`, `co_level`, `timestamp`) VALUES
(1, 35.5, 45, 2.1, 0.8, '2024-12-10 23:02:16'),
(2, 40, 30.5, 3.4, 1.2, '2024-12-10 23:02:16'),
(3, 50.2, 20, 5, 2.5, '2024-12-10 23:02:16'),
(4, 37.68, 19.8, 4.74, 1.61, '2024-12-10 23:08:56'),
(5, 32.66, 30.72, 7.22, 0.43, '2024-12-10 23:09:08'),
(6, 39.36, 16.07, 4.58, 1.07, '2024-12-10 23:09:20'),
(7, 48.02, 49.05, 1.82, 3.33, '2024-12-10 23:09:33'),
(8, 39.21, 10.61, 3.14, 2.87, '2024-12-10 23:09:45');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `sensor_readings`
--
ALTER TABLE `sensor_readings`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `sensor_readings`
--
ALTER TABLE `sensor_readings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
