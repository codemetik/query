DELIMITER $$

USE `penjualan`$$

DROP TRIGGER /*!50032 IF EXISTS */ `kurangi_qty_barang`$$

CREATE
    /*!50017 DEFINER = 'root'@'localhost' */
    TRIGGER `kurangi_qty_barang` AFTER INSERT ON `transaksi` 
    FOR EACH ROW BEGIN
	UPDATE barang SET Qty = Qty - new.Qty WHERE id_barang = new.id_barang;
    END;
$$

DELIMITER ;