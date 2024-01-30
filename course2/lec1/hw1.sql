--1--
DECLARE
    a NUMBER := 10;
    b NUMBER := 20;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Sum       : ' || (a+b));
    DBMS_OUTPUT.PUT_LINE('Mns       : ' || (a-b));
    DBMS_OUTPUT.PUT_LINE('Div       : ' || (a/b));
END;

--2--
DECLARE
    r FLOAT := 9.4;
    pi FLOAT := 3.141;
    s FLOAT;
BEGIN
    s := pi * r**2;
    DBMS_OUTPUT.PUT_LINE(s);
END;

--3--
DECLARE
    id NUMBER := 4;
    v_customer_id CUSTOMER.CUST_ID%TYPE;
    v_first_name INDIVIDUAL.FIRST_NAME%TYPE;
    v_last_name INDIVIDUAL.LAST_NAME%TYPE;
    v_address CUSTOMER.ADDRESS%TYPE;
    v_dob INDIVIDUAL.BIRTH_DATE%TYPE;

BEGIN
    SELECT 
        C.CUST_ID,
        I.FIRST_NAME,
        I.LAST_NAME,
        C.ADDRESS,
        I.BIRTH_DATE
    INTO
        v_customer_id,
        v_first_name,
        v_last_name,
        v_address,
        v_dob
    FROM CUSTOMER C
    JOIN INDIVIDUAL I 
        ON C.CUST_ID = I.CUST_ID
    WHERE C.CUST_ID = id;

    DBMS_OUTPUT.PUT_LINE('ID: ' || v_customer_id);
    DBMS_OUTPUT.PUT_LINE('Name: ' || v_first_name || ' ' || v_last_name);
    DBMS_OUTPUT.PUT_LINE('Address: ' || v_address);
    DBMS_OUTPUT.PUT_LINE('D.O.B: ' || v_dob);

END;

--4--
DECLARE
    v_customer_id INDIVIDUAL.CUST_ID%TYPE;
    v_first_name INDIVIDUAL.FIRST_NAME%TYPE;
    v_last_name INDIVIDUAL.LAST_NAME%TYPE;
    v_dob INDIVIDUAL.BIRTH_DATE%TYPE;

BEGIN
    SELECT DISTINCT
        I.CUST_ID,
        I.FIRST_NAME,
        I.LAST_NAME,
        I.BIRTH_DATE
    INTO
        v_customer_id,
        v_first_name,
        v_last_name,
        v_dob
    FROM INDIVIDUAL I 
    JOIN ACCOUNT A
        ON A.CUST_ID = I.CUST_ID
    WHERE
        I.CUST_ID IN (
            SELECT CUST_ID
            FROM ACCOUNT
            GROUP BY CUST_ID
            HAVING COUNT(ACCOUNT_ID) = (SELECT MAX(COUNT(ACCOUNT_ID)) FROM ACCOUNT GROUP BY CUST_ID))
        AND ROWNUM = 1;

    DBMS_OUTPUT.PUT_LINE('ID: ' || v_customer_id);
    DBMS_OUTPUT.PUT_LINE('Name: ' || v_first_name || ' ' || v_last_name);
    DBMS_OUTPUT.PUT_LINE('D.O.B: ' || v_dob);

END;

--5--
