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
select * from customers;
-- Update single colunmn
UPDATE customers
SET age = 30
WHERE customer_id = 2
-- Update multiple colunmns
UPDATE customers
SET
email = 'myemail@gmail.com',
age = 36
WHERE customer_id = 1