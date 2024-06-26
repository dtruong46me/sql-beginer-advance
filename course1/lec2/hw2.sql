
SELECT * FROM PRODUCTS;

SELECT PRODUCT_NAME FROM PRODUCTS
WHERE PRODUCT_ID = 225;

SELECT * FROM PRODUCTS
WHERE STANDARD_COST > 300;

SELECT * FROM PRODUCTS
WHERE STANDARD_COST != 500;

SELECT * FROM PRODUCTS
WHERE LIST_PRICE BETWEEN 300 AND 700;

SELECT * FROM PRODUCTS
WHERE PRODUCT_NAME = 'G.Skill Trident Z'
AND STANDARD_COST > 500;

SELECT * FROM PRODUCTS
WHERE PRODUCT_NAME = 'Corsair Dominator Platinum'
AND STANDARD_COST >= 600 
AND LIST_PRICE > 700;

SELECT * FROM PRODUCTS
WHERE PRODUCT_ID < 500;

SELECT * FROM PRODUCTS
WHERE PRODUCT_NAME LIKE '%Kingston%';

SELECT * FROM PRODUCTS
WHERE PRODUCT_NAME LIKE 'G.Skill%'
AND LIST_PRICE > 650;

SELECT * FROM PRODUCTS
WHERE PRODUCT_NAME LIKE '%Series'
AND DESCRIPTION LIKE '%128GB%';

SELECT * FROM PRODUCTS
WHERE PRODUCT_NAME LIKE 'C%'
AND LENGTH(PRODUCT_NAME /*CH CHAR*/) = 7
AND LIST_PRICE != 700;

SELECT * FROM PRODUCTS
WHERE LIST_PRICE IN (2200, 1850, 1756, 1249);


-- ORDERS --
SELECT * FROM ORDERS
WHERE ORDER_DATE BETWEEN '01=JAN-17' AND '31-DEC-17'
AND STATUS = 'Shipped';

SELECT * FROM ORDERS
WHERE ORDER_DATE BETWEEN '01=JAN-16' AND '31-DEC-16'
AND STATUS = 'Shipped';

SELECT * FROM ORDERS
WHERE ORDER_DATE > TO_DATE('2017-02-17', 'YYYY-MM-DD');

SELECT * FROM ORDERS
WHERE ORDER_DATE = TO_DATE('2017-02-17', 'YYYY-MM-DD')
AND STATUS = 'Shipped';

SELECT * FROM ORDERS
WHERE ORDER_DATE = '17-FEB-17'
ORDER BY TOTAL ASC;

SELECT * FROM ORDERS
WHERE ORDER_DATE != TO_DATE('2017-08-15', 'YYYY-MM-DD')
ORDER BY TOTAL DESC;

SELECT * FROM ORDERS
WHERE STATUS = 'Pending' OR STATUS = 'Shipped'
AND TOTAL > 400000
ORDER BY ORDER_DATE ASC;