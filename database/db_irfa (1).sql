-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Nov 2022 pada 07.29
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_irfa`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_guru`
--

CREATE TABLE `tb_guru` (
  `NIPY` char(10) NOT NULL,
  `Nama_guru` char(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_guru`
--

INSERT INTO `tb_guru` (`NIPY`, `Nama_guru`) VALUES
('3212008004', 'Eka Nurhayati'),
('3212009006', 'Yandi Pirmansyah'),
('3212010010', 'Resti Linuwih'),
('3212016017', 'Bagus Adi Prasetyo'),
('3212020019', 'Muhammad Ardianto'),
('3212020202', 'Muhammad Irfa Nufaiyal Kharish'),
('3212022020', 'AFIYATURRAHMAH');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jurusan`
--

CREATE TABLE `tb_jurusan` (
  `kode_jr` char(10) NOT NULL,
  `jurusan` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_jurusan`
--

INSERT INTO `tb_jurusan` (`kode_jr`, `jurusan`) VALUES
('kd01', 'TKRO'),
('kd03', 'TPMI'),
('kd04', 'RPL'),
('kd05', 'TAV');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_mapel`
--

CREATE TABLE `tb_mapel` (
  `nop` char(10) NOT NULL,
  `mapel` varchar(50) DEFAULT NULL,
  `nipy_guru` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_mapel`
--

INSERT INTO `tb_mapel` (`nop`, `mapel`, `nipy_guru`) VALUES
('01', 'Pemrograman Web', '3212020019'),
('02', 'Pemrograman Berorientasi Objek', '3212016017'),
('03', 'Pemrograman Perangkat Lunak', '3212016017'),
('04', 'Matematika', '3212008004'),
('05', 'Bahasa Jawa', '3212010010'),
('06', 'Informatika', '3212009006'),
('07', 'Basis Data', '3212020202'),
('08', 'DDPPL', '3212022020');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_siswa`
--

CREATE TABLE `tb_siswa` (
  `NISN` char(10) NOT NULL,
  `kode_jr` char(5) NOT NULL,
  `Nama` char(30) DEFAULT NULL,
  `Tgl_lahir` date DEFAULT NULL,
  `Alamat` varchar(100) DEFAULT NULL,
  `Jenis_kelamin` enum('L','W') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_siswa`
--

INSERT INTO `tb_siswa` (`NISN`, `kode_jr`, `Nama`, `Tgl_lahir`, `Alamat`, `Jenis_kelamin`) VALUES
('200000', 'KD05', 'DARUL', '2007-03-11', 'Taman', 'L'),
('204798\r\n', 'KD03', 'ABDUL MALIK KARIM AMRULLAH\r\n', '2006-11-04', 'Petarukan', 'L'),
('204804\r\n', 'KD03', 'ADNAN ISTAADI\r\n', '2005-07-01', 'Petarukan', 'L'),
('302678\r\n', 'KD01', 'ADITYA PRATAMA\r\n', '2007-08-04', 'Petarukan', 'L'),
('302726\r\n', 'KD01', 'AHMAD MAMNUN\r\n', '2005-07-01', 'Petarukan', 'L'),
('400211', 'KD04', 'AFISKA ALFERA FEBIA', '2006-02-13', 'Petarukan', 'L'),
('400213', 'KD04', 'AHMAD KHOTIBUL UMAM', '2007-01-01', 'Petarukan', 'L'),
('400214', 'KD04', 'AJENG ALEYA SUFA MAARIF', '2006-03-18', 'Petarukan', 'W'),
('400215', 'KD04', 'AKSAL JILHAMSAH', '2005-06-17', 'Petarukan', 'L'),
('400216', 'KD04', 'ALFIN REHAN RAMADHANI\r\n', '2005-02-13', 'Petarukan', 'L'),
('400253', 'KD04', 'AMELIANA PUTRI\r\n', '2005-02-13', 'Desa Bulu', 'W');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_soal`
--

CREATE TABLE `tb_soal` (
  `NISN` char(10) NOT NULL,
  `nama` varchar(10) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `alamat` varchar(10) DEFAULT NULL,
  `gender` enum('L','W') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_soal`
--

INSERT INTO `tb_soal` (`NISN`, `nama`, `tgl_lahir`, `alamat`, `gender`) VALUES
('2022', 'Syukur', '2022-11-11', 'Pemalang', '');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_guru`
--
ALTER TABLE `tb_guru`
  ADD PRIMARY KEY (`NIPY`);

--
-- Indeks untuk tabel `tb_jurusan`
--
ALTER TABLE `tb_jurusan`
  ADD PRIMARY KEY (`kode_jr`);

--
-- Indeks untuk tabel `tb_mapel`
--
ALTER TABLE `tb_mapel`
  ADD PRIMARY KEY (`nop`),
  ADD KEY `nipy_guru` (`nipy_guru`);

--
-- Indeks untuk tabel `tb_siswa`
--
ALTER TABLE `tb_siswa`
  ADD PRIMARY KEY (`NISN`),
  ADD KEY `tb_siswa_ibfk_1` (`kode_jr`);

--
-- Indeks untuk tabel `tb_soal`
--
ALTER TABLE `tb_soal`
  ADD PRIMARY KEY (`NISN`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_mapel`
--
ALTER TABLE `tb_mapel`
  ADD CONSTRAINT `tb_mapel_ibfk_1` FOREIGN KEY (`nipy_guru`) REFERENCES `tb_guru` (`NIPY`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_siswa`
--
ALTER TABLE `tb_siswa`
  ADD CONSTRAINT `tb_siswa_ibfk_1` FOREIGN KEY (`kode_jr`) REFERENCES `tb_jurusan` (`kode_jr`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
