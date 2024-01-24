CREATE TABLE DTRUONG_KHACHHANG (
    MAKH CHAR(4),
    HOTEN VARCHAR(40),
    DCHI VARCHAR(50),
    SODT VARCHAR(20),
    NGSINH DATE,
    NGDK DATE,
    DOANHSO NUMBER
);

CREATE TABLE DTRUONG_NHANVIEN (
    MANV CHAR(4),
    HOTEN VARCHAR(40),
    SODT VARCHAR(40),
    NGVL DATE
);

CREATE TABLE DTRUONG_SANPHAM (
    MASP CHAR(4),
    TENSP VARCHAR(40),
    DVT VARCHAR(20),
    NUOCSX VARCHAR(40),
    GIA NUMBER
);

CREATE TABLE DTRUONG_HOADON (
    SOHD NUMBER,
    NGHD DATE,
    MAKH CHAR(4),
    MANV CHAR(4),
    TRIGIA NUMBER
);

CREATE TABLE DTRUONG_CTHD (
    SOHD NUMBER,
    MASP CHAR(4),
    SL NUMBER
);



insert into DTRUONG_KHACHHANG values ('KH01','Nguyen Van A','731,Tran Hung Dao, Q 5 ,Tp HCM','08823451',TO_DATE('22/10/1960','DD/MM/YYYY'),TO_DATE('22/10/2006','DD/MM/YYYY'),13000000);
insert into DTRUONG_KHACHHANG values ('KH02','Tran Ngoc Han','23/5, Nguyen Trai, Q 5, Tp HCM','0908256478',TO_DATE('03/04/1974','DD/MM/YYYY'),TO_DATE('30/07/2006','DD/MM/YYYY'),280000);
insert into DTRUONG_KHACHHANG values ('KH03','Tran Ngoc Linh','45, Nguyen Canh Chan, Q 1, Tp HCM','0938776266',TO_DATE('12/06/1980','DD/MM/YYYY'),TO_DATE('05/08/2006','DD/MM/YYYY'),3860000);
insert into DTRUONG_KHACHHANG values ('KH04','Tran Minh Long','50/34 Le Dai Hanh, Q 10, Tp HCM','0917325476',TO_DATE('09/03/1965','DD/MM/YYYY'),TO_DATE('02/10/2006','DD/MM/YYYY'),250000);
insert into DTRUONG_KHACHHANG values ('KH05','Le Nhat Minh','34, Truong Dinh, Q 3, Tp HCM','08246108',TO_DATE('10/03/1950','DD/MM/YYYY'),TO_DATE('28/10/2006','DD/MM/YYYY'),21000);
insert into DTRUONG_KHACHHANG values ('KH06','Le Hoai Thuong','227, Nguyen Van Cu, Q 5, Tp HCM','08631738',TO_DATE('31/12/1981','DD/MM/YYYY'),TO_DATE('24/11/2006','DD/MM/YYYY'),915000);
insert into DTRUONG_KHACHHANG values ('KH07','Nguyen Van Tam','32/3, Tran Binh Trong, Q 5, Tp HCM','0916783565',TO_DATE('06/04/1971','DD/MM/YYYY'),TO_DATE('01/12/2006','DD/MM/YYYY'),12500);
insert into DTRUONG_KHACHHANG values ('KH08','Phan Thi Thanh','45/2, An Duong Vuong, Q 5, Tp HCM','0938435756',TO_DATE('10/01/1971','DD/MM/YYYY'),TO_DATE('13/12/2006','DD/MM/YYYY'),365000);
insert into DTRUONG_KHACHHANG values ('KH09','Le Ha Vinh','873, Le Hong Phong, Q 5, Tp HCM','08654763',TO_DATE('03/09/1979','DD/MM/YYYY'),TO_DATE('14/01/2007','DD/MM/YYYY'),70000);
insert into DTRUONG_KHACHHANG values ('KH10','Ha Duy Lap','34/34B, Nguyen Trai, Q 1, Tp HCM','08768904',TO_DATE('02/05/1983','DD/MM/YYYY'),TO_DATE('16/01/2007','DD/MM/YYYY'),67500);

insert into DTRUONG_NHANVIEN values ('NV01','Nguyen Nhu Nhut','0927345678',TO_DATE('13/04/2006','DD/MM/YYYY'));
insert into DTRUONG_NHANVIEN values ('NV02','Le Thi Phi Yen','0987567390',TO_DATE('21/04/2006','DD/MM/YYYY'));
insert into DTRUONG_NHANVIEN values ('NV03','Nguyen Van B','0997047382',TO_DATE('27/04/2006','DD/MM/YYYY'));
insert into DTRUONG_NHANVIEN values ('NV04','Ngo Thanh Tuan','0913758498',TO_DATE('24/06/2006','DD/MM/YYYY'));
insert into DTRUONG_NHANVIEN values ('NV05','Nguyen Thi Truc Thanh','0918590387',TO_DATE('20/07/2006','DD/MM/YYYY'));

