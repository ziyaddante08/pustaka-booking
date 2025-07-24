-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 24 Jul 2025 pada 06.08
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
-- Database: `pustaka`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `booking`
--

CREATE TABLE `booking` (
  `id_booking` varchar(12) CHARACTER SET latin1 NOT NULL,
  `tgl_booking` date NOT NULL,
  `batas_ambil` date NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `booking_detail`
--

CREATE TABLE `booking_detail` (
  `id` int(11) NOT NULL,
  `id_booking` varchar(12) CHARACTER SET latin1 NOT NULL,
  `id_buku` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `buku`
--

CREATE TABLE `buku` (
  `id` int(11) NOT NULL,
  `judul_buku` varchar(128) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `pengarang` varchar(64) NOT NULL,
  `penerbit` varchar(64) NOT NULL,
  `tahun_terbit` year(4) NOT NULL,
  `isbn` varchar(64) NOT NULL,
  `stok` int(11) NOT NULL,
  `dipinjam` int(11) NOT NULL,
  `dibooking` int(11) NOT NULL,
  `image` varchar(256) DEFAULT 'book-default-cover.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `buku`
--

INSERT INTO `buku` (`id`, `judul_buku`, `id_kategori`, `pengarang`, `penerbit`, `tahun_terbit`, `isbn`, `stok`, `dipinjam`, `dibooking`, `image`) VALUES
(1, 'Statistika dengan Program Komputer', 1, 'Ahmad Kholiqul Amin', 'Deep Publish', 2014, '9786022809432', 25, 0, 8, 'img1557402455.jpg'),
(2, 'Mudah Belajar Komputer untuk Anak', 1, 'Bambang Agus Setiawan', 'Huta Media', 2014, '9786025118500', 24, 0, 5, 'img1557402397.jpg'),
(5, 'PHP Komplet', 1, 'Jubilee', 'Elex Media Komputindo', 2017, '8346753547', 22, 0, 3, 'img1555522493.jpg'),
(10, 'Detektif Conan Ep 200', 9, 'Okigawa sasuke', 'Cultura', 2016, '874387583987', 17, 0, 0, 'img1557401465.jpg'),
(14, 'Bahasa Indonesia', 2, 'Umri Nur\'aini dan Indriyani', 'Pusat Perbukuan', 2015, '757254724884', 3, 0, 0, 'img1557402703.jpg'),
(15, 'Komunikasi Lintas Budaya', 5, 'Dr. Dedy Kurnia', 'Published', 2015, '878674646488', 5, 0, 0, 'img1557403156.jpg'),
(16, 'Kolaborasi Codeigniter dan Ajax dalam Perancangan CMS', 1, 'Anton Subagia', 'Elex Media komputindo', 2017, '43345356577', 4, 0, 1, 'img1557403502.jpg'),
(17, 'From Hobby to Money', 4, 'Deasylawati', 'Elex Media Komputindo', 2015, '87968686787879', 5, 0, 0, 'img1557403658.jpg'),
(18, 'Buku Saku Pramuka', 8, 'Rudi Himawan', 'Pusat Perbukuan', 2016, '97868687978796', 5, 0, 1, 'img1557404613.jpg'),
(20, 'Buku Pintar Puasa Wajib dan Sunnah Sepanjang Masa', 7, 'Ali Hasan', 'Luxima', 2011, '32342342344234', 6, 0, -1, 'img1557404775.jpg'),
(21, 'Aspek Hukum dalam Penelitian', 6, 'Rianto Adi', 'Buku Obor', 2015, '7565646455757', 4, 0, 1, 'img1557404853.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_pinjam`
--

CREATE TABLE `detail_pinjam` (
  `no_pinjam` varchar(12) NOT NULL,
  `id_buku` int(11) NOT NULL,
  `denda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `detail_pinjam`
--

INSERT INTO `detail_pinjam` (`no_pinjam`, `id_buku`, `denda`) VALUES
('06122024002', 20, 5000),
('06122024003', 10, 5000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `kategori` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id`, `kategori`) VALUES
(1, 'Komputer'),
(2, 'Bahasa'),
(3, 'Sains'),
(4, 'Hobby'),
(5, 'Komunikasi'),
(6, 'Hukum'),
(7, 'Agama'),
(8, 'Populer'),
(9, 'Komik');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `menu` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `menu`
--

INSERT INTO `menu` (`id`, `menu`) VALUES
(1, 'Admin'),
(2, 'User'),
(3, 'Menu'),
(4, 'Utility'),
(5, 'Buku'),
(6, 'Anggota'),
(7, 'Laporan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pinjam`
--

CREATE TABLE `pinjam` (
  `no_pinjam` varchar(12) NOT NULL,
  `tgl_pinjam` date NOT NULL,
  `id_booking` varchar(12) NOT NULL,
  `id_user` int(11) NOT NULL,
  `tgl_kembali` date NOT NULL,
  `tgl_pengembalian` date NOT NULL,
  `status` enum('pinjam','kembali') NOT NULL,
  `total_denda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pinjam`
--

INSERT INTO `pinjam` (`no_pinjam`, `tgl_pinjam`, `id_booking`, `id_user`, `tgl_kembali`, `tgl_pengembalian`, `status`, `total_denda`) VALUES
('06122024001', '2024-12-06', '06122024001', 1, '2024-12-09', '0000-00-00', 'pinjam', 0),
('06122024002', '2024-12-06', '06122024001', 1, '2024-12-09', '2024-12-06', 'kembali', 0),
('06122024003', '2024-12-06', '06122024001', 1, '2024-12-09', '2024-12-06', 'kembali', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `role` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `role`
--

INSERT INTO `role` (`id`, `role`) VALUES
(1, 'admministrator'),
(2, 'member');

-- --------------------------------------------------------

--
-- Struktur dari tabel `temp`
--

CREATE TABLE `temp` (
  `id` int(11) NOT NULL,
  `tgl_booking` datetime DEFAULT NULL,
  `id_user` varchar(12) CHARACTER SET latin1 NOT NULL,
  `email_user` varchar(128) CHARACTER SET latin1 DEFAULT NULL,
  `id_buku` int(11) DEFAULT NULL,
  `judul_buku` varchar(255) CHARACTER SET latin1 NOT NULL,
  `image` varchar(255) CHARACTER SET latin1 NOT NULL,
  `penulis` varchar(128) CHARACTER SET latin1 NOT NULL,
  `penerbit` varchar(128) CHARACTER SET latin1 NOT NULL,
  `tahun_terbit` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nama` varchar(128) NOT NULL,
  `alamat` text NOT NULL,
  `email` varchar(128) NOT NULL,
  `image` varchar(128) NOT NULL,
  `password` varchar(256) NOT NULL,
  `role_id` int(11) NOT NULL,
  `is_active` int(1) NOT NULL,
  `tanggal_input` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`id`, `nama`, `alamat`, `email`, `image`, `password`, `role_id`, `is_active`, `tanggal_input`) VALUES
(37, 'admin', '', 'admin@gmail.com', 'default.jpg', '$2y$10$1TXySiQPbbky/P1w/VqO6eor7yOj72bvkAyHbI.0U2XCTXPF3D7Ny', 2, 1, 1753329799),
(38, 'ziyad', 'jakarta', 'pelanggan@gmail.com', 'default.jpg', '$2y$10$RKzTIQmRzhBVkS4cv/J5xO5yFVg.iLyoIjOcb59zCHETcAI7eFhnu', 1, 1, 1753329903);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id_booking`);

--
-- Indeks untuk tabel `booking_detail`
--
ALTER TABLE `booking_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pinjam`
--
ALTER TABLE `pinjam`
  ADD PRIMARY KEY (`no_pinjam`);

--
-- Indeks untuk tabel `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `temp`
--
ALTER TABLE `temp`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `booking_detail`
--
ALTER TABLE `booking_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `buku`
--
ALTER TABLE `buku`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `temp`
--
ALTER TABLE `temp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
