
CREATE TABLE DBO.EMPLOYEE (EMPID INT,ENAME VARCHAR(20), DEPTNO INT);
GO
SELECT * FROM EMPLOYEE;
select * from EMPLOY;
update EMPLOY set ENAME='lokeshG';
insert into EMPLOY VALUES ('lokesh','lok@ymail'); 

-- ALTERING THE TABLE STRUCTURE
ALTER TABLE EMPLOY ADD DEPTNO INT;
ALTER TABLE EMPLOY ADD DUMMY INT;

ALTER TABLE EMPLOY ALTER COLUMN ENAME NVARCHAR(30);
ALTER TABLE EMPLOY DROP COLUMN DUMMY ;

-- DROP TABLE
CREATE TABLE DUMMY (NAME VARCHAR, ID INT);
DROP TABLE DUMMY;
SELECT *  FROM  DUMMY;

-- MANUPLATING  DATA 
SELECT *  FROM  EMPLOY;
insert into EMPLOY (ENAME) values ('kumar');
UPDATE  EMPLOY set DEPTNO=20 where empid=2; 
DELETE FROM EMPLOY WHERE DEPTNO=20;

-- CREATE SEQUENCE 

CREATE SEQUENCE EMPNO START WITH 1 INCREMENT BY 1 NO CACHE 
SELECT NEXT VALUE FOR EMPNO ;