insert into DTRUONG_SANPHAM values ('BC01','But chi','cay','Singapore',3000);
insert into DTRUONG_SANPHAM values ('BC02','But chi','cay','Singapore',5000);
insert into DTRUONG_SANPHAM values ('BC03','But chi','cay','Viet Nam',3500);
insert into DTRUONG_SANPHAM values ('BC04','But chi','hop','Viet Nam',30000);
insert into DTRUONG_SANPHAM values ('BB01','But bi','cay','Viet Nam',5000);
insert into DTRUONG_SANPHAM values ('BB02','But bi','cay','Trung Quoc',7000);
insert into DTRUONG_SANPHAM values ('BB03','But bi','hop','Thai Lan',100000);
insert into DTRUONG_SANPHAM values ('TV01','Tap 100 giay mong','quyen','Trung Quoc',2500);
insert into DTRUONG_SANPHAM values ('TV02','Tap 200 giay mong','quyen','Trung Quoc',4500);
insert into DTRUONG_SANPHAM values ('TV03','Tap 100 giay tot','quyen','Viet Nam',3000);
insert into DTRUONG_SANPHAM values ('TV04','Tap 200 giay tot','quyen','Viet Nam',5500);
insert into DTRUONG_SANPHAM values ('TV05','Tap 100 trang','chuc','Viet Nam',23000);
insert into DTRUONG_SANPHAM values ('TV06','Tap 200 trang','chuc','Viet Nam',53000);
insert into DTRUONG_SANPHAM values ('TV07','Tap 100 trang','chuc','Trung Quoc',34000);
insert into DTRUONG_SANPHAM values ('ST01','So tay 500 trang','quyen','Trung Quoc',40000);
insert into DTRUONG_SANPHAM values ('ST02','So tay loai 1','quyen','Viet Nam',55000);
insert into DTRUONG_SANPHAM values ('ST03','So tay loai 2','quyen','Viet Nam',51000);
insert into DTRUONG_SANPHAM values ('ST04','So tay ','quyen','Thai Lan',55000);
insert into DTRUONG_SANPHAM values ('ST05','So tay mong','quyen','Thai Lan',20000);
insert into DTRUONG_SANPHAM values ('ST06','Phan viet bang','hop','Viet Nam',5000);
insert into DTRUONG_SANPHAM values ('ST07','Phan khong bui','hop','Viet Nam',7000);
insert into DTRUONG_SANPHAM values ('ST08','Bong bang','cai','Viet Nam',1000);
insert into DTRUONG_SANPHAM values ('ST09','But long','cay','Viet Nam',5000);
insert into DTRUONG_SANPHAM values ('ST10','But long','cay','Trung Quoc',7000);

insert into DTRUONG_HOADON values (1001,TO_DATE('23/07/2006','DD/MM/YYYY'),'KH01','NV01',320000);
insert into DTRUONG_HOADON values (1002,TO_DATE('12/08/2006','DD/MM/YYYY'),'KH01','NV02',840000);
insert into DTRUONG_HOADON values (1003,TO_DATE('23/08/2006','DD/MM/YYYY'),'KH02','NV01',100000);
insert into DTRUONG_HOADON values (1004,TO_DATE('01/09/2006','DD/MM/YYYY'),'KH02','NV01',180000);
insert into DTRUONG_HOADON values (1005,TO_DATE('20/10/2006','DD/MM/YYYY'),'KH01','NV02',3800000);
insert into DTRUONG_HOADON values (1006,TO_DATE('16/10/2006','DD/MM/YYYY'),'KH01','NV03',2430000);
insert into DTRUONG_HOADON values (1007,TO_DATE('28/10/2006','DD/MM/YYYY'),'KH03','NV03',510000);
insert into DTRUONG_HOADON values (1008,TO_DATE('28/10/2006','DD/MM/YYYY'),'KH01','NV03',440000);
insert into DTRUONG_HOADON values (1009,TO_DATE('28/10/2006','DD/MM/YYYY'),'KH03','NV04',200000);
insert into DTRUONG_HOADON values (1010,TO_DATE('01/11/2006','DD/MM/YYYY'),'KH01','NV01',5200000);
insert into DTRUONG_HOADON values (1011,TO_DATE('04/11/2006','DD/MM/YYYY'),'KH04','NV03',250000);
insert into DTRUONG_HOADON values (1012,TO_DATE('30/11/2006','DD/MM/YYYY'),'KH05','NV03',21000);
insert into DTRUONG_HOADON values (1013,TO_DATE('12/12/2006','DD/MM/YYYY'),'KH06','NV01',5000);
insert into DTRUONG_HOADON values (1014,TO_DATE('31/12/2006','DD/MM/YYYY'),'KH03','NV02',3150000);
insert into DTRUONG_HOADON values (1015,TO_DATE('01/01/2007','DD/MM/YYYY'),'KH06','NV01',910000);
insert into DTRUONG_HOADON values (1016,TO_DATE('01/01/2007','DD/MM/YYYY'),'KH07','NV02',12500);
insert into DTRUONG_HOADON values (1017,TO_DATE('02/01/2007','DD/MM/YYYY'),'KH08','NV03',35000);
insert into DTRUONG_HOADON values (1018,TO_DATE('13/01/2007','DD/MM/YYYY'),'KH08','NV03',330000);
insert into DTRUONG_HOADON values (1019,TO_DATE('13/01/2007','DD/MM/YYYY'),'KH01','NV03',30000);
insert into DTRUONG_HOADON values (1020,TO_DATE('14/01/2007','DD/MM/YYYY'),'KH09','NV04',70000);
insert into DTRUONG_HOADON values (1021,TO_DATE('16/01/2007','DD/MM/YYYY'),'KH10','NV03',67500);
insert into DTRUONG_HOADON values (1022,TO_DATE('16/01/2007','DD/MM/YYYY'),null,'NV03',7000);
insert into DTRUONG_HOADON values (1023,TO_DATE('17/01/2007','DD/MM/YYYY'),null,'NV01',330000);

