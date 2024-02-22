--1--
DECLARE
    CURSOR C_PRODUCTS IS
    SELECT
        PRODUCT_CD,
        NAME
    FROM
        PRODUCT;
    V_PRODUCTS C_PRODUCTS%ROWTYPE;
BEGIN
    OPEN C_PRODUCTS;
    LOOP
        FETCH C_PRODUCTS INTO V_PRODUCTS;
        EXIT WHEN C_PRODUCTS%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Product CD: '
                             || V_PRODUCTS.PRODUCT_CD);
        DBMS_OUTPUT.PUT_LINE('Name         : '
                             || V_PRODUCTS.NAME);
        DBMS_OUTPUT.PUT_LINE(' ');
    END LOOP;

    CLOSE C_PRODUCTS;
END;
 --2--
DECLARE
    CURSOR C_INFOR IS
    SELECT
        A.CUST_ID,
        A.PRODUCT_CD,
        P.NAME
    FROM
        ACCOUNT A
        JOIN PRODUCT P
        ON A.PRODUCT_CD = P.PRODUCT_CD;
    V_INFOR C_INFOR%ROWTYPE;
BEGIN
    OPEN C_INFOR;
    LOOP
        FETCH C_INFOR INTO V_INFOR;
        EXIT WHEN C_INFOR%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Customer ID: '
                             || V_INFOR.CUST_ID
                             || '   - Product CD: '
                             || V_INFOR.PRODUCT_CD
                             || '   - Product Name: '
                             || V_INFOR.NAME);
    END LOOP;

    CLOSE C_INFOR;
END;
 --3--
DECLARE
    CURSOR C_CURSOR IS
    SELECT
        I.FIRST_NAME
        || ' '
        || I.LAST_NAME       AS NAME,
        SUM(A.AVAIL_BALANCE) AS AVAIL_BALANCE
    FROM
        CUSTOMER   C
        JOIN ACCOUNT A
        ON C.CUST_ID = A.CUST_ID
        JOIN INDIVIDUAL I
        ON I.CUST_ID = C.CUST_ID
    GROUP BY
        I.FIRST_NAME
        || ' '
        || I.LAST_NAME;
    V_CUSTOMER C_CURSOR%ROWTYPE;
    V_SEGMENT  VARCHAR2(20);
BEGIN
    OPEN C_CURSOR;
    LOOP
        FETCH C_CURSOR INTO V_CUSTOMER;
        IF V_CUSTOMER.AVAIL_BALANCE <= 4000 THEN
            V_SEGMENT := 'Low';
        ELSIF V_CUSTOMER.AVAIL_BALANCE > 4000 AND V_CUSTOMER.AVAIL_BALANCE <= 7000 THEN
            V_SEGMENT := 'Medium';
        ELSIF V_CUSTOMER.AVAIL_BALANCE > 7000 THEN
            V_SEGMENT := 'High';
        END IF;

        EXIT WHEN C_CURSOR%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Customer: '
                             || V_CUSTOMER.NAME);
        DBMS_OUTPUT.PUT_LINE('Balance: '
                             || V_CUSTOMER.AVAIL_BALANCE
                             || '   -   '
                             || V_SEGMENT);
        DBMS_OUTPUT.PUT_LINE(' ');
    END LOOP;

    CLOSE C_CURSOR;
END;
 --OTHER METHOD--
 --4--
DECLARE
    CURSOR C_INFOR IS
    SELECT
        A.CUST_ID,
        A.PRODUCT_CD,
        P.NAME
    FROM
        ACCOUNT A
        JOIN PRODUCT P
        ON A.PRODUCT_CD = P.PRODUCT_CD;
BEGIN
    FOR C IN C_INFOR LOOP
        DBMS_OUTPUT.PUT_LINE('Customer ID: '
                             || C.CUST_ID
                             || '   - Product CD: '
                             || C.PRODUCT_CD
                             || '   - Product Name: '
                             || C.NAME);
    END LOOP;
END;
 --5--
CREATE TABLE ETL_CUSTOMER_T1 ( CUST_ID NUMBER, SEGMENT VARCHAR2(20) NOT NULL, ETL_DATE DATE NOT NULL );
 -- SELECT * FROM ETL_CUSTOMER_T1;
DECLARE
    CURSOR C_INFO IS
    SELECT
        A.CUST_ID,
        I.FIRST_NAME,
        I.LAST_NAME,
        SUM(AVAIL_BALANCE) AS AVLB_BALANCE
    FROM
        ACCOUNT    A
        JOIN CUSTOMER C
        ON A.CUST_ID = C.CUST_ID
        JOIN INDIVIDUAL I
        ON I.CUST_ID = C.CUST_ID
    WHERE
        C.STATE = 'MA'
    GROUP BY
        I.FIRST_NAME,
        I.LAST_NAME,
        A.CUST_ID;
    V_LEVEL VARCHAR2(20);
    V_COUNT NUMBER;
BEGIN
    FOR C IN C_INFO LOOP
        IF C.AVLB_BALANCE <= 4000 THEN
            V_LEVEL := 'Low';
        ELSIF C.AVLB_BALANCE > 4000 AND C.AVLB_BALANCE <= 7000 THEN
            V_LEVEL := 'Medium';
        ELSE
            V_LEVEL := 'High';
        END IF;

        INSERT INTO ETL_CUSTOMER_T1 VALUES(
            C.CUST_ID,
            V_LEVEL,
            SYSDATE
        );
    END LOOP;

    COMMIT;
    SELECT
        COUNT(*) INTO V_COUNT
    FROM
        ETL_CUSTOMER_T1
    WHERE
        ETL_DATE = TRUNC(SYSDATE);
    DBMS_OUTPUT.PUT_LINE('Total rows insert: '
                         || V_COUNT);
    DBMS_OUTPUT.PUT_LINE('Finished: '
                         || SYSTIMESTAMP);
END;