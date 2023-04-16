-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Apr 2023 pada 05.25
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `akuntansi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_barang`
--

CREATE TABLE `tabel_barang` (
  `id_barang` varchar(10) NOT NULL,
  `nama_barang` varchar(20) NOT NULL,
  `harga_beli` int(10) NOT NULL,
  `harga_jual` int(10) NOT NULL,
  `stok` int(5) NOT NULL,
  `id_supplier` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_biaya`
--

CREATE TABLE `tabel_biaya` (
  `id_biaya` varchar(10) NOT NULL,
  `tanggal_biaya` date NOT NULL,
  `jenis_biaya` varchar(20) NOT NULL,
  `jumlah_biaya` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_buku_besar`
--

CREATE TABLE `tabel_buku_besar` (
  `id_buku_besar` varchar(10) NOT NULL,
  `id_kas_dan_bank` varchar(10) NOT NULL,
  `id_detail_transaksi_pembelian` varchar(10) NOT NULL,
  `id_detail_transaksi_penjualan` varchar(10) NOT NULL,
  `id_biaya` varchar(10) NOT NULL,
  `id_pegawai` varchar(10) NOT NULL,
  `id_pengeluaran` varchar(10) NOT NULL,
  `kredit` int(15) NOT NULL,
  `debit` int(15) NOT NULL,
  `saldo_kredit` int(15) NOT NULL,
  `saldo_debit` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_customer`
--

CREATE TABLE `tabel_customer` (
  `id_customer` varchar(10) NOT NULL,
  `nama_customer` varchar(30) NOT NULL,
  `id_pengguna` varchar(10) NOT NULL,
  `alamat` varchar(20) NOT NULL,
  `kota` varchar(20) NOT NULL,
  `no_tlp` varchar(13) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_detail_transaksi_pembelian`
--

CREATE TABLE `tabel_detail_transaksi_pembelian` (
  `id_detail_transaksi_pembelian` varchar(10) NOT NULL,
  `id_transaksi_pembelian` varchar(10) NOT NULL,
  `jumlah` int(10) NOT NULL,
  `total_harga` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_detail_transaksi_penjualan`
--

CREATE TABLE `tabel_detail_transaksi_penjualan` (
  `id_detail_transaksi_penjualan` varchar(10) NOT NULL,
  `id_transaksi_penjualan` varchar(10) NOT NULL,
  `jumlah` int(10) NOT NULL,
  `total_harga` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_invoice`
--

CREATE TABLE `tabel_invoice` (
  `id_invoice` varchar(10) NOT NULL,
  `tanggal_invoice` date NOT NULL,
  `jatuh_tempo` date NOT NULL,
  `total_harga` varchar(20) NOT NULL,
  `id_barang` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_kas_dan_bank`
--

CREATE TABLE `tabel_kas_dan_bank` (
  `id_kas_bank` varchar(10) NOT NULL,
  `tanggal` date NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `debit` int(15) NOT NULL,
  `kredit` int(15) NOT NULL,
  `saldo` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_outlet`
--

CREATE TABLE `tabel_outlet` (
  `id_outlet` varchar(10) NOT NULL,
  `nama_outlet` varchar(20) NOT NULL,
  `alamat` varchar(20) NOT NULL,
  `kota` varchar(20) NOT NULL,
  `no_tlp` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_pegawai`
--

CREATE TABLE `tabel_pegawai` (
  `id_pegawai` varchar(10) NOT NULL,
  `id_pengguna` varchar(10) NOT NULL,
  `nama_pegawai` varchar(30) NOT NULL,
  `alamat` varchar(20) NOT NULL,
  `no_tlp` varchar(13) NOT NULL,
  `email` varchar(50) NOT NULL,
  `gaji` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_pembelian`
--

CREATE TABLE `tabel_pembelian` (
  `id_transaksi_pembelian` varchar(10) NOT NULL,
  `tanggal_transaksi` date NOT NULL,
  `id_invoice` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_pengeluaran`
--

CREATE TABLE `tabel_pengeluaran` (
  `id_pengeluaran` varchar(10) NOT NULL,
  `tanggal_pengeluaran` date NOT NULL,
  `jenis_pengeluaran` varchar(20) NOT NULL,
  `jumlah_pengeluaran` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_pengguna`
--

CREATE TABLE `tabel_pengguna` (
  `id_pengguna` varchar(10) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `nama_lengkap` varchar(30) NOT NULL,
  `alamat` varchar(20) NOT NULL,
  `kota` varchar(20) NOT NULL,
  `kode_pos` varchar(20) NOT NULL,
  `no_tlp` varchar(13) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_penjualan`
--

CREATE TABLE `tabel_penjualan` (
  `id_transaksi_penjualan` varchar(10) NOT NULL,
  `tanggal_transaksi` date NOT NULL,
  `id_customer` varchar(10) NOT NULL,
  `id_outlet` varchar(10) NOT NULL,
  `id_barang` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_report`
--

CREATE TABLE `tabel_report` (
  `id_report` varchar(10) NOT NULL,
  `id_buku_besar` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tabel_supplier`
--

CREATE TABLE `tabel_supplier` (
  `id_supplier` varchar(10) NOT NULL,
  `nama_supplier` varchar(50) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `kota` varchar(20) NOT NULL,
  `no_tlp` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tabel_barang`
--
ALTER TABLE `tabel_barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `id_supplier` (`id_supplier`);

--
-- Indeks untuk tabel `tabel_biaya`
--
ALTER TABLE `tabel_biaya`
  ADD PRIMARY KEY (`id_biaya`);

--
-- Indeks untuk tabel `tabel_buku_besar`
--
ALTER TABLE `tabel_buku_besar`
  ADD PRIMARY KEY (`id_buku_besar`),
  ADD KEY `id_kas_dan_bank` (`id_kas_dan_bank`,`id_detail_transaksi_pembelian`,`id_detail_transaksi_penjualan`,`id_biaya`,`id_pegawai`,`id_pengeluaran`),
  ADD KEY `id_biaya` (`id_biaya`),
  ADD KEY `id_detail_transaksi_penjualan` (`id_detail_transaksi_penjualan`),
  ADD KEY `id_pengeluaran` (`id_pengeluaran`),
  ADD KEY `id_pegawai` (`id_pegawai`),
  ADD KEY `id_detail_transaksi_pembelian` (`id_detail_transaksi_pembelian`);

--
-- Indeks untuk tabel `tabel_customer`
--
ALTER TABLE `tabel_customer`
  ADD PRIMARY KEY (`id_customer`),
  ADD KEY `id_pengguna` (`id_pengguna`);

--
-- Indeks untuk tabel `tabel_detail_transaksi_pembelian`
--
ALTER TABLE `tabel_detail_transaksi_pembelian`
  ADD PRIMARY KEY (`id_detail_transaksi_pembelian`),
  ADD KEY `id_transaksi_pembelian` (`id_transaksi_pembelian`);

--
-- Indeks untuk tabel `tabel_detail_transaksi_penjualan`
--
ALTER TABLE `tabel_detail_transaksi_penjualan`
  ADD PRIMARY KEY (`id_detail_transaksi_penjualan`),
  ADD KEY `id_transaksi_penjualan` (`id_transaksi_penjualan`);

--
-- Indeks untuk tabel `tabel_invoice`
--
ALTER TABLE `tabel_invoice`
  ADD PRIMARY KEY (`id_invoice`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indeks untuk tabel `tabel_kas_dan_bank`
--
ALTER TABLE `tabel_kas_dan_bank`
  ADD PRIMARY KEY (`id_kas_bank`);

--
-- Indeks untuk tabel `tabel_outlet`
--
ALTER TABLE `tabel_outlet`
  ADD PRIMARY KEY (`id_outlet`);

--
-- Indeks untuk tabel `tabel_pegawai`
--
ALTER TABLE `tabel_pegawai`
  ADD PRIMARY KEY (`id_pegawai`),
  ADD KEY `id_pengguna` (`id_pengguna`);

--
-- Indeks untuk tabel `tabel_pembelian`
--
ALTER TABLE `tabel_pembelian`
  ADD PRIMARY KEY (`id_transaksi_pembelian`),
  ADD KEY `id_invoice` (`id_invoice`);

--
-- Indeks untuk tabel `tabel_pengeluaran`
--
ALTER TABLE `tabel_pengeluaran`
  ADD PRIMARY KEY (`id_pengeluaran`);

--
-- Indeks untuk tabel `tabel_pengguna`
--
ALTER TABLE `tabel_pengguna`
  ADD PRIMARY KEY (`id_pengguna`);

--
-- Indeks untuk tabel `tabel_penjualan`
--
ALTER TABLE `tabel_penjualan`
  ADD PRIMARY KEY (`id_transaksi_penjualan`),
  ADD KEY `id_customer` (`id_customer`,`id_outlet`,`id_barang`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_outlet` (`id_outlet`);

--
-- Indeks untuk tabel `tabel_report`
--
ALTER TABLE `tabel_report`
  ADD PRIMARY KEY (`id_report`),
  ADD KEY `id_transaksi_pembelian` (`id_buku_besar`);

--
-- Indeks untuk tabel `tabel_supplier`
--
ALTER TABLE `tabel_supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tabel_barang`
--
ALTER TABLE `tabel_barang`
  ADD CONSTRAINT `tabel_barang_ibfk_1` FOREIGN KEY (`id_supplier`) REFERENCES `tabel_supplier` (`id_supplier`);

--
-- Ketidakleluasaan untuk tabel `tabel_buku_besar`
--
ALTER TABLE `tabel_buku_besar`
  ADD CONSTRAINT `tabel_buku_besar_ibfk_1` FOREIGN KEY (`id_biaya`) REFERENCES `tabel_biaya` (`id_biaya`),
  ADD CONSTRAINT `tabel_buku_besar_ibfk_2` FOREIGN KEY (`id_kas_dan_bank`) REFERENCES `tabel_kas_dan_bank` (`id_kas_bank`),
  ADD CONSTRAINT `tabel_buku_besar_ibfk_3` FOREIGN KEY (`id_detail_transaksi_penjualan`) REFERENCES `tabel_detail_transaksi_penjualan` (`id_detail_transaksi_penjualan`),
  ADD CONSTRAINT `tabel_buku_besar_ibfk_4` FOREIGN KEY (`id_pengeluaran`) REFERENCES `tabel_pengeluaran` (`id_pengeluaran`),
  ADD CONSTRAINT `tabel_buku_besar_ibfk_5` FOREIGN KEY (`id_pegawai`) REFERENCES `tabel_pegawai` (`id_pegawai`),
  ADD CONSTRAINT `tabel_buku_besar_ibfk_6` FOREIGN KEY (`id_detail_transaksi_pembelian`) REFERENCES `tabel_detail_transaksi_pembelian` (`id_detail_transaksi_pembelian`);

--
-- Ketidakleluasaan untuk tabel `tabel_customer`
--
ALTER TABLE `tabel_customer`
  ADD CONSTRAINT `tabel_customer_ibfk_1` FOREIGN KEY (`id_pengguna`) REFERENCES `tabel_pengguna` (`id_pengguna`);

--
-- Ketidakleluasaan untuk tabel `tabel_detail_transaksi_pembelian`
--
ALTER TABLE `tabel_detail_transaksi_pembelian`
  ADD CONSTRAINT `tabel_detail_transaksi_pembelian_ibfk_1` FOREIGN KEY (`id_transaksi_pembelian`) REFERENCES `tabel_pembelian` (`id_transaksi_pembelian`);

--
-- Ketidakleluasaan untuk tabel `tabel_detail_transaksi_penjualan`
--
ALTER TABLE `tabel_detail_transaksi_penjualan`
  ADD CONSTRAINT `tabel_detail_transaksi_penjualan_ibfk_1` FOREIGN KEY (`id_transaksi_penjualan`) REFERENCES `tabel_penjualan` (`id_transaksi_penjualan`);

--
-- Ketidakleluasaan untuk tabel `tabel_invoice`
--
ALTER TABLE `tabel_invoice`
  ADD CONSTRAINT `tabel_invoice_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `tabel_barang` (`id_barang`);

--
-- Ketidakleluasaan untuk tabel `tabel_pegawai`
--
ALTER TABLE `tabel_pegawai`
  ADD CONSTRAINT `tabel_pegawai_ibfk_1` FOREIGN KEY (`id_pengguna`) REFERENCES `tabel_pengguna` (`id_pengguna`);

--
-- Ketidakleluasaan untuk tabel `tabel_pembelian`
--
ALTER TABLE `tabel_pembelian`
  ADD CONSTRAINT `tabel_pembelian_ibfk_1` FOREIGN KEY (`id_invoice`) REFERENCES `tabel_invoice` (`id_invoice`);

--
-- Ketidakleluasaan untuk tabel `tabel_penjualan`
--
ALTER TABLE `tabel_penjualan`
  ADD CONSTRAINT `tabel_penjualan_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `tabel_customer` (`id_customer`),
  ADD CONSTRAINT `tabel_penjualan_ibfk_2` FOREIGN KEY (`id_barang`) REFERENCES `tabel_barang` (`id_barang`),
  ADD CONSTRAINT `tabel_penjualan_ibfk_3` FOREIGN KEY (`id_outlet`) REFERENCES `tabel_outlet` (`id_outlet`);

--
-- Ketidakleluasaan untuk tabel `tabel_report`
--
ALTER TABLE `tabel_report`
  ADD CONSTRAINT `tabel_report_ibfk_1` FOREIGN KEY (`id_buku_besar`) REFERENCES `tabel_buku_besar` (`id_buku_besar`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
sistem-informasi
