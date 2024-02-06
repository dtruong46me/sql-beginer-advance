
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
