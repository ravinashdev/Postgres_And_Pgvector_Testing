-- create a customers table
create table customers(
	customer_id serial primary key,
	first_name varchar(50),
	last_name varchar(50),
	email varchar(150),
	age int
);
-- view the table
select * from customers;
-- insert data single record into the table
-- INSERT into tablename (column1,column2,..)
-- VALUES ('value1','value2',...);
insert into customers (first_name, last_name, email, age)
values ('Ryan','Ramdehol','email@gmail.com', 35);
-- view the table
select * from customers;

-- insert data multiple records into the table
-- INSERT into tablename (column1,column2,..)
-- VALUES
-- ('value1','value2',...),
-- ('value1','value2',...),
-- ('value1','value2',...),
-- ('value1','value2',...),;
insert into customers (first_name, last_name, email, age)
values
('Aleks','P','email@gmail.com', 31),
('Richard','K','email@gmail.com', 57),
('Nalini','B','email@gmail.com', 64);
-- view the table
select * from customers;

-- Returning to get back data from the affected rows
insert into customers (first_name, last_name, email, age)
values
('Aleks','P','email@gmail.com', 31),
('Richard','K','email@gmail.com', 57),
('Nalini','B','email@gmail.com', 64) RETURNING *;

-- Returning to get back data from the affected rows (specific column)
insert into customers (first_name, last_name, email, age)
values
('Aleks','P','email@gmail.com', 31),
('Richard','K','email@gmail.com', 57),
('Nalini','B','email@gmail.com', 64) RETURNING customer_id;

-- Update data in a table
-- UPDATE tablename
-- SET columnnmae = 'new value'
-- WHERE columnname = 'value'
-- view table
select * from customers
-- Update single colunmn
UPDATE customers;
SE age = 30
where customer_id = 2
-- view table
select * from customers;
-- Update multiple colunmns
UPDATE customers
SET
email = 'myemail@gmail.com',
age = 36
WHERE customer_id = 1

-- Update a row and returning updated row
UPDATE customers
SET
email = 'myemail@gmail.com',
age = 36
WHERE customer_id = 1
Returning *

-- Update ALL Records in the Table No Where Clause
UPDATE customers
SET
is_enabled = 'Y'
Returning *

-- Delete Records based on condition if want to delete all records omit clause
DELETE from customers
WHERE customer_id in  (4,5,6,7,8,9)
Returning *;

-- UPSERT (UPDATE or INSERT)
-- Will update a row if it already exists however if it doesn't it will insert a new row
-- INSERT INTO tablename (column_list)
-- VALUES (value_list)
-- ON CONFLICT target actions
-- actions can be : DO NOTHING, DO UPDATE SET column_1 = value_1, WHERE condition
CREATE TABLE t_tags(
	id SERIAL PRIMARY KEY,
	tag TEXT UNIQUE,
	date_stamp TIMESTAMP DEFAULT NOW()
);
-- View Table
SELECT * FROM t_tags

INSERT INTO t_tags (tag) values
('Pen'),
('Pencil');

-- DO NOTHING
INSERT INTO t_tags (tag)
VALUES
('Pen'),
('Pencil')
ON CONFLICT (tag) DO
NOTHING;

-- UPDATE SET Insert a record on conflict set new values
INSERT INTO t_tags (tag)
VALUES
('Marker')
ON CONFLICT (tag) DO
UPDATE SET
tag = EXCLUDED.tag,
date_stamp = NOW();

-- UPDATE SET Insert a record on conflict set new values pipe in new suffix to field name
INSERT INTO t_tags (tag)
VALUES
('Marker')
ON CONFLICT (tag) DO
UPDATE SET
-- pipe in string character to modify field
tag = EXCLUDED.tag || '1',
date_stamp = NOW();

