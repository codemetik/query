-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Nov 2022 pada 07.24
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
-- Database: `penjualan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(20) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `Qty` int(11) DEFAULT NULL,
  `id_supplier` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `harga`, `Qty`, `id_supplier`) VALUES
(1, 'Baju', 45000, 9, 1),
(2, 'Kemeja', 80000, 16, 1),
(3, 'Kaos Oblong', 35000, 30, 1),
(4, 'Celana', 130000, 8, 1),
(5, 'Jaket', 160000, 40, 1),
(6, 'Sweater', 180000, 20, 1),
(7, 'Kaos Kaki', 5000, 50, 1),
(8, 'Jeans', 250000, 50, 1),
(9, 'Topi', 23000, 10, 2),
(10, 'Sepatu', 170000, 30, 2),
(11, 'Sarung', 85000, 10, 2),
(12, 'Celana Pendek', 30000, 20, 2),
(13, 'Sajadah', 23500, 20, 2),
(14, 'Baju Kokoh', 150000, 23, 2),
(78, 'Hp Samsung', 3500000, 4, 3),
(79, 'HP Oppo', 3400000, 3, 3),
(80, 'Hp Vivo', 2300000, 5, 3),
(81, 'Hp Xiaomi', 4100000, 4, 3),
(82, 'HP Infinix', 1500000, 2, 3),
(83, 'Laptop Samsing', 3700000, 10, 3);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `faktur_transaksi`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `faktur_transaksi` (
`id_transaksi` int(11)
,`id_barang` int(11)
,`id_pelanggan` int(11)
,`nama_barang` varchar(20)
,`harga` varchar(18)
,`Qty` int(11)
,`jumlah` varchar(30)
,`total_bayar` varchar(18)
,`kembali` varchar(30)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `notifikasi`
--

CREATE TABLE `notifikasi` (
  `notif` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `isi_pesan` varchar(100) DEFAULT NULL,
  `Qty_sebelum` int(11) DEFAULT NULL,
  `Qty_sesudah` int(11) DEFAULT NULL,
  `tgl_notif` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama_pelanggan` varchar(30) NOT NULL,
  `jk` char(1) NOT NULL,
  `no_telp` char(14) NOT NULL,
  `alamat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama_pelanggan`, `jk`, `no_telp`, `alamat`) VALUES
(1, 'samsul', 'L', '089898989876', 'Kalirandu'),
(2, 'Dudun', 'L', '085865543212', 'Sirandu'),
(3, 'Sriwil', 'P', '085877889987', 'Keboijo'),
(4, 'Danil', 'L', '086898889898', 'Bulu'),
(5, 'Dewi', 'L', '089645678998', 'Loning');

-- --------------------------------------------------------

--
-- Struktur dari tabel `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` int(11) NOT NULL,
  `nama_supplier` varchar(30) NOT NULL,
  `no_telp` char(13) NOT NULL,
  `alamat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `nama_supplier`, `no_telp`, `alamat`) VALUES
(1, 'Indra', '089647777877', 'Pemalang'),
(2, 'Erix', '085866778876', 'Semarang'),
(3, 'Dini', '089646755443', 'Jogja');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `Qty` int(11) DEFAULT NULL,
  `total_bayar` int(11) DEFAULT NULL,
  `tanggal` date NOT NULL,
  `keterangan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_barang`, `id_pelanggan`, `Qty`, `total_bayar`, `tanggal`, `keterangan`) VALUES
(9, 1, 2, 1, 50000, '2022-11-16', 'Pakaian'),
(11, 2, 3, 2, 200000, '2022-11-01', 'Atasan'),
(12, 4, 4, 2, 300000, '2022-11-17', 'Untuk sekolah');

--
-- Trigger `transaksi`
--
DELIMITER $$
CREATE TRIGGER `kurangi_qty_barang` AFTER INSERT ON `transaksi` FOR EACH ROW BEGIN
	update barang set Qty = Qty - new.Qty where id_barang = new.id_barang;
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur untuk view `faktur_transaksi`
--
DROP TABLE IF EXISTS `faktur_transaksi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `faktur_transaksi`  AS   (select `y`.`id_transaksi` AS `id_transaksi`,`x`.`id_barang` AS `id_barang`,`y`.`id_pelanggan` AS `id_pelanggan`,`x`.`nama_barang` AS `nama_barang`,concat('Rp. ',format(round(`x`.`harga`,0),0)) AS `harga`,`y`.`Qty` AS `Qty`,concat('Rp. ',format(round(`x`.`harga` * `y`.`Qty`,0),0)) AS `jumlah`,concat('Rp. ',format(round(`y`.`total_bayar`,0),0)) AS `total_bayar`,concat('Rp. ',format(round(`y`.`total_bayar` - `x`.`harga` * `y`.`Qty`,0),0)) AS `kembali` from (`barang` `x` join `transaksi` `y` on(`y`.`id_barang` = `x`.`id_barang`)))  ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `id_supplier` (`id_supplier`);

--
-- Indeks untuk tabel `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD PRIMARY KEY (`notif`),
  ADD KEY `id_transaksi` (`id_barang`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_pembeli` (`id_pelanggan`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `barang`
--
ALTER TABLE `barang`
  MODIFY `id_barang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT untuk tabel `notifikasi`
--
ALTER TABLE `notifikasi`
  MODIFY `notif` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_supplier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `supplier`
--
ALTER TABLE `supplier`
  ADD CONSTRAINT `supplier_ibfk_1` FOREIGN KEY (`id_supplier`) REFERENCES `barang` (`id_supplier`);

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
