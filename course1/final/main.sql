--1--
SELECT *
FROM DTRUONG_SANPHAM
WHERE NUOCSX='Trung Quoc';

--2--
SELECT *
FROM DTRUONG_SANPHAM
WHERE DVT='cay' OR DVT='quyen';

--3--
SELECT *
FROM DTRUONG_SANPHAM
WHERE MASP LIKE 'B%' AND MASP LIKE '%01';

--4--
SELECT *
FROM DTRUONG_SANPHAM
WHERE
    NUOCSX='Trung Quoc'
    AND (GIA BETWEEN 30000 AND 40000);

--5--
SELECT *
FROM DTRUONG_SANPHAM
WHERE
    (NUOCSX='Trung Quoc' OR NUOCSX='Thai Lan')
    AND (GIA BETWEEN 30000 AND 40000);

--6--
SELECT *
FROM DTRUONG_HOADON
WHERE
    NGHD=TO_DATE('01/01/2007','DD/MM/YYYY')
    OR NGHD=TO_DATE('02/01/2007','DD/MM/YYYY');

--7--
SELECT *
FROM DTRUONG_HOADON
WHERE
    EXTRACT(YEAR FROM NGHD)=2007
    AND EXTRACT(MONTH FROM NGHD)=1
ORDER BY NGHD ASC, TRIGIA DESC;

--8--
SELECT KH.MAKH, HOTEN, DCHI, SODT, NGHD
FROM DTRUONG_KHACHHANG KH
JOIN DTRUONG_HOADON HD
    ON KH.MAKH = HD.MAKH
WHERE NGHD = TO_DATE('01/01/2007', 'DD/MM/YYYY');

--9--
SELECT *
FROM DTRUONG_HOADON HD
JOIN DTRUONG_NHANVIEN NV
    ON HD.MANV = NV.MANV
WHERE
    HOTEN = 'Nguyen Van B'
    AND NGHD = TO_DATE('28/10/2006', 'DD/MM/YYYY');

--10--
SELECT SP.MASP, SP.TENSP, KH.MAKH, KH.HOTEN, HD.NGHD
FROM DTRUONG_SANPHAM SP
JOIN DTRUONG_CTHD CT
    ON SP.MASP = CT.MASP
JOIN DTRUONG_HOADON HD
    ON HD.SOHD = CT.SOHD
JOIN DTRUONG_KHACHHANG KH
    ON HD.MAKH = KH.MAKH
WHERE
    KH.HOTEN = 'Nguyen Van A'
    AND EXTRACT(YEAR FROM HD.NGHD) = 2006
    AND EXTRACT(MONTH FROM HD.NGHD) = 10;

--11--
SELECT *
FROM DTRUONG_HOADON HD
JOIN DTRUONG_CTHD CT
    ON HD.SOHD = CT.SOHD
WHERE MASP='BB01' OR MASP='BB02';

--12--
SELECT *
FROM DTRUONG_HOADON HD
JOIN DTRUONG_CTHD CT
    ON HD.SOHD = CT.SOHD
WHERE
    (MASP='BB01' OR MASP='BB02')
    AND (SL BETWEEN 10 AND 20);

--13--
-- SELECT *
-- FROM DTRUONG_HOADON
-- WHERE 
--     1=1
--     AND NGHD IN (
--         SELECT NGHD
--         FROM DTRUONG_HOADON HD
--         JOIN DTRUONG_CTHD CT
--             ON CT.SOHD = HD.SOHD
--         JOIN DTRUONG_SANPHAM SP
--             ON SP.MASP = CT.MASP
--         WHERE SP.MASP = 'BB01' OR SP.MASP = 'BB02'
--     );

--14--
SELECT *
FROM DTRUONG_SANPHAM
WHERE 
    1=1
    AND MASP NOT IN (
        SELECT DISTINCT MASP
        FROM DTRUONG_CTHD
    );

--15--
-- SELECT *
-- FROM DTRUONG_SANPHAM SP
-- JOIN DTRUONG_CTHD CT
--     ON SP.MASP = CT.MASP
-- WHERE 
--     1=1
--     AND SP.MASP NOT IN (
--         SELECT DISTINCT MASP
--         FROM DTRUONG_CTHD
--     )
--     AND EXTRACT(YEAR FROM HD.NGHD) = 2007;

--16--

--17--
SELECT MAX(HD.TRIGIA), MIN(HD.TRIGIA)
FROM DTRUONG_HOADON HD
JOIN DTRUONG_CTHD CT
    ON HD.SOHD = CT.SOHD
JOIN DTRUONG_SANPHAM SP
    ON CT.MASP = SP.MASP

--18--
SELECT TRUNC(AVG(TRIGIA),2)
FROM DTRUONG_HOADON
WHERE EXTRACT(YEAR FROM NGHD) = 2006;

--19--
SELECT TRUNC(SUM(TRIGIA),2)
FROM DTRUONG_HOADON
WHERE EXTRACT(YEAR FROM NGHD) = 2006;

--20--
SELECT *
FROM DTRUONG_HOADON
WHERE 
    1=1
    AND TRIGIA IN (
        SELECT MAX(TRIGIA)
        FROM DTRUONG_HOADON
    );

--21--
SELECT KH.MAKH, KH.HOTEN, SUM(HD.TRIGIA) AS SUM_
FROM DTRUONG_KHACHHANG KH
JOIN DTRUONG_HOADON HD
    ON KH.MAKH = HD.MAKH
GROUP BY KH.MAKH, KH.HOTEN
ORDER BY SUM_ DESC
FETCH FIRST 3 ROWS ONLY;

--22--
SELECT *
FROM DTRUONG_SANPHAM
WHERE 
    1=1
    AND GIA IN (
        SELECT DISTINCT GIA
        FROM DTRUONG_SANPHAM
        ORDER BY GIA DESC
        FETCH FIRST 3 ROWS ONLY
    );

--23--
SELECT *
FROM DTRUONG_SANPHAM
WHERE 
    1=1
    AND NUOCSX = 'Thai Lan'
    AND GIA IN (
        SELECT DISTINCT GIA
        FROM DTRUONG_SANPHAM
        ORDER BY GIA DESC
        FETCH FIRST 3 ROWS ONLY
    );

--24--
SELECT *
FROM DTRUONG_SANPHAM SP
WHERE 
    1=1
    AND SP.NUOCSX='Trung Quoc'
    AND GIA IN (
        SELECT DISTINCT GIA
        FROM DTRUONG_SANPHAM
        WHERE NUOCSX = 'Trung Quoc'
        ORDER BY GIA DESC
        FETCH FIRST 3 ROWS ONLY
    );

--25--
SELECT KH.MAKH, KH.HOTEN, SUM(HD.TRIGIA) AS SUM_
FROM DTRUONG_KHACHHANG KH
JOIN DTRUONG_HOADON HD
    ON KH.MAKH = HD.MAKH
GROUP BY KH.MAKH, KH.HOTEN
ORDER BY SUM_ DESC
FETCH FIRST 3 ROWS ONLY;

--26--
SELECT COUNT(*)
FROM DTRUONG_SANPHAM
WHERE NUOCSX='Trung Quoc';

--27--
SELECT NUOCSX, COUNT(*)
FROM DTRUONG_SANPHAM
GROUP BY NUOCSX;

--28--
SELECT NUOCSX, COUNT(*), SUM(GIA), MIN(GIA), MAX(GIA), TRUNC(AVG(GIA),2)
FROM DTRUONG_SANPHAM
GROUP BY NUOCSX;

--29--
SELECT NGHD, SUM(TRIGIA)
FROM DTRUONG_HOADON
GROUP BY NGHD
ORDER BY NGHD;

--30--
SELECT
    EXTRACT(MONTH FROM NGHD) AS THANG,
    EXTRACT(YEAR FROM NGHD) AS NAM,
    SUM(TRIGIA)
FROM DTRUONG_HOADON
GROUP BY EXTRACT(MONTH FROM NGHD), EXTRACT(YEAR FROM NGHD)
ORDER BY NAM, THANG;

--31--
-- SELECT HD.SOHD, HD.NGHD, HD.MAKH, HD.MANV, COUNT(CT.MASP)
-- FROM DTRUONG_HOADON HD
-- JOIN DTRUONG_CTHD CT
--     ON HD.SOHD = CT.SOHD
-- WHERE COUNT(CT.MASP) >= 4
-- GROUP BY HD.SOHD;

--32--
