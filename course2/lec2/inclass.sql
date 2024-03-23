
--1--
DECLARE
    v_balance ACCOUNT.AVAIL_BALANCE%TYPE;
    v_customer_id NUMBER := 3;
BEGIN
    SELECT SUM(AVAIL_BALANCE) 
    INTO v_balance
    FROM ACCOUNT
    WHERE CUST_ID = v_customer_id;
    DBMS_OUTPUT.PUT_LINE('Customer ID: ' || v_customer_id);
    DBMS_OUTPUT.PUT_LINE('Balance: ' || v_balance);
    IF v_balance > 1000 THEN
        DBMS_OUTPUT.PUT_LINE('>> Your balance is currently greater than 1000$.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('>> Your balance is not exceed 1000$.');
    END IF;
END;

--2--

-- Method 1 --
BEGIN
    FOR department_info IN (SELECT * FROM DEPARTMENT) LOOP
        DBMS_OUTPUT.PUT_LINE('ID: ' || department_info.DEPT_ID);
        DBMS_OUTPUT.PUT_LINE('Name: ' || department_info.NAME);
    END LOOP;
END;

-- Method 2 --
DECLARE
    TYPE DepartmentTable IS TABLE OF DEPARTMENT%ROWTYPE;
    v_department_table DepartmentTable;
BEGIN
    SELECT *
    BULK COLLECT INTO v_department_table
    FROM DEPARTMENT;

    FOR i IN v_department_table.FIRST..v_department_table.LAST LOOP
        DBMS_OUTPUT.PUT_LINE('ID: ' || v_department_table(i).DEPT_ID);
        DBMS_OUTPUT.PUT_LINE('Name: ' || v_department_table(i).NAME);
        
    END LOOP;
END;


--3--
DECLARE
    TYPE Transaction IS TABLE OF ACC_TRANSACTION%ROWTYPE;
    v_transactions Transaction;
BEGIN
    SELECT *
    BULK COLLECT INTO v_transactions
    FROM ACC_TRANSACTION
    WHERE TXN_DATE > TO_DATE('25-01-2004', 'DD-MM-YYYY')
    ORDER BY TXN_DATE DESC
    FETCH FIRST 10 ROWS ONLY;

    FOR i in v_transactions.FIRST..v_transactions.LAST LOOP
        DBMS_OUTPUT.PUT_LINE('Date: ' || v_transactions(i).TXN_DATE);
        DBMS_OUTPUT.PUT_LINE('Ammount: ' || v_transactions(i).AMOUNT);
        DBMS_OUTPUT.PUT_LINE(' ');
    END LOOP;
END;


--4--
DECLARE
    v_trans_amt NUMBER;
    c_start_date DATE := TO_DATE('24-01-2004', 'DD-MM-YYYY');
    c_end_date DATE := TO_DATE('28-02-2004', 'DD-MM-YYYY');
    
    v_date DATE;
    i NUMBER := 1;
BEGIN
    v_date := c_start_date;
    WHILE TRUE LOOP
        BEGIN
            SELECT AMOUNT 
            INTO v_trans_amt
            FROM ACC_TRANSACTION
            WHERE TXN_DATE = v_date;
            DBMS_OUTPUT.PUT_LINE('Date: ' || TO_CHAR(v_date, 'DD/MM/YYYY') || '  |  Amount: ' || v_trans_amt);
        EXCEPTION
            WHEN no_data_found THEN
                DBMS_OUTPUT.PUT_LINE('Date: ' || TO_CHAR(v_date, 'DD/MM/YYYY') || '  |  Amount: ' || 0);
        END;
        v_date := v_date + 1;
        EXIT WHEN v_date > c_end_date;
    END LOOP;
END;