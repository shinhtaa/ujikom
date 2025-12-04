-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 03 Des 2025 pada 02.42
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `simbs`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `id_buku` int(11) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `penulis` varchar(50) NOT NULL,
  `deskripsi` text NOT NULL,
  `tahun_terbit` year(4) DEFAULT NULL,
  `id_kategori` int(11) DEFAULT NULL,
  `gambar` varchar(50) DEFAULT NULL,
  `tanggal_input` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`id_buku`, `judul`, `penulis`, `deskripsi`, `tahun_terbit`, `id_kategori`, `gambar`, `tanggal_input`) VALUES
(1, 'Sapiens: A Brief History of Humankind', 'Yuval Noah Harari', 'Menjelaskan bagaimana spesies Homo sapiens berevolusi dari pemburu-pengumpul hingga menjadi penguasa planet, menyoroti revolusi kognitif, agrikultural, dan ilmiah.', 1999, 1, 'sapiens.jpg', '2025-08-06 17:00:00'),
(2, 'Harry Potter dan Batu Bertuah', 'J.K. Rowling', 'Kisah seorang anak yatim piatu bernama Harry Potter yang menemukan bahwa ia adalah penyihir dan dikirim untuk bersekolah di Sekolah Sihir Hogwarts.', 1997, 2, 'harry.jpg', '2025-02-12 17:00:00'),
(3, 'Life of Pi', 'Yann Martel', 'Cerita tentang seorang remaja India bernama Pi Patel yang selamat dari bangkai kapal dan terdampar di lautan Pasifik bersama seekor harimau Bengal dewasa.', 2001, 3, 'life.webp', '2025-01-01 17:00:00'),
(4, 'Sherlock Holmes: A Study in Scarlet', 'Sir Arthur Conan Doyle', 'Kasus pertama yang mempertemukan Dr. John Watson dengan detektif. Kasus pertama yang mempertemukan Dr. John Watson dengan detektif brilian namun eksentrik, Sherlock Holmes, yang harus memecahkan kasus pembunuhan misterius di London.', 1990, 4, 'sherlock.jpg', '2025-11-03 17:00:00'),
(6, 'Pride and Prejudice', 'Jane Austen', 'Mengisahkan tentang kehidupan keluarga Bennet di Inggris dan hubungan yang rumit, penuh kesalahpahaman, antara Elizabeth Bennet yang cerdas dan tuan tanah kaya, Mr. Darcy.', 1996, 6, 'pride.png', '2025-04-21 17:00:00'),
(10, 'Love on the Second Read', 'Mica De Leon', 'Novel ini berpusat pada Emma Morales, seorang editor buku romansa yang bangga menjadi penyayang kucing, dan Kip Alegre, editor fantasi dan fiksi ilmiah kutu buku. Mereka terlibat dalam persaingan literatur yang ramah namun genit sejak hari pertama Emma bekerja.', 2024, 6, 'Love on the Second Read_Mica De Leon.jpg', '2025-11-28 10:36:18'),
(11, 'Romansa Kota Bandung', 'Kezia Olivia', 'Novel ini menceritakan kisah asmara Kamila Furi di Kota Bandung. Ceritanya berfokus pada pertemuannya dengan seorang laki-laki bernama Prameswara Kito saat menjadi panitia ospek di SMA. Meskipun ada rumor negatif tentang Prameswara, Kamila tetap mencintainya. Novel ini menggambarkan perjalanan asmara Kamila di SMA, termasuk berbagai pengalaman dengan laki-laki lain sebelum ia bertemu Prameswara. ', 2022, 6, 'Romansa Kota Bandung_Kezia Olivia.jpg', '2025-11-28 10:38:10'),
(12, 'Seleksi Masuk Osamu Dazai', 'Kafka Asagiri', 'Novel ringan ini berfungsi sebagai prekuel, menceritakan kisah tentang bagaimana Osamu Dazai bergabung dengan Agensi Detektif Bersenjata. Ceritanya berfokus pada Atsushi Nakajima, seorang pemuda putus asa yang diusir dari panti asuhan, yang menyelamatkan seorang pria aneh bernama Osamu Dazai dari upaya bunuh diri. Dazai ternyata adalah bagian dari agen detektif yang diisi oleh individu dengan kekuatan supranatural yang berhubungan dengan sastra.', 2022, 8, 'Seleksi Masuk Osamu Dazai_Kafka Asagiri.jpg', '2025-11-28 23:55:21'),
(14, 'Haikyu!! Fly High! Volleyball! ', 'Haruichi Furudate', 'Manga olahraga ini berfokus pada Shoyo Hinata, seorang siswa kecil dengan mimpi besar menjadi pemain voli hebat. Setelah tim sekolah menengahnya dikalahkan oleh pemain jenius Tobio Kageyama, Hinata bersumpah untuk membalas dendam. Dia bergabung dengan SMA Karasuno, hanya untuk menemukan bahwa Kageyama juga bergabung dengan tim yang sama. Ceritanya mengeksplorasi perjuangan pribadi, dinamika tim, dan semangat pantang menyerah. ', 2012, 7, 'Haikyu!! Fly High! Volleyball! _7.jpg', '2025-11-29 00:08:43'),
(15, 'The Trouble With Perfect', 'Helena Duggan', 'Hal-hal aneh terjadi di Kota Perfect yang seharusnya aman dan tenteramâ€”barang-barang dicuri, bahkan anak-anak pun menghilang. Semua orang menuduh Boy sebagai pelakunya. Violet, sahabat Boy, tentu saja tidak langsung percaya. Namun, banyak saksi mata yang melihat Boy. ', 2021, 2, 'The Trouble With Perfect_Helena Duggan.jpg', '2025-11-29 00:15:14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL,
  `tanggal_input` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`, `tanggal_input`) VALUES
(1, 'Sejarah', '2025-11-17 04:52:07'),
(2, 'Fantasi', '2025-11-26 04:52:07'),
(3, 'Petualangan', '2025-11-03 04:52:07'),
(4, 'Detektif & Misteri', '2025-11-01 04:52:07'),
(5, 'Horror', '2025-10-26 04:52:07'),
(6, 'Romansa', '2025-09-01 04:52:07'),
(7, 'Komik', '2025-03-11 23:52:41'),
(8, 'Light Novel', '2025-11-28 23:53:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id_user`, `username`, `email`, `password`) VALUES
(4, '1delapan', 'delapan@gmail.com', '$2y$10$1inso1a5Z4ccNzk/IcIjG.b7oi0jfaWDkZbG3JOdGNHUrvHhNJ7OK'),
(9, 'shinta', 'delapan@gmail.com', '$2y$10$TtGAZNy6mwYhscDtxPpteO2YybyzM9xCJReQFjyHkPY3ZENmXn.02'),
(10, 'koko', 'koko@gmail.com', '$2y$10$MDj2m.uaF6aBsq6v1as7T.l1TQ.8zvoryJKvi3sL.95CpK7.G750G'),
(12, 'fadhil', 'fadhil@gmail.com', '$2y$10$e.TBLFekB2KlvYPfMfm71OvVbI1u9odyri/3t0TmDqJDh89pV9byu'),
(13, 'sofia', 'sofia@gmail.com', '$2y$10$iYZfkqooN3Lvi//7p30JXuwZkO1RdzJcdsq6QTxb7NYlTwtGSk7Yq');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`),
  ADD KEY `fk_id_kategori` (`id_kategori`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `buku`
--
ALTER TABLE `buku`
  MODIFY `id_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD CONSTRAINT `fk_id_kategori` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
