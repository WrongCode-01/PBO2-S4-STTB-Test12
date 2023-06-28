-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 28, 2023 at 07:41 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

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
-- Table structure for table `tbl_barang`
--

CREATE TABLE `tbl_barang` (
  `kd_barang` varchar(10) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `jumlah_barang` int(11) NOT NULL,
  `harga_beli` int(11) NOT NULL,
  `harga_jual` int(11) NOT NULL,
  `tanggal_masuk` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_barang`
--

INSERT INTO `tbl_barang` (`kd_barang`, `nama_barang`, `jumlah_barang`, `harga_beli`, `harga_jual`, `tanggal_masuk`) VALUES
('B0004', 'Laptop MSI A5M', 10, 8500000, 9000000, '2023-06-28'),
('B0005', 'Handphone ASUS Zenfone 9', 3, 6000000, 6400000, '2023-06-28'),
('B0006', 'Headset Bluetooth TWS', 23, 200000, 250000, '2023-06-28');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_hitung_jual`
--

CREATE TABLE `tbl_hitung_jual` (
  `id_hitung` int(11) NOT NULL,
  `kd_barang` varchar(11) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `hsatuan` int(11) NOT NULL,
  `jumlah_jual` int(11) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `tbl_hitung_jual`
--
DELIMITER $$
CREATE TRIGGER `tr_batal` AFTER DELETE ON `tbl_hitung_jual` FOR EACH ROW BEGIN
UPDATE tbl_barang set jumlah_barang=jumlah_barang+old.jumlah_jual
WHERE kd_barang=old.kd_barang;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_jual` AFTER INSERT ON `tbl_hitung_jual` FOR EACH ROW BEGIN
UPDATE tbl_barang set jumlah_barang=jumlah_barang-new.jumlah_jual
WHERE kd_barang=new.kd_barang;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_login`
--

CREATE TABLE `tbl_login` (
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `jenis_kelamin` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `no_telp` int(30) NOT NULL,
  `agama` varchar(30) NOT NULL,
  `alamat` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_login`
--

INSERT INTO `tbl_login` (`username`, `password`, `jenis_kelamin`, `email`, `no_telp`, `agama`, `alamat`) VALUES
('admin', 'admin123', '', '', 0, '', ''),
('dena', '12345', 'Laki-Laki', 'qwqwqw', 32165464, 'ISLAM', 'qwdqdq');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_penjualan`
--

CREATE TABLE `tbl_penjualan` (
  `nofaktur` varchar(11) NOT NULL,
  `kd_barang` varchar(11) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `hsatuan` int(11) NOT NULL,
  `jumlah_jual` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `bayar` int(11) NOT NULL,
  `kembalian` int(11) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_penjualan`
--

INSERT INTO `tbl_penjualan` (`nofaktur`, `kd_barang`, `nama_barang`, `hsatuan`, `jumlah_jual`, `harga`, `bayar`, `kembalian`, `tanggal`) VALUES
('F0001', 'B0004', 'Laptop MSI A5M', 9000000, 3, 27000000, 30000000, 2500000, '2023-06-28'),
('F0001', 'B0006', 'Headset Bluetooth TWS', 250000, 2, 500000, 30000000, 2500000, '2023-06-28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_hitung_jual`
--
ALTER TABLE `tbl_hitung_jual`
  ADD PRIMARY KEY (`id_hitung`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_hitung_jual`
--
ALTER TABLE `tbl_hitung_jual`
  MODIFY `id_hitung` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