insert into DTRUONG_CTHD values (1001,'TV02',10);
insert into DTRUONG_CTHD values (1001,'ST01',5);
insert into DTRUONG_CTHD values (1001,'BC01',5);
insert into DTRUONG_CTHD values (1001,'BC02',10);
insert into DTRUONG_CTHD values (1001,'ST08',10);
insert into DTRUONG_CTHD values (1002,'BC04',20);
insert into DTRUONG_CTHD values (1002,'BB01',20);
insert into DTRUONG_CTHD values (1002,'BB02',20);
insert into DTRUONG_CTHD values (1003,'BB03',10);
insert into DTRUONG_CTHD values (1004,'TV01',20);
insert into DTRUONG_CTHD values (1004,'TV02',20);
insert into DTRUONG_CTHD values (1004,'TV03',20);
insert into DTRUONG_CTHD values (1004,'TV04',20);
insert into DTRUONG_CTHD values (1005,'TV05',50);
insert into DTRUONG_CTHD values (1005,'TV06',50);
insert into DTRUONG_CTHD values (1006,'TV07',20);
insert into DTRUONG_CTHD values (1006,'ST01',30);
insert into DTRUONG_CTHD values (1006,'ST02',10);
insert into DTRUONG_CTHD values (1007,'ST03',10);
insert into DTRUONG_CTHD values (1008,'ST04',8);
insert into DTRUONG_CTHD values (1009,'ST05',10);
insert into DTRUONG_CTHD values (1010,'TV07',50);
insert into DTRUONG_CTHD values (1010,'ST07',50);
insert into DTRUONG_CTHD values (1010,'ST08',100);
insert into DTRUONG_CTHD values (1010,'ST04',50);
insert into DTRUONG_CTHD values (1010,'TV03',100);
insert into DTRUONG_CTHD values (1011,'ST06',50);
insert into DTRUONG_CTHD values (1012,'ST07',3);
insert into DTRUONG_CTHD values (1013,'ST08',5);
insert into DTRUONG_CTHD values (1014,'BC02',80);
insert into DTRUONG_CTHD values (1014,'BB02',100);
insert into DTRUONG_CTHD values (1014,'BC04',60);
insert into DTRUONG_CTHD values (1014,'BB01',50);
insert into DTRUONG_CTHD values (1015,'BB02',30);
insert into DTRUONG_CTHD values (1015,'BB03',7);
insert into DTRUONG_CTHD values (1016,'TV01',5);
insert into DTRUONG_CTHD values (1017,'TV02',1);
insert into DTRUONG_CTHD values (1017,'TV03',1);
insert into DTRUONG_CTHD values (1017,'TV04',5);
insert into DTRUONG_CTHD values (1018,'ST04',6);
insert into DTRUONG_CTHD values (1019,'ST05',1);
insert into DTRUONG_CTHD values (1019,'ST06',2);
insert into DTRUONG_CTHD values (1020,'ST07',10);
insert into DTRUONG_CTHD values (1021,'ST08',5);
insert into DTRUONG_CTHD values (1021,'TV01',7);
insert into DTRUONG_CTHD values (1021,'TV02',10);
insert into DTRUONG_CTHD values (1022,'ST07',1);
insert into DTRUONG_CTHD values (1023,'ST04',6);