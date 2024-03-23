
CREATE TABLE TRUONG_CUSTOMER (
    CUSTOMER_ID NUMBER NOT NULL,
    NAME VARCHAR2(255,BYTE) NOT NULL,
    ADDRESS VARCHAR2(255) NULL,
    WEBSITE VARCHAR2(255) NULL,
    CREDIT_LIMIT NUMBER(8,2) NULL
);

ALTER TABLE TRUONG_CUSTOMER
ADD STAGE VARCHAR2(10);

INSERT INTO TRUONG_CUSTOMER VALUES (1,"Danahere","47 Mockingbird Ln","http://www.raytheon.com",600,"MA");
INSERT INTO TRUONG_CUSTOMER VALUES (2,"J.Collin","372 Clearwater Blvd","http://www.atheon.com",445,"MA");
INSERT INTO TRUONG_CUSTOMER VALUES (3,"Mia","18 Jessup Rd","http://www.jrorigin.com",676,"LS");
INSERT INTO TRUONG_CUSTOMER VALUES (4,"M.Alex","12 Buchanan Ln","http://www.howether.com",900,"NH");
INSERT INTO TRUONG_CUSTOMER VALUES (5,"Martin","105 E.Allendale Dr.Bloomington","http:www.gigi.com",577,"NH");
INSERT INTO TRUONG_CUSTOMER VALUES (6,"Emeson","Bloomington, HM","https:www.ensonrd.com",650,"AA");

DELETE FROM TRUONG_CUSTOMER WHERE NAME="Danahere";
DELETE FROM TRUONG_CUSTOMER WHERE CUSTOMER_ID=4;
DELETE FROM TRUONG_CUSTOMER WHERE CREDIT_LIMIT<500;

UPDATE TRUONG_CUSTOMER
SET WEBSITE="http://inda.vn"
WHERE CUSTOMER_ID=5;

UPDATE TRUONG_CUSTOMER
SET CREDIT_LIMIT=1200
WHERE CUSTOMER_ID=6;

CREATE TRUONG_CUSTOMER_BACKUP (
    CUSTOMER_ID NUMBER NOT NULL,
    NAME VARCHAR2(225) NOT NULL,
    ADDRESS VARCHAR2(225) NULL,
    WEBSITE VARCHAR(225) NULL,
    CREDIT_LIMIT VARCHAR2(225) NULL,
    STAGE VARCHAR2(10)
);

INSERT INTO TRUONG_CUSTOMER_BACKUP
SELECT * FROM TRUONG_CUSTOMER;

TRUNCATE TABLE TRUONG_CUSTOMER;

DROP TABLE TRUONG_CUSTOMER;