--1--
MERGE INTO HOCVIEN_CUSTOMER AS HV
USING (
    SELECT
                 CUST_ID,
                 ADDRESS,
                 CITY,
                 CUST_TYPE_CD,
                 FED_ID,
                 STATE
    FROM
                 CUSTOMER
) AS C
ON HV.CUST_ID = C.CUST_ID
WHEN MATCHED THEN
    UPDATE SET HV.CUST_TYPE_CD = C.CUST_TYPE_CD
    WHERE HV.CUST_TYPE_CD != C.CUST_TYPE_CD
WHEN NOT MATCHED THEN
    INSERT (HV.CUST_ID, HV.ADDRESS, HV.CITY, HV.CUST_TYPE_CD, HV.FED_ID, HV.STATE)
    VALUES (C.CUST_ID, C.ADDRESS, C.CITY, C.CUST_TYPE_CD, C.FED_ID, C.STATE);

--2--
SELECT
    P.PRODUCT_CD,
    SUM(A.AVAIL_BALANCE)                                   TOTAL_AVAIL,
    ROW_NUMBER() OVER (ORDER BY SUM(A.AVAIL_BALANCE) DESC) AS RANK_AVAIL_BALANCE
FROM
    PRODUCT P
    JOIN ACCOUNT A
    ON P.PRODUCT_CD = A.PRODUCT_CD
GROUP BY
    P.PRODUCT_CD;

--3--
SELECT
    P.PRODUCT_CD,
    SUM(A.AVAIL_BALANCE)                                   TOTAL_AVAIL,
    DENSE_RANK() OVER (ORDER BY SUM(A.AVAIL_BALANCE) DESC) AS RANK_AVAIL_BALANCE
FROM
    PRODUCT P
    JOIN ACCOUNT A
    ON P.PRODUCT_CD = A.PRODUCT_CD
GROUP BY
    P.PRODUCT_CD;

--4--
SELECT
    P.PRODUCT_CD,
    SUM(A.AVAIL_BALANCE)                             TOTAL_AVAIL,
    RANK() OVER (ORDER BY SUM(A.AVAIL_BALANCE) DESC) AS RANK_AVAIL_BALANCE
FROM
    PRODUCT P
    JOIN ACCOUNT A
    ON P.PRODUCT_CD = A.PRODUCT_CD
GROUP BY
    P.PRODUCT_CD;

--5--
WITH SUM_AVAIL_BALANCE AS (
    SELECT
        NAME,
        EXTRACT(YEAR FROM TXN_DATE) AS YEAR,
        SUM(AT.AMOUNT)              AS SUM_AMOUNT
    FROM
        BRANCH       B
        JOIN ACCOUNT A
            ON A.OPEN_BRANCH_ID = B.BRANCH_ID
        JOIN ACC_TRANSACTION AT
            ON AT.ACCOUNT_ID = A.ACCOUNT_ID
    GROUP BY
        NAME,
        EXTRACT(YEAR FROM AT.TXN_DATE)
    ORDER BY
        NAME, YEAR
)
SELECT
    NAME,
    YEAR,
    SUM_AMOUNT,
    LAG(SUM_AMOUNT, 1) OVER(
        ORDER BY YEAR
    ) AS PREVIOUS_SUM_AMOUNT
FROM SUM_AVAIL_BALANCE;


--6--
WITH SUM_AVAIL_BALANCE AS (
    SELECT
        NAME,
        EXTRACT(YEAR FROM TXN_DATE) AS YEAR,
        SUM(AT.AMOUNT) AS SUM_AMOUNT
    FROM BRANCH B 
    JOIN ACCOUNT A
        ON A.OPEN_BRANCH_ID = B.BRANCH_ID
    JOIN ACC_TRANSACTION AT
        ON AT.ACCOUNT_ID = A.ACCOUNT_ID
    GROUP BY
        NAME,
        EXTRACT(YEAR FROM AT.TXN_DATE)
    ORDER BY
        NAME, YEAR
)
SELECT
    NAME,
    YEAR,
    SUM_AMOUNT,
    LEAD(SUM_AMOUNT, 1) OVER (
        PARTITION BY NAME
        ORDER BY YEAR
    ) AS NEXT_SUM_AMOUNT
FROM SUM_AVAIL_BALANCE;

--7--
SELECT 
    NAME,
    EXTRACT(YEAR FROM AT.TXN_DATE) AS YEAR,
    SUM(AT.AMOUNT) AS SUM_AMOUNT
FROM BRANCH B
JOIN ACCOUNT A
    ON A.OPEN_BRANCH_ID = B.BRANCH_ID
JOIN ACC_TRANSACTION AT
    ON AT.ACCOUNT_ID = A.ACCOUNT_ID
GROUP BY NAME, EXTRACT(YEAR FROM AT.TXN_DATE)
ORDER BY NAME, YEAR