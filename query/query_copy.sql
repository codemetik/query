USE db_irfa;

SHOW DATABASES;
SHOW TABLES;

DESC tb_siswa

SELECT * FROM tb_soal

INSERT INTO tb_siswa VALUES('200000','KD05','DARUL','2007-03-11','Taman','L');

CREATE TABLE tb_siswa(
nip CHAR (5) PRIMARY KEY,
nama VARCHAR (25),
kota VARCHAR(15),
tgl_lahir DATE,
jenis_kelamin CHAR(1));

CREATE TABLE tb_soal(
NISN CHAR(10) NOT NULL PRIMARY KEY,
kode_jr	CHAR(10) NOT NULL,	
nama VARCHAR(10) NULL,	
tgl_lahir DATE NULL,	
alamat	VARCHAR(10) NULL);

ALTER TABLE tb_soal ADD jenis_kelamin VARCHAR(1) AFTER alamat;
SELECT * FROM tb_soal

ALTER TABLE tb_soal 
CHANGE jenis_kelamin gender CHAR(1) NOT NULL;

ALTER TABLE tb_soal
MODIFY gender ENUM('L','W') NOT NULL;

ALTER TABLE tb_soal DROP kode_jr;
SHOW DATABASES;
SHOW TABLES;

SELECT * FROM tb_siswa
descrips

SHOW TABLES;

USE db_smk

SHOW TABLES;

SELECT * FROM barang
DESC barang
SELECT * FROM supplier
DESC supplier
SELECT * FROM transaksi
DESC transaksi
SELECT * FROM pelanggan
DESC pembeli
SELECT * FROM pembayaran
DESC pembayaran
SET @no=0;
SELECT @no:=@no+1 AS nom, * FROM barang X
INNER JOIN supplier Y ON y.id_supplier = x.id_supplier

SELECT * FROM barang
DESC barang
ALTER TABLE barang ADD satuan VARCHAR(10) AFTER harga;
SELECT * FROM transaksi
ALTER TABLE transaksi ADD total_bayar INT(11) AFTER Qty;

ALTER TABLE barang DROP satuan

SELECT * FROM barang
SELECT* FROM transaksi
SELECT * FROM faktur
/* menampilkan data barang beserta jumlah total harga barang sesuai stok*/
SELECT nama_barang, harga, Qty , 
CONCAT('Rp. ', FORMAT(ROUND(harga * Qty),0)) AS jumlah, nama_supplier 
FROM barang X INNER JOIN supplier Y ON y.id_supplier = x.id_supplier

SELECT x.id_barang, nama_barang, CONCAT('Rp. ', FORMAT(ROUND(harga),0)) AS harga,
y.Qty, CONCAT('Rp. ', FORMAT(ROUND(harga * y.Qty),0)) AS jumlah, CONCAT('Rp. ', FORMAT(ROUND(total_bayar),0)) AS total_bayar, 
CONCAT('Rp. ', FORMAT(ROUND(total_bayar - harga * y.Qty),0)) AS kembali FROM barang X 
INNER JOIN transaksi Y ON y.id_barang = x.id_barang

SELECT * FROM faktur_transaksi
SELECT * FROM transaksi

SELECT * FROM barang
RIGHT JOIN supplier ON supplier.id_supplier = barang.id_supplier

SELECT * FROM notifikasi

SELECT NOW()

SELECT Qty < 3 FROM barang WHERE id_barang = '1'



SELECT * FROM barang
SELECT * FROM transaksi

SELECT * FROM faktur_transaksi

SELECT x.id_barang, nama_barang, 
CONCAT('Rp. ', FORMAT(ROUND(harga),0)) AS harga,
y.Qty, 
CONCAT('Rp. ', FORMAT(ROUND(harga * y.Qty),0)) AS jumlah, 
CONCAT('Rp. ', FORMAT(ROUND(total_bayar),0)) AS total_bayar, 
CONCAT('Rp. ', FORMAT(ROUND(total_bayar - harga * y.Qty),0)) AS kembali 
FROM barang X 
INNER JOIN transaksi Y ON y.id_barang = x.id_barang
--------------------------------------------------------------------------------
SELECT x.id_barang, nama_barang, 
y.Qty, 
CONCAT('Rp. ',FORMAT(ROUND(harga * y.Qty),0)) AS jumah,
CONCAT('Rp. ',FORMAT(ROUND(total_bayar),0)) AS total_bayar,
CONCAT('Rp. ',FORMAT(ROUND(total_bayar - (harga * y.Qty)),0)) AS kembali
FROM barang X 
INNER JOIN transaksi Y ON y.id_barang = x.id_barang

SELECT * FROM faktur_transaksi

SELECT * FROM supplier

SELECT nama_barang, harga, Qty, x.id_supplier, nama_supplier 
FROM barang X
INNER JOIN supplier Y ON y.id_supplier = x.id_supplier
----------------------------------
SELECT nama_barang, harga, Qty, harga * Qty AS jumlah, x.id_supplier, nama_supplier 
FROM barang X
INNER JOIN supplier Y ON y.id_supplier = x.id_supplier
-------
SELECT x.nama_barang, 
@laba:= ROUND((10/100)*x.harga) AS laba, 
ROUND(x.harga - @laba) AS harga_beli,
x.harga AS harga_jual, y.Qty, jumlah 
FROM barang X
INNER JOIN faktur_transaksi Y ON y.id_barang = x.id_barang

SELECT * FROM faktur_transaksi