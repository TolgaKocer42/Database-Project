-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 06 May 2024, 04:45:24
-- Sunucu sürümü: 10.4.32-MariaDB
-- PHP Sürümü: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `doviz_otomasyon`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cuzdan`
--

CREATE TABLE `cuzdan` (
  `cuzdan_id` int(11) NOT NULL,
  `islem_id_fk` int(11) DEFAULT NULL,
  `kullanici_id_fk` int(11) DEFAULT NULL,
  `kart_id_fk` int(11) DEFAULT NULL,
  `bakiye` float DEFAULT 0,
  `toplam_islem_mik` float DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `doviz`
--

CREATE TABLE `doviz` (
  `doviz_id` int(11) NOT NULL,
  `doviz_kod` varchar(3) DEFAULT NULL,
  `doviz_alis` decimal(10,4) DEFAULT NULL,
  `doviz_satis` decimal(10,4) DEFAULT NULL,
  `doviz_tarih` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `doviz`
--

INSERT INTO `doviz` (`doviz_id`, `doviz_kod`, `doviz_alis`, `doviz_satis`, `doviz_tarih`) VALUES
(1, 'USD', 32.3350, 32.3400, '2024-05-04 15:56:58'),
(2, 'EUR', 34.7427, 34.8790, '2024-05-04 15:56:58'),
(3, 'GBP', 40.5131, 40.6534, '2024-05-04 15:56:58'),
(4, 'CHF', 35.7174, 35.7427, '2024-05-04 15:56:58'),
(5, 'CAD', 23.6212, 23.6328, '2024-05-04 15:56:58'),
(6, 'RUB', 0.3526, 0.3530, '2024-05-04 15:56:58'),
(7, 'AED', 8.8023, 8.8057, '2024-05-04 15:56:58'),
(8, 'AUD', 21.3622, 21.3826, '2024-05-04 15:56:58'),
(9, 'DKK', 4.6648, 4.6675, '2024-05-04 15:56:58'),
(10, 'SEK', 2.9863, 2.9915, '2024-05-04 15:56:58'),
(11, 'NOK', 2.9715, 2.9779, '2024-05-04 15:56:58'),
(12, 'JPY', 21.1100, 21.2300, '2024-05-04 15:56:58'),
(13, 'KWD', 104.9555, 105.4579, '2024-05-04 15:56:58'),
(14, 'ZAR', 1.7468, 1.7487, '2024-05-04 15:56:58'),
(15, 'BHD', 85.7715, 85.7848, '2024-05-04 15:56:58'),
(16, 'LYD', 6.6328, 6.6338, '2024-05-04 15:56:58'),
(17, 'SAR', 8.6152, 8.6286, '2024-05-04 15:56:58'),
(18, 'IQD', 0.0247, 0.0247, '2024-05-04 15:56:58'),
(19, 'ILS', 8.7192, 8.7205, '2024-05-04 15:56:58');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `islem`
--

CREATE TABLE `islem` (
  `islem_id` int(11) NOT NULL,
  `doviz_id_fk` int(11) DEFAULT NULL,
  `islem_tarihi` datetime DEFAULT NULL,
  `islem_miktari` float DEFAULT NULL,
  `islem_sonucu` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kart`
--

CREATE TABLE `kart` (
  `kart_id` int(11) NOT NULL,
  `kart_no` varchar(16) DEFAULT NULL,
  `kart_tarih` varchar(4) DEFAULT NULL,
  `kart_cvc` int(3) DEFAULT NULL,
  `cuzdan_id_fk` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kullanici`
--

CREATE TABLE `kullanici` (
  `kullanici_id` int(11) NOT NULL,
  `kullanici_adi` varchar(100) NOT NULL,
  `kullanici_soyadi` varchar(100) NOT NULL,
  `kullanici_email` varchar(100) NOT NULL,
  `kullanici_tel` bigint(11) NOT NULL,
  `kullanici_sifre` varchar(60) NOT NULL,
  `kayit_tarihi` datetime NOT NULL DEFAULT current_timestamp(),
  `cuzdan_id_fk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `kullanici`
--

INSERT INTO `kullanici` (`kullanici_id`, `kullanici_adi`, `kullanici_soyadi`, `kullanici_email`, `kullanici_tel`, `kullanici_sifre`, `kayit_tarihi`, `cuzdan_id_fk`) VALUES
(0, 'asdas', 'asd', 'asd@gmail.com', 5557778899, '$2y$12$W7XV2JcbdM/ZAoaxJSoFqeqXgXVKbVW1o9rv5LHKxTUYrZy.ZBO6e', '2024-05-06 05:11:56', NULL),
(17, 'Tolga', 'Boz', 'tolgaboz@gmail.com', 5554443322, '$2y$12$jJBuJWZtZUO5OTRuci3MCuEsjwg2PPvav2B2xZ6zmy8GBlWN3bEW.', '2024-05-03 13:27:15', NULL),
(18, 'Alperen', 'Ovalı', 'alperen@gmail.com', 5527773333, '$2y$12$BsCcP.cp1Q0beabkjqt1GeyJA7HUi.R24cVI7yju75Pl6wMHVEcha', '2024-05-04 12:33:07', NULL),
(19, 'Mahmut', 'Murteza', 'mahmut@gmail.com', 5527773334, '$2y$12$OupkFg2xxQa38vNXk56QaObGxoCwpZzMe/Eaz3jgUH0Sa/vMs1TI6', '2024-05-04 14:31:34', NULL),
(20, 'hüsnü', 'koçer', 'husnu@gmail.com', 1112223322, '$2y$12$JC2/s9EXAlIxD11.SWMKYOAQvpNeBLgtF4H6wNRmmdP0t8LqB3lPm', '2024-05-04 14:34:30', NULL);

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `cuzdan`
--
ALTER TABLE `cuzdan`
  ADD PRIMARY KEY (`cuzdan_id`),
  ADD KEY `kullanici_id_fk` (`kullanici_id_fk`),
  ADD KEY `islem_id_fk` (`islem_id_fk`),
  ADD KEY `kart_id_fk` (`kart_id_fk`);

--
-- Tablo için indeksler `doviz`
--
ALTER TABLE `doviz`
  ADD PRIMARY KEY (`doviz_id`);

--
-- Tablo için indeksler `islem`
--
ALTER TABLE `islem`
  ADD PRIMARY KEY (`islem_id`),
  ADD KEY `doviz_id_fk` (`doviz_id_fk`);

--
-- Tablo için indeksler `kart`
--
ALTER TABLE `kart`
  ADD PRIMARY KEY (`kart_id`),
  ADD KEY `cuzdan_id_fk` (`cuzdan_id_fk`);

--
-- Tablo için indeksler `kullanici`
--
ALTER TABLE `kullanici`
  ADD PRIMARY KEY (`kullanici_id`),
  ADD KEY `cuzdan_id_fk` (`cuzdan_id_fk`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `cuzdan`
--
ALTER TABLE `cuzdan`
  MODIFY `cuzdan_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `doviz`
--
ALTER TABLE `doviz`
  MODIFY `doviz_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=550;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
