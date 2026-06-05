--Constraints are the rules enforced on data columns on table
--Used to prevent invalid data entries in to your database
--Ensures accuracy and reliability of the data in the database
--They can exist at the column or the table level

--CONSTRAINT TYPES

--NOT NULL: field must have a value: column level

--UNIQUE: only unique values are allowed no duplicates in a column or columns: column level
--tablename_columnname_key in Constraints
--multiple columns
CREATE TABLE table_products(
    id SERIAL PRIMARY KEY,
    product_code varchar(10),
    product_name text,
    UNIQUE (product_code,product_name  )
)
--adding the constraint after table has already been created
ALTER TABLE table_products
ADD CONSTRAINT unique_product_code UNIQUE (product_code, product_name);

--DEFAULT: Set a default value: column level
--If no value is provided for DEFAULT NULL becomes the DEFAULT
--Reassign the default
ALTER TABLE table_name
ALTER COLUMN column SET DEFAULT

--PRIMARY KEY: Uniquely identifies each row or record in the database table: table level
--Can be single or multiple columns to create a composite primary key when none of the data is UNIQUE in one specific column
--Order of the composite key is VERY important
CREATE TABLE t_grades(
    course_id VARCHAR(100) NOT NULL,
    student_id VARCHAR(100) NOT NULL,
    grade int NOT NULL,
    PRIMARY KEY (course_id,student_id)
)
--HOWEVER ONLY 1 PRIMARY KEY CONSTRAINT can exist per table
--Combination of a UNIQUE and NOT NULL Constraint
--table_name.pkey

--FOREIGN KEY: Constrains data based on columns in other table: table level
--Plays the most important ROLE in PostgreSQL
--Common field between the Parent Table and the Child Table
CREATE TABLE table_name(
    columnname data_type PRIMARY KEY,
    ...
    ...
    FOREIGN KEY (columnname) REFERENCES child_table_name (columnname)
)
-- Foreign Key -----------------------------------------
-- Tables without a Foreign Key
CREATE TABLE t_products(
	product_id INT PRIMARY KEY,
	product_name VARCHAR(100) NOT NULL,
	supplier_id INT NOT NULL
);

CREATE TABLE t_suppliers(
	supplier_id INT PRIMARY KEY,
	supplier_name VARCHAR(100) NOT NULL
);

INSERT INTO t_suppliers(supplier_id,supplier_name) VALUES
(1, 'Supplier 1'),
(2, 'Supplier 2');

SELECT * FROM t_suppliers;

INSERT INTO t_products(product_id,product_name,supplier_id) VALUES
(1, 'Pen', 1),
(2, 'Paper',2);

SELECT * FROM t_products;

-- This will be added because the 2 tables are mutually independent
-- even though both contain a shared column supplier_id
INSERT INTO t_products(product_id,product_name,supplier_id) VALUES
(3, 'Computer', 10);

-- Tables with a Foreign Key(MUST MATCH Keys between the Tables)
DROP TABLE t_suppliers;
DROP TABLE t_products;

-- 1. Foreign table MUST be created first CHILD
CREATE TABLE t_suppliers(
	supplier_id INT PRIMARY KEY,
	supplier_name VARCHAR(100) NOT NULL
);
-- 2. Primary table is created after PARENT
CREATE TABLE t_products(
	product_id INT PRIMARY KEY,
	product_name VARCHAR(100) NOT NULL,
	supplier_id INT NOT NULL,
	FOREIGN KEY (supplier_id) REFERENCES t_suppliers (supplier_id)
);

INSERT INTO t_suppliers(supplier_id,supplier_name) VALUES
(1, 'Supplier 1'),
(2, 'Supplier 2');

SELECT * FROM t_suppliers;

INSERT INTO t_products(product_id,product_name,supplier_id) VALUES
(1, 'Pen', 1),
(2, 'Paper',2);

SELECT * FROM t_products;

-- This will NOT be added because the 2 tables are related
-- because both contain a shared column supplier_id that match and is referenced as a foreign key
INSERT INTO t_products(product_id,product_name,supplier_id) VALUES
(3, 'Computer', 10);

INSERT INTO t_suppliers(supplier_id,supplier_name) VALUES
(3, 'Supplier 3');

-- Will work now becuase the CHILD table contains the matching foreign key
INSERT INTO t_products(product_id,product_name,supplier_id) VALUES
(3, 'Computer', 3);
-- Wont work becuase both tables require the data integrity of the foreign key to exist
DELETE FROM t_suppliers WHERE supplier_id = 3;
UPDATE t_products
SET supplier_id = 100
WHERE
	product_id = 1;

-- Dropping a Foreign Key Table Constraint
ALTER TABLE tablename
DROP CONSTRAINT cname;
-- Update a Foreign Key Table Constraint
-- 1. Must drop first
-- 2. Then create a new one


--CHECK: Checks all values meet specific criteria: column or table level
-- Check Constraint -----------------------------------------
-- Allows you to specify if values in a column meet a specific criteria beore they are inserted or updated
CREATE TABLE staff (
	staff_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	birth_date DATE CHECK (birth_date > '1900-01-01'),
	joined_date DATE CHECK (joined_date > birth_date),
	salary NUMERIC CHECK (salary > 0)
);

SELECT * FROM staff;

-- Will work
INSERT INTO staff VALUES(1,'ryan','ramdehol','09-10-1990', '06-04-2026', 10000000);
-- Wont work due to constraint
INSERT INTO staff VALUES(1,'ryan','ramdehol','09-10-1990', '06-04-1989', 10000000);

-- Add Check Constraint ater table is created
ALTER TABLE tablename
ADD CONSTRAINT constraint_name
CHECK (
	col1 operator
	AND
	col2 operator
	AND
	col3 operator
)