
select * 
from customers cus
join contacts con
    on cus.CUSTOMER_ID = con.CUSTOMER_ID;

-- Lấy  thông tin khách hàng có địa chỉ kết thúc = ‘MI’
SELECT CON.CUSTOMER_ID, 
    CON.FIRST_NAME || ' ' || CON.LAST_NAME AS FULL_NAME,
    ADDRESS,
    CON.EMAIL,
    CON.PHONE
FROM CUSTOMERS CUS
JOIN CONTACTS CON
    ON CUS.CUSTOMER_ID = CON.CUSTOMER_ID
WHERE
    1=1
    AND CUS.ADDRESS LIKE '%MI';

-- Lấy  thông tin khách hàng có hạn mức từ 500 đến 700 và có số điện thoại bắt đầu = ‘+39’
SELECT CON.CUSTOMER_ID, 
    CON.FIRST_NAME || ' ' || CON.LAST_NAME AS FULL_NAME,
    ADDRESS,
    CON.EMAIL,
    CON.PHONE
FROM CUSTOMERS CUS
JOIN CONTACTS CON
    ON CUS.CUSTOMER_ID = CON.CUSTOMER_ID
WHERE
    1=1
    AND CREDIT_LIMIT BETWEEN 500 AND 700
    AND CON.PHONE LIKE '+39%';

-- Lấy ra top 10  thông tin khách hàng có hạn mức lớn nhất. Sắp xếp theo thứ tự giảm dần. (Hàm lấy Top: FETCH FIRST n ROWS ONLY (n: Số dòng muốn lấy))
SELECT CON.CUSTOMER_ID, 
    CON.FIRST_NAME || ' ' || CON.LAST_NAME AS FULL_NAME,
    ADDRESS,
    CON.EMAIL,
    CON.PHONE
FROM CUSTOMERS CUS
JOIN CONTACTS CON
    ON CUS.CUSTOMER_ID = CON.CUSTOMER_ID
ORDER BY CUS.CREDIT_LIMIT
FETCH FIRST 10 ROWS ONLY;


-- Tính tổng doanh thu theo từng khách hàng 
SELECT
    C.CUSTOMER_ID,
    C.NAME,
    SUM(O.TOTAL)
FROM CUSTOMERS C
JOIN ORDERS O 
    ON C.CUSTOMER_ID = O.CUSTOMER_ID
WHERE
    1=1
    AND O.STATUS='Shipped'
GROUP BY C.CUSTOMER_ID, C.NAME;


-- Tìm ra khách hàng có tổng doanh thu lớn nhất trong năm 2017
SELECT
    C.CUSTOMER_ID,
    CT.FIRST_NAME,
    CT.LAST_NAME,
    C.ADDRESS,
    CT.EMAIL,
    CT.PHONE,
    SUM(O.TOTAL)
FROM CUSTOMERS C
JOIN ORDERS O
    ON C.CUSTOMER_ID = O.CUSTOMER_ID
JOIN CONTACTS CT
    ON CT.CUSTOMER_ID = C.CUSTOMER_ID
WHERE
    1=1
    AND EXTRACT(YEAR FROM O.ORDER_DATE) = 2017
    AND O.STATUS = 'Shipped'
GROUP BY C.CUSTOMER_ID, CT.FIRST_NAME, CT.LAST_NAME, C.ADDRESS, CT.EMAIL, CT.PHONE
ORDER BY SUM(O.TOTAL) DESC
FETCH FIRST 1 ROWS ONLY;


-- Tìm ra khách hàng có tổng có doanh thu nhỏ nhất trong năm 2017
SELECT
    C.CUSTOMER_ID,
    CT.FIRST_NAME,
    CT.LAST_NAME,
    C.ADDRESS,
    CT.EMAIL,
    CT.PHONE,
    SUM(O.TOTAL)
FROM CUSTOMERS C
JOIN ORDERS O
    ON C.CUSTOMER_ID = O.CUSTOMER_ID
JOIN CONTACTS CT
    ON CT.CUSTOMER_ID = C.CUSTOMER_ID
WHERE
    1=1
    AND EXTRACT(YEAR FROM O.ORDER_DATE) = 2017
    AND O.STATUS = 'Shipped'
GROUP BY C.CUSTOMER_ID, CT.FIRST_NAME, CT.LAST_NAME, C.ADDRESS, CT.EMAIL, CT.PHONE
ORDER BY SUM(O.TOTAL) ASC
FETCH FIRST 1 ROWS ONLY;


-- Lấy ra top 10  khách hàng có mức doanh thu trung bình của các đơn lớn nhất. Sắp xếp theo thứ tự tăng dần (Hàm lấy Top: FETCH FIRST n ROWS ONLY (n: Số dòng muốn lấy))
SELECT
    C.CUSTOMER_ID,
    C.NAME,
    TRUNC(AVG(O.TOTAL), 1)
FROM CUSTOMERS C
JOIN ORDERS O
    ON C.CUSTOMER_ID = O.CUSTOMER_ID
WHERE
    1=1
    AND O.STATUS='Shipped'
GROUP BY C.CUSTOMER_ID, C.NAME
ORDER BY AVG(O.TOTAL) DESC
FETCH FIRST 10 ROWS ONLY;

-- Tính tổng doanh thu theo từng khách hàng đối với những đơn hàng có trạng thái = ‘Shipped’ và ngày đặt hàng lớn hơn ngày 1/12017
SELECT
    C.CUSTOMER_ID,
    C.NAME,
    O.ORDER_DATE,
    TRUNC(SUM(O.TOTAL), 1)
FROM CUSTOMERS C
JOIN ORDERS O
    ON C.CUSTOMER_ID = O.CUSTOMER_ID
WHERE
    1=1
    AND O.STATUS='Shipped'
    AND O.ORDER_DATE > TO_DATE('01/01/2017', 'DD/MM/YYYY')
GROUP BY C.CUSTOMER_ID, C.NAME, O.ORDER_DATE
ORDER BY SUM(O.TOTAL) DESC;


-- Tính tổng doanh thu theo từng khách hàng (Làm tròn đến số thập phân thứ nhất) đối với những đơn hàng có trạng thái = ‘Pending’ và thời điểm đặt hàng từ năm 2015 đến năm 2017
SELECT
    C.CUSTOMER_ID,
    C.NAME,
    TRUNC(SUM(O.TOTAL), 1)
FROM CUSTOMERS C
JOIN ORDERS O
    ON C.CUSTOMER_ID = O.CUSTOMER_ID
WHERE
    1=1
    AND O.STATUS='Pending'
    AND EXTRACT(YEAR FROM O.ORDER_DATE) BETWEEN 2015 AND 2017
GROUP BY C.CUSTOMER_ID, C.NAME
ORDER BY SUM(O.TOTAL) DESC;


-- Tính tổng doanh thu các đơn hàng đã mua của các khách hàng theo từng tháng, năm. Sắp xếp theo theo tên khách hàng, tháng, năm mua hàng
SELECT
    C.CUSTOMER_ID,
    C.NAME,
    EXTRACT(MONTH FROM O.ORDER_DATE) AS MONTH_,
    EXTRACT(YEAR FROM O.ORDER_DATE) AS YEAR_,
    SUM(O.TOTAL)
FROM CUSTOMERS C
JOIN ORDERS O
    ON C.CUSTOMER_ID = O.CUSTOMER_ID
WHERE
    1=1
    AND O.STATUS='Shipped'
GROUP BY C.CUSTOMER_ID, C.NAME, EXTRACT(MONTH FROM O.ORDER_DATE), EXTRACT(YEAR FROM O.ORDER_DATE)
ORDER BY YEAR_, MONTH_, C.NAME;


-- Tính tổng giá trị các đơn hàng đã hủy, đơn hủy lớn nhất, đơn hủy nhỏ nhất theo từng khách hàng,  theo từng năm. Sắp xếp theo theo tên khách hàng, năm mua hàng
SELECT
    C.CUSTOMER_ID,
    C.NAME,
    EXTRACT(YEAR FROM O.ORDER_DATE) AS YEAR_,
    SUM(O.TOTAL),
    MIN(O.TOTAL),
    MAX(O.TOTAL)
FROM CUSTOMERS C
JOIN ORDERS O
    ON C.CUSTOMER_ID = O.CUSTOMER_ID
WHERE
    1=1
    AND O.STATUS='Canceled'
GROUP BY C.CUSTOMER_ID, C.NAME, EXTRACT(YEAR FROM O.ORDER_DATE)
ORDER BY YEAR_, C.NAME;