
CREATE
    /*[ALGORITHM = {UNDEFINED | MERGE | TEMPTABLE}]
    [DEFINER = { user | CURRENT_USER }]
    [SQL SECURITY { DEFINER | INVOKER }]*/
    VIEW `db_smk`.`faktur_transaksi` 
    AS
(SELECT x.id_barang, nama_barang, CONCAT('Rp. ', FORMAT(ROUND(harga),0)) AS harga,
y.Qty, CONCAT('Rp. ', FORMAT(ROUND(harga * y.Qty),0)) AS jumlah, CONCAT('Rp. ', FORMAT(ROUND(total_bayar),0)) AS total_bayar, 
CONCAT('Rp. ', FORMAT(ROUND(total_bayar - harga * y.Qty),0)) AS kembali FROM barang X 
INNER JOIN transaksi Y ON y.id_barang = x.id_barang);
