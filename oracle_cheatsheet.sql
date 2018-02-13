-- SELECT
SELECT *
FROM beverages
WHERE field1 = 'Kona'
AND field2 = 'coffee'
AND field3 = 122;


-- SELECT INTO
SELECT name,address,phone_number
INTO v_employee_name,v_employee_address,v_employee_phone_number
FROM employee
WHERE employee_id = 6;


-- INSERT
-- insert using the VALUES keyword
INSERT INTO table_name VALUES ('Value1', 'Value2', ... );
INSERT INTO table_name( Column1, Column2, ... ) VALUES ( 'Value1', 'Value2', ... );
-- insert using a SELECT statement
INSERT INTO table_name( SELECT Value1, Value2, ... from table_name );
INSERT INTO table_name( Column1, Column2, ... ) ( SELECT Value1, Value2, ... from table_name );


-- DELETE
-- deletes rows that match the criteria
DELETE FROM table_name WHERE some_column=some_value
DELETE FROM customer WHERE sold = 0;


-- UPDATE
-- updates the entire column of that table
UPDATE customer SET state='CA';
-- updates the specific record of the table eg:
UPDATE customer SET name='Joe' WHERE customer_id=10;
-- updates the column invoice as paid when paid column has more than zero.
UPDATE movies SET invoice='paid' WHERE paid > 0;

-- SEQUENCES
-- CREATE SEQUENCE
-- The syntax for a sequence is:
-- CREATE SEQUENCE sequence_name
--      MINVALUE value
--      MAXVALUE value
--      START WITH value
--      INCREMENT BY value
--      CACHE value;

CREATE SEQUENCE supplier_seq
MINVALUE 1
MAXVALUE 999999999999999999999999999
START WITH 1
INCREMENT BY 1
CACHE 20;


-- ALTER SEQUENCE
-- Increment a sequence by a certain amount:
ALTER SEQUENCE <sequence_name> INCREMENT BY <integer>;
ALTER SEQUENCE seq_inc_by_ten  INCREMENT BY 10;
-- Change the maximum value of a sequence:
ALTER SEQUENCE <sequence_name> MAXVALUE <integer>;
ALTER SEQUENCE seq_maxval  MAXVALUE  10;
-- Set the sequence to cycle or not cycle:
ALTER SEQUENCE <sequence_name> <CYCLE | NOCYCLE>;
ALTER SEQUENCE seq_cycle NOCYCLE;
-- Configure the sequence to cache a value:
ALTER SEQUENCE <sequence_name> CACHE <integer> | NOCACHE;
ALTER SEQUENCE seq_cache NOCACHE;
-- Set whether or not to return the values in order
ALTER SEQUENCE <sequence_name> <ORDER | NOORDER>;
ALTER SEQUENCE seq_order NOORDER;
ALTER SEQUENCE seq_order;


-- Generate query from a string
PROCEDURE oracle_runtime_query_pcd IS
     TYPE ref_cursor IS REF CURSOR;
     l_cursor        ref_cursor;
 
     v_query         varchar2(5000);
     v_name          varchar2(64);
 BEGIN
     v_query := 'SELECT name FROM employee WHERE employee_id=5';
     OPEN l_cursor FOR v_query;
     LOOP
        FETCH l_cursor INTO v_name;         
        EXIT WHEN l_cursor%NOTFOUND; 
     END LOOP;
     CLOSE l_cursor;
 END;


-- String operations
-- Length
SELECT length('hello world') FROM dual;
SELECT lengthb('hello world') FROM dual;
SELECT lengthc('hello world') FROM dual;
SELECT length2('hello world') FROM dual;
SELECT length4('hello world') FROM dual;


-- Instr
instr( 'oracle pl/sql cheatsheet', '/');
instr( 'oracle pl/sql cheatsheet', 'e', 1, 2);
instr( 'oracle pl/sql cheatsheet', '/', 12, 1);


-- Replace
replace('i am here','am','am not');


-- Substr
SELECT substr( 'oracle pl/sql cheatsheet', 8, 6) FROM dual;
SELECT substr( 'oracle pl/sql cheatsheet', 15) FROM dual;
SELECT substr('oracle pl/sql cheatsheet', -10, 5) FROM dual;


-- Trim
trim ('   removing spaces at both sides     ');
ltrim ('   removing spaces at the left side     ');
rtrim ('   removing spaces at the right side     ');


-- Tables
-- Create table
CREATE TABLE employee
(id int, name varchar(20));

-- Add column
ALTER TABLE employee
ADD (id int)

-- Modify column
ALTER TABLE employee
MODIFY( sickHours s float );

-- Drop column
ALTER TABLE employee
DROP COLUMN vacationPay;


-- Displaying constraints
-- Selecting referential constraints
SELECT
        c_list.CONSTRAINT_NAME as NAME,
        c_src.TABLE_NAME as SRC_TABLE,
        c_src.COLUMN_NAME as SRC_COLUMN,
        c_dest.TABLE_NAME as DEST_TABLE,
        c_dest.COLUMN_NAME as DEST_COLUMN
FROM ALL_CONSTRAINTS c_list, 
     ALL_CONS_COLUMNS c_src, 
     ALL_CONS_COLUMNS c_dest
WHERE c_list.CONSTRAINT_NAME = c_src.CONSTRAINT_NAME
  AND c_list.R_CONSTRAINT_NAME = c_dest.CONSTRAINT_NAME
  AND c_list.CONSTRAINT_TYPE = 'R'
GROUP BY c_list.CONSTRAINT_NAME,
          c_src.TABLE_NAME,
         c_src.COLUMN_NAME,
         c_dest.TABLE_NAME,
         c_dest.COLUMN_NAME;

-- Setting constraints on a table
CREATE TABLE suppliers
(
    supplier_id  numeric(4),  
    supplier_name  varchar2(50),  
    CONSTRAINT check_supplier_id
    CHECK (supplier_id BETWEEN 100 and 9999)
);

-- Unique Index on a table
CREATE TABLE customer
(
    id   integer not null,
    name varchar2(20),
    CONSTRAINT customer_id_constraint UNIQUE (id)
);

-- Adding unique constraints
ALTER TABLE employee
ADD CONSTRAINT uniqueEmployeeId UNIQUE(employeeId) USING INDEX ourcompanyIndx_tbs;

-- Deleting constraints
ALTER TABLE employee
DROP CONSTRAINT uniqueEmployeeId;