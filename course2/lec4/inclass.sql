
--1--
DROP SEQUENCE dt_my_seq;
CREATE SEQUENCE dt_my_seq 
    START WITH 1 
    INCREMENT BY 1
    MINVALUE 1
    MAXVALUE 10
    CYCLE
    CACHE 2;

DECLARE
    my_val NUMBER;
BEGIN
    FOR i IN 1..10 LOOP
        SELECT dt_my_seq.NEXTVAL INTO my_val FROM DUAL;
        DBMS_OUTPUT.PUT_LINE('Next Value: ' || my_val);
    END LOOP;

    SELECT dt_my_seq.CURRVAL INTO my_val FROM DUAL;
    DBMS_OUTPUT.PUT_LINE('Current Value: ' || my_val);
END;


--2--
CREATE TABLE dt_my_table (
    ID NUMBER PRIMARY KEY,
    TITLE VARCHAR2(255) NOT NULL
);

DECLARE
BEGIN
    INSERT INTO dt_my_table (id, title)
        VALUES (dt_my_seq.NEXTVAL, 'Value 1');
    INSERT INTO dt_my_table (id, title)
        VALUES (dt_my_seq.NEXTVAL, 'Value 2');
END;

SELECT * FROM dt_my_table;

--3--
DROP TABLE dt_my_table;

CREATE TABLE dt_tasks (
    id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title VARCHAR2(255) NOT NULL
);

BEGIN
    INSERT INTO dt_tasks(title) VALUES ('Task 1');
    INSERT INTO dt_tasks(title) VALUES ('Task 2');
    INSERT INTO dt_tasks(title) VALUES ('Task 3');
END;

SELECT * FROM dt_tasks;