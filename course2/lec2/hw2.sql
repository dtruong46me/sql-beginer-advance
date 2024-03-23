--1--
BEGIN
    FOR V_EMPLOYEE IN (
        SELECT
            E.EMP_ID,
            E.FIRST_NAME,
            E.LAST_NAME,
            D.DEPT_ID,
            D.NAME
        FROM
            EMPLOYEE E
            JOIN DEPARTMENT D
            ON E.DEPT_ID = D.DEPT_ID
        WHERE
            E.ASSIGNED_BRANCH_ID = 1
        ORDER BY
            E.EMP_ID ASC
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('ID: '
                             || V_EMPLOYEE.EMP_ID
                             || '  -  '
                             || V_EMPLOYEE.FIRST_NAME
                             || ' '
                             || V_EMPLOYEE.LAST_NAME);
        DBMS_OUTPUT.PUT_LINE('Department ID: '
                             || V_EMPLOYEE.DEPT_ID
                             || '   -  Department: '
                             || V_EMPLOYEE.NAME);
        DBMS_OUTPUT.PUT_LINE(' ');
    END LOOP;
END;
 --2--
DECLARE
    V_LEVEL            VARCHAR2(20);
    V_COUNT_OPEN_ACC   NUMBER;
    V_OPEN_EMPLOYEE_ID NUMBER := 10;
BEGIN
    SELECT
        COUNT(ACCOUNT_ID) INTO V_COUNT_OPEN_ACC
    FROM
        ACCOUNT
    WHERE
        OPEN_EMP_ID = V_OPEN_EMPLOYEE_ID;
    IF V_COUNT_OPEN_ACC <= 1 THEN
        V_LEVEL := 'LOW';
    ELSIF V_COUNT_OPEN_ACC > 2 AND V_COUNT_OPEN_ACC <= 4 THEN
        V_LEVEL := 'AVG';
    ELSIF V_COUNT_OPEN_ACC > 4 AND V_COUNT_OPEN_ACC <= 6 THEN
        V_LEVEL := 'MODERATE';
    ELSE
        V_LEVEL := 'HIGH';
    END IF;

    DBMS_OUTPUT.PUT_LINE('Employee ID: '
                         || V_OPEN_EMPLOYEE_ID);
    DBMS_OUTPUT.PUT_LINE('Number of account opened: '
                         || V_COUNT_OPEN_ACC);
    DBMS_OUTPUT.PUT_LINE('Level: '
                         || V_LEVEL);
END;
 --3--
DECLARE
    V_YEAR  NUMBER := 2000;
    V_COUNT NUMBER := 0;
    V_TOTAL NUMBER := 0;
BEGIN
    FOR V_YEAR IN 2000 .. 2005 LOOP
        SELECT
            COUNT(ACCOUNT_ID) INTO V_COUNT
        FROM
            ACCOUNT
        WHERE
            EXTRACT(YEAR FROM OPEN_DATE) = V_YEAR;
        DBMS_OUTPUT.PUT_LINE(' + Year: '
                             || V_YEAR
                             || '   Total accounts: '
                             || V_COUNT);
        V_TOTAL := V_TOTAL + V_COUNT;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Total accounts opened from 2000 -> 2005: '
                         || V_TOTAL);
END;
 --4--
DECLARE
    CURSOR C_EMPLOYEE IS
    SELECT
        EMP_ID,
        FIRST_NAME,
        LAST_NAME
    FROM
        EMPLOYEE;
    V_FIRST_DATE DATE;
BEGIN
    FOR C IN C_EMPLOYEE LOOP
        SELECT
            MIN(OPEN_DATE) INTO V_FIRST_DATE
        FROM
            ACCOUNT
        WHERE
            OPEN_EMP_ID = C.EMP_ID;
        IF V_FIRST_DATE IS NULL THEN
            V_FIRST_DATE := SYSDATE;
        END IF;

        DBMS_OUTPUT.PUT_LINE('Employee ID: '
                             || C.EMP_ID
                             || '   '
                             || C.FIRST_NAME
                             || ' '
                             || C.LAST_NAME);
        DBMS_OUTPUT.PUT_LINE('First Date: '
                             || TO_CHAR(V_FIRST_DATE, 'DD/MM/YYYY'));
        DBMS_OUTPUT.PUT_LINE(' ');
    END LOOP;

    DBMS_OUTPUT.PUT_LINE(' ');
END;
 --5--
DECLARE
    CURSOR C_EMPLOYEES IS
    SELECT
        EMP_ID,
        FIRST_NAME,
        LAST_NAME,
        START_DATE
    FROM
        EMPLOYEE;
    V_EXP_YEARS NUMBER;
    V_SALARY    NUMBER;
BEGIN
    FOR C IN C_EMPLOYEES LOOP
        V_EXP_YEARS := ROUND(MONTHS_BETWEEN(SYSDATE, C.START_DATE) / 12);
        IF V_EXP_YEARS > 13 THEN
            V_SALARY := 8000;
        ELSIF V_EXP_YEARS > 11 AND V_EXP_YEARS <= 13 THEN
            V_SALARY := 5000;
        ELSIF V_EXP_YEARS > 9 AND V_EXP_YEARS <= 11 THEN
            V_SALARY := 3000;
        ELSIF V_EXP_YEARS > 7 AND V_EXP_YEARS <= 9 THEN
            V_SALARY := 2000;
        ELSIF V_EXP_YEARS > 4 AND V_EXP_YEARS <= 7 THEN
            V_SALARY := 1000;
        END IF;

        DBMS_OUTPUT.PUT_LINE(RPAD(C.EMP_ID, 15)
                             || RPAD(C.FIRST_NAME
                             || ' '
                             || C.LAST_NAME, 30)
                        || RPAD(C.START_DATE, 15)
                           || V_SALARY);
    END LOOP;
END;
