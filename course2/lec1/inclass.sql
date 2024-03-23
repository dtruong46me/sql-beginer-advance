--1--
DECLARE
    v_EmpName EMPLOYEE.FIRST_NAME%TYPE;

BEGIN
    SELECT FIRST_NAME
    INTO v_EmpName
    FROM EMPLOYEE
    WHERE EMP_ID=1;

    DBMS_OUTPUT.PUT_LINE('First Name: '||v_EmpName);
END;
/

--2--
DECLARE
    v_Employee EMPLOYEE%ROWTYPE;
    v_EmpID NUMBER := 2;
BEGIN
    SELECT *
    INTO v_Employee
    FROM EMPLOYEE
    WHERE EMP_ID = v_EmpID;

    DBMS_OUTPUT.PUT_LINE('Full Name: ' || v_Employee.FIRST_NAME || ' ' || v_Employee.LAST_NAME);
END;
/

--3--
DECLARE
    v_Employee EMPLOYEE%ROWTYPE;
    v_EmpID NUMBER := 2;
BEGIN
    SELECT *
    INTO v_Employee
    FROM EMPLOYEE
    WHERE EMP_ID=v_EmpID;

    DBMS_OUTPUT.PUT_LINE('ID: ' || v_Employee.EMP_ID);
    DBMS_OUTPUT.PUT_LINE('First Name: ' || v_Employee.FIRST_NAME);
    DBMS_OUTPUT.PUT_LINE('Last Name: ' || v_Employee.LAST_NAME);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No found!');
END;
/

--4--
DECLARE
    v_Cust NUMBER := 1;
    v_Customer CUSTOMER%ROWTYPE;
BEGIN
    SELECT *
    INTO v_Customer
    FROM CUSTOMER
    WHERE CUST_ID=v_Cust;

    DBMS_OUTPUT.PUT_LINE('Customer ID: ' || v_Customer.CUST_ID);
    DBMS_OUTPUT.PUT_LINE('Address: ' || v_Customer.ADDRESS);
    DBMS_OUTPUT.PUT_LINE('City: ' || v_Customer.CITY);
    DBMS_OUTPUT.PUT_LINE('Type CD: ' || v_Customer.CUST_TYPE_CD);
    DBMS_OUTPUT.PUT_LINE('FED ID: ' || v_Customer.FED_ID);
    DBMS_OUTPUT.PUT_LINE('Postal Code: ' || v_Customer.POSTAL_CODE);
    DBMS_OUTPUT.PUT_LINE('State: ' || v_Customer.STATE);
END;
/

--5--
DECLARE
    TYPE temp_table IS TABLE OF EMPLOYEE%ROWTYPE;
    my_table temp_table;
BEGIN
    SELECT * BULK COLLECT
    INTO my_table
    FROM EMPLOYEE;

    FOR i IN my_table.FIRST..my_table.LAST
        LOOP
        DBMS_OUTPUT.PUT_LINE('ID: '||my_table(i).EMP_ID);
        DBMS_OUTPUT.PUT_LINE('First name: '||my_table(i).FIRST_NAME);
        DBMS_OUTPUT.PUT_LINE('Last name: '||my_table(i).LAST_NAME);
        DBMS_OUTPUT.PUT_LINE('---');
    END LOOP;
END;
/