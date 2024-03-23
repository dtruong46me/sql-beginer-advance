
--1--
SELECT
    PRODUCT_ID,
    PRODUCT_NAME,
    (SELECT AVG(UNIT_PRICE) 
        FROM ORDER_ITEMS OI
        WHERE OI.PRODUCT_ID = P.PRODUCT_ID) AS AGRG
FROM PRODUCTS P;


--2--
SELECT
    PRODUCT_ID,
    PRODUCT_NAME
FROM PRODUCTS P 
WHERE
    1=1
    AND P.PRODUCT_ID NOT IN 
        (SELECT PRODUCT_ID
        FROM ORDER_ITEMS);

--3--
SELECT
    PRODUCT_ID,
    PRODUCT_NAME
FROM PRODUCTS P 
WHERE P.PRODUCT_ID NOT IN 
    (SELECT PRODUCT_ID FROM INVENTORIES);

--4--
SELECT
    CUSTOMER_ID,
    NAME
FROM CUSTOMERS C 
WHERE C.CUSTOMER_ID IN
    (SELECT C.CUSTOMER_ID
    FROM ORDERS O 
    WHERE O.CUSTOMER_ID = C.CUSTOMER_ID
    AND EXTRACT(YEAR FROM O.ORDER_DATE) BETWEEN 2016 AND 2017);

--5--
SELECT *
FROM CUSTOMERS C 
WHERE C.CUSTOMER_ID NOT IN
    (SELECT O.CUSTOMER_ID
    FROM ORDERS O 
    WHERE EXTRACT(YEAR FROM O.ORDER_DATE) = 2017);

--6--
SELECT *
FROM CUSTOMERS C 
WHERE C.CREDIT_LIMIT > 
    (SELECT AVG(CREDIT_LIMIT) FROM CUSTOMERS);

--7--

--8--

--9--

--10--
CREATE VIEW CBst_Order1 AS
SELECT p.product_id as Masanpham, 
p.product_name as Tensanpham, 
wh.warehouse_names as Tenkhoton, 
coun.country_name as Quocgiakho, 
sum(inv.quantity) as Tongslton
FROM PRODUCTS p 
INNER JOIN INVENTORIES inv ON p.product_id = inv.product_id
INNER JOIN WAREHOUSES wh ON inv.warehouse_id = wh.warehouse_id
INNER JOIN LOCATIONS lo ON wh.location_id = lo.location_id
INNER JOIN COUNTRIES coun ON coun.country_id = lo.country_id
WHERE inv.quantity is not null 
GROUP BY p.product_id, p.product_name,wh.warehouse_names, coun.country_name
ORDER BY Masanpham;