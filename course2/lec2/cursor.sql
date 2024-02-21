
--1--
DECLARE
    CURSOR c_products IS
        SELECT 
            PRODUCT_CD,
            NAME
        FROM PRODUCT;
    v_products c_products%ROWTYPE;
BEGIN
    OPEN c_products;
        LOOP
            FETCH c_products INTO v_products;
            EXIT WHEN c_products%notfound;
            DBMS_OUTPUT.PUT_LINE('Product CD: ' || v_products.PRODUCT_CD);
            DBMS_OUTPUT.PUT_LINE('Name         : ' || v_products.NAME);
            DBMS_OUTPUT.PUT_LINE(' ');
        END LOOP;
    CLOSE c_products;
END;


--2--
DECLARE
    CURSOR c_infor IS
        SELECT
            A.CUST_ID,
            A.PRODUCT_CD,
            P.NAME
        FROM ACCOUNT A
        JOIN PRODUCT P
            ON A.PRODUCT_CD = P.PRODUCT_CD;
    v_infor c_infor%ROWTYPE;
BEGIN
    OPEN c_infor;
        LOOP
            FETCH c_infor INTO v_infor;
            EXIT WHEN c_infor%notfound;
            DBMS_OUTPUT.PUT_LINE('Customer ID: ' || v_infor.CUST_ID || '   - Product CD: ' || v_infor.PRODUCT_CD || '   - Product Name: ' || v_infor.NAME);
        END LOOP;
    CLOSE c_infor;
END;


--3--
DECLARE
    CURSOR c_cursor IS
        SELECT
            I.FIRST_NAME || ' ' || I.LAST_NAME AS NAME,
            SUM(A.AVAIL_BALANCE) AS AVAIL_BALANCE
        FROM CUSTOMER C
        JOIN ACCOUNT A
            ON C.CUST_ID = A.CUST_ID
        JOIN INDIVIDUAL I
            ON I.CUST_ID = C.CUST_ID
        GROUP BY I.FIRST_NAME || ' ' || I.LAST_NAME;
    
    v_customer c_cursor%ROWTYPE;
    v_segment VARCHAR2(20);
BEGIN
    OPEN c_cursor;
        LOOP
            FETCH c_cursor INTO v_customer;
            IF v_customer.AVAIL_BALANCE <= 4000 
                THEN v_segment := 'Low';
            ELSIF v_customer.AVAIL_BALANCE > 4000 AND v_customer.AVAIL_BALANCE <= 7000
                THEN v_segment := 'Medium';
            ELSIF v_customer.AVAIL_BALANCE > 7000
                THEN v_segment := 'High';
            END IF;

            EXIT WHEN c_cursor%notfound;

            DBMS_OUTPUT.PUT_LINE('Customer: ' || v_customer.NAME);
            DBMS_OUTPUT.PUT_LINE('Balance: ' || v_customer.AVAIL_BALANCE || '   -   ' || v_segment);
            DBMS_OUTPUT.PUT_LINE(' ');
        END LOOP;
    CLOSE c_cursor;
END;

--OTHER METHOD--


--4--
DECLARE
    CURSOR c_infor IS
        SELECT
            A.CUST_ID,
            A.PRODUCT_CD,
            P.NAME
        FROM ACCOUNT A
        JOIN PRODUCT P
            ON A.PRODUCT_CD = P.PRODUCT_CD;
BEGIN
    FOR c IN c_infor LOOP
        DBMS_OUTPUT.PUT_LINE('Customer ID: ' || c.CUST_ID || '   - Product CD: ' || c.PRODUCT_CD || '   - Product Name: ' || c.NAME);
    END LOOP;
END;


--5--
CREATE TABLE ETL_CUSTOMER_T1 (
    CUST_ID NUMBER,
    SEGMENT VARCHAR2(20) NOT NULL,
    ETL_DATE DATE NOT NULL
);

-- SELECT * FROM ETL_CUSTOMER_T1;

DECLARE
    CURSOR c_info IS
        SELECT 
            A.CUST_ID,
            I.FIRST_NAME,
            I.LAST_NAME,
            SUM(AVAIL_BALANCE) AS AVLB_BALANCE          
        FROM ACCOUNT A
        JOIN CUSTOMER C ON A.CUST_ID = C.CUST_ID
        JOIN INDIVIDUAL I ON I.CUST_ID = C.CUST_ID
        WHERE C.STATE = 'MA'
        GROUP BY I.FIRST_NAME, I.LAST_NAME, A.CUST_ID;

    v_level VARCHAR2(20);
    v_count NUMBER;

BEGIN
    FOR c IN c_info LOOP
        IF c.AVLB_BALANCE <= 4000 THEN
            v_level := 'Low';
        ELSIF c.AVLB_BALANCE > 4000 AND c.AVLB_BALANCE <= 7000 THEN
            v_level := 'Medium';
        ELSE
            v_level := 'High';
        END IF;

        INSERT INTO ETL_CUSTOMER_T1 VALUES(c.CUST_ID, v_level, SYSDATE);
    END LOOP;
        COMMIT;
        SELECT COUNT(*) INTO v_count
        FROM ETL_CUSTOMER_T1
        WHERE ETL_DATE = TRUNC(SYSDATE);

    DBMS_OUTPUT.PUT_LINE('Total rows insert: ' || v_count);
    DBMS_OUTPUT.PUT_LINE('Finished: ' || SYSTIMESTAMP);
END;