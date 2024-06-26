--1--
SELECT 
    UPPER(NAME) AS Ho_Ten, 
    LOWER(ADDRESS) AS Dia_Chi,
    WEBSITE,
    CREDIT_LIMIT
FROM CUSTOMERS;

--2--
SELECT 
    SUM(TOTAL) AS TONG_GIA_TRI,
    MAX(TOTAL) AS GTLN,
    MIN(TOTAL) AS GTNN,
    AVG(TOTAL) AS TRUNG_BINH
FROM ORDERS;

--3--
SELECT AVG(O.TOTAL) AS TRUNG_BINH
FROM ORDERS o JOIN ORDER_ITEMS oi
    ON o.ORDER_ID = oi.ORDER_ID
WHERE 
    1=1
    AND o.STATUS = 'Shipped'
    AND EXTRACT(YEAR FROM o.ORDER_DATE) = 2016;

--4--
SELECT SUM(TOTAL)
FROM ORDERS
WHERE EXTRACT(YEAR FROM ORDER_DATE) BETWEEN 2016 AND 2017;

--5--
SELECT 
    SUM(TOTAL) AS SUM_,
    MAX(TOTAL) AS MAX_,
    MIN(TOTAL) AS MIN_,
    AVG(TOTAL) AS AVG_
FROM ORDERS
WHERE STATUS='Pending';

--6--
SELECT
    SUM(TOTAL) AS SUM_,
    MAX(TOTAL) AS MAX_,
    MIN(TOTAL) AS MIN_,
    AVG(TOTAL) AS AVG_
FROM ORDERS
WHERE 
    1=1
    AND STATUS='Shipped'
    AND ORDER_DATE > TO_DATE('01/01/2017','DD/MM/YYYY');

--7--
SELECT
    TRUNC(SUM(TOTAL),1),
    MAX(TOTAL),
    MIN(TOTAL),
    AVG(TOTAL)
FROM ORDERS
WHERE STATUS='Shipped'
AND ORDER_DATE>TO_DATE('01/01/2017','DD/MM/YYYY');

--8--
SELECT CUSTOMER_ID, COUNT(ORDER_ID)
FROM ORDERS
WHERE
    1=1
    AND STATUS='Shipped'
GROUP BY CUSTOMER_ID
HAVING COUNT(ORDER_ID) > 4;

--9--
SELECT 
    CUSTOMER_ID, 
    COUNT(ORDER_ID)
FROM ORDERS
WHERE
    1=1
    AND EXTRACT(YEAR FROM ORDER_DATE)=2017
GROUP BY CUSTOMER_ID
HAVING COUNT(ORDER_ID) > 2;

--10--
SELECT 
    SUM(LIST_PRICE),
    MAX(LIST_PRICE),
    MIN(LIST_PRICE),
    TRUNC(AVG(LIST_PRICE),2)
FROM PRODUCTS
GROUP BY CATEGORY_ID;

--11--
SELECT 
    SUM(TOTAL),
    EXTRACT(MONTH FROM ORDER_DATE) AS MONTH
FROM ORDERS
WHERE
    1=1
    AND STATUS='Shipped'
    AND EXTRACT(YEAR FROM ORDER_DATE)=2017
GROUP BY EXTRACT(MONTH FROM ORDER_DATE)
ORDER BY MONTH ASC;

--12--
SELECT
    SUM(TOTAL),
    EXTRACT(MONTH FROM ORDER_DATE) AS MONTH_,
    EXTRACT(YEAR FROM ORDER_DATE) AS YEAR_
FROM ORDERS
WHERE 
    1=1
    AND STATUS='Shipped'
    AND EXTRACT(YEAR FROM ORDER_DATE) BETWEEN 2016 AND 2017
GROUP BY EXTRACT(MONTH FROM ORDER_DATE), EXTRACT(YEAR FROM ORDER_DATE)
ORDER BY YEAR_, MONTH_;

--13--
SELECT 
    CUSTOMER_ID,
    SUM(TOTAL)
FROM ORDERS
WHERE 
    1=1
    AND STATUS='Shipped'
    AND EXTRACT(YEAR FROM ORDER_DATE)=2017
GROUP BY CUSTOMER_ID
ORDER BY SUM(TOTAL) DESC
FETCH FIRST 3 ROWS ONLY;

--14--
SELECT 
    ORDER_ID,
    SUM(QUANTITY)
FROM ORDER_ITEMS
GROUP BY ORDER_ID
ORDER BY SUM(QUANTITY)
FETCH FIRST 3 ROWS ONLY;