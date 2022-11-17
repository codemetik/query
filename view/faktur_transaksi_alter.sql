DELIMITER $$

ALTER ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `faktur_transaksi` AS (
SELECT
`y`.`id_transaksi` AS `id_transaksi`,
  `x`.`id_barang`   AS `id_barang`,
   `y`.`id_pelanggan` AS `id_pelanggan`,
  `x`.`nama_barang` AS `nama_barang`,
  CONCAT('Rp. ',FORMAT(ROUND(`x`.`harga`,0),0)) AS `harga`,
  `y`.`Qty`         AS `Qty`,
  CONCAT('Rp. ',FORMAT(ROUND(`x`.`harga` * `y`.`Qty`,0),0)) AS `jumlah`,
  CONCAT('Rp. ',FORMAT(ROUND(`y`.`total_bayar`,0),0)) AS `total_bayar`,
  CONCAT('Rp. ',FORMAT(ROUND(`y`.`total_bayar` - `x`.`harga` * `y`.`Qty`,0),0)) AS `kembali`
FROM (`barang` `x`
   JOIN `transaksi` `y`
     ON (`y`.`id_barang` = `x`.`id_barang`)))$$

DELIMITER ;