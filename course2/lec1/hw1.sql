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
    v_CustomerID CUSTOMER.CUST_ID%TYPE;
    v_FirstName INDIVIDUAL.FIRST_NAME%TYPE;
    v_LastName INDIVIDUAL.LAST_NAME%TYPE;
    v_Address CUSTOMER.ADDRESS%TYPE;
    v_DOB INDIVIDUAL.BIRTH_DATE%TYPE;
BEGIN
    FOR i in CUST_ID.FIRST..CUST_ID.LAST:
        CALC_DATE(1)
    END LOOP;
END;