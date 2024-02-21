
--1--  
BEGIN
    FOR v_employee IN (
        SELECT 
            E.EMP_ID,
            E.FIRST_NAME,
            E.LAST_NAME,
            D.DEPT_ID,
            D.NAME
        FROM EMPLOYEE E
        JOIN DEPARTMENT D
            ON E.DEPT_ID = D.DEPT_ID
        WHERE E.ASSIGNED_BRANCH_ID = 1
        ORDER BY E.EMP_ID ASC) LOOP
        
        DBMS_OUTPUT.PUT_LINE('ID: ' || v_employee.EMP_ID ||  '  -  ' || v_employee.FIRST_NAME || ' ' || v_employee.LAST_NAME);
        DBMS_OUTPUT.PUT_LINE('Department ID: ' || v_employee.DEPT_ID || '   -  Department: ' || v_employee.NAME);
        DBMS_OUTPUT.PUT_LINE(' ');
    END LOOP;
END;



--2--
DECLARE
    v_level VARCHAR2(20);
    v_count_open_acc NUMBER;
    v_open_employee_id NUMBER := 10;
BEGIN
    SELECT COUNT(ACCOUNT_ID)
    INTO v_count_open_acc
    FROM ACCOUNT
    WHERE OPEN_EMP_ID = v_open_employee_id;

    IF v_count_open_acc <= 1 THEN
        v_level := 'LOW';
    ELSIF v_count_open_acc > 2 AND v_count_open_acc <= 4 THEN
        v_level := 'AVG';
    ELSIF v_count_open_acc > 4 AND v_count_open_acc <= 6 THEN
        v_level := 'MODERATE';
    ELSE
        v_level := 'HIGH';
    END IF;

    DBMS_OUTPUT.PUT_LINE('Employee ID: ' || v_open_employee_id);
    DBMS_OUTPUT.PUT_LINE('Number of account opened: ' || v_count_open_acc);
    DBMS_OUTPUT.PUT_LINE('Level: ' || v_level);
END;



--3--
DECLARE
    v_year NUMBER := 2000;
    v_count NUMBER := 0;
    V_total NUMBER := 0;
BEGIN
    FOR v_year IN 2000 .. 2005 LOOP
        SELECT COUNT(ACCOUNT_ID)
        INTO v_count
        FROM ACCOUNT
        WHERE EXTRACT(YEAR FROM OPEN_DATE) = v_year;

        DBMS_OUTPUT.PUT_LINE(' + Year: ' || v_year || '   Total accounts: ' || v_count);
        
        v_total := v_total + v_count;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Total accounts opened from 2000 -> 2005: ' || v_total);
END;


--4--
DECLARE
    CURSOR c_employee IS
        SELECT
            EMP_ID,
            FIRST_NAME,
            LAST_NAME
        FROM EMPLOYEE;

    v_first_date DATE;
BEGIN
    FOR c IN c_employee LOOP
        SELECT MIN(OPEN_DATE)
        INTO v_first_date
        FROM ACCOUNT
        WHERE OPEN_EMP_ID = c.EMP_ID;

        IF v_first_date IS NULL THEN
            v_first_date := SYSDATE;
        END IF;

        DBMS_OUTPUT.PUT_LINE('Employee ID: ' || c.EMP_ID || '   ' || c.FIRST_NAME || ' ' || c.LAST_NAME);
        DBMS_OUTPUT.PUT_LINE('First Date: ' || TO_CHAR(v_first_date, 'DD/MM/YYYY'));
        DBMS_OUTPUT.PUT_LINE(' ');
    END LOOP;

    DBMS_OUTPUT.PUT_LINE(' ');
END;


--5--
SELECT * FROM EMPLOYEE

DECLARE
    CURSOR c_employee IS
        SELECT * from EMPLOYEE;

        
BEGIN

END
