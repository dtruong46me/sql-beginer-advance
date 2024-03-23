
-- Thêm vào thuộc tính GHICHU có kiểu dữ liệu 
--varchar(20) cho quan hệ SANPHAM.
ALTER TABLE DTRUONG_SANPHAM
ADD GUICHU VARCHAR(20);

-- Thêm vào thuộc tính LOAIKH có kiểu dữ liệu là Number 
--cho quan hệ KHACHHANG.
ALTER TABLE DTRUONG_KHACHHANG
ADD LOAIKH NUMBER;

-- Sửa kiểu dữ liệu của thuộc tính GHICHU trong quan hệ 
--SANPHAM thành varchar(100).
ALTER TABLE DTRUONG_SANPHAM
MODIFY GHICHU VARCHAR(100);

-- Xóa thuộc tính GHICHU trong quan hệ SANPHAM.
ALTER TABLE DTRUONG_SANPHAM
DROP COLUMN GHICHU;

-- Sửa kiểu dữ liệu của thuộc tính LOAIKH trong quan hệ 
--KHACHHANG thành varchar(20).
ALTER TABLE DTRUONG_SANPHAM
MODIFY LOAIKH VARCHAR(20);

-- Sửa ràng buộc SOHD  trong quan hệ CTHD thành NOT NULL 
ALTER TABLE DTRUONG_CTHD
MODIFY SOHD NUMBER NOT NULL;