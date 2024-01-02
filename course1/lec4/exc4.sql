
SELECT 
    UPPER(NAME) AS Ho_Ten, 
    LOWER(ADDRESS) AS Dia_Chi
FROM CUSTOMERS;

SELECT 
    SUM(TOTAL) AS TONG_GIA_TRI,
    MAX(TOTAL) AS GTLN,
    MIN(TOTAL) AS GTNN,
    AVG(TOTAL) AS TRUNG_BINH
FROM ORDERS;

SELECT AVG(O.TOTAL) AS TRUNG_BINH
FROM ORDERS o JOIN ORDER_ITEMS oi
    ON o.ORDER_ID = oi.ORDER_ID
WHERE 
    1=1
    AND o.STATUS = 'Shipped'
    AND EXTRACT(YEAR FROM o.ORDER_DATE) = 2016;