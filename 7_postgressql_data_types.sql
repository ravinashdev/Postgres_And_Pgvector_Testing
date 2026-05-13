-- When selecting Data Types always consider Operational cost!
--Boolean
--TRUE FALSE NULL, 'true', 'false',('y'),('n'),('1'),('0')
CREATE TABLE table_boolean(
    product_id SERIAL PRIMARY KEY,
	is_available BOOLEAN NOT NULL
);

INSERT INTO table_boolean(is_available) VALUES('n');

SELECT
*
FROM table_boolean
WHERE is_available = NOT FALSE;

-- SET DEFAULT VALUES for boolean columns
ALTER TABLE table_boolean
ALTER COLUMN is_available
SET DEFAULT FALSE;

INSERT INTO table_boolean(product_id) VALUES('8');

-- CHAR VARCHAR TEXT------------------------------
-- Useful to store text, numbers and symbols
-- CHAR(n) or character(10) = fixed length will pad or truncate to fit 'n'
-- VARCHAR(n) = varying length character with length limited no padd added but will truncate extra passed 'n'
-- TEXT, VARCHAR= variable unlimited length up to 1GB
-- CAST or :: is a datatype converter
SELECT CAST ('Ryan' AS char(10)) as "Name";
SELECT 'Aleks'::char(10) as "Name";
SELECT 'Aleks'::varchar(10) as "Name";

-- NUMERIC------------------------------
-- Can hold all number types EXCEPT NULL
-- INT: smallint, integer,bigint
-- SERIAL: smallserial, serial, bigserial (Auto generated)

-- DECIMALS------------------------------
-- precision = #'s to the left and right of the decimal point
-- scale = # of digits allowable to the right of the decimal point
-- FIXED POINT
-- numeric(precision,scale)
-- decimal(precision,scale)
-- FLOATING POINT
-- real = 6 decimals places precision
-- double = 15 decimal places precision

-- DATE/TIME------------------------------
-- DATE = Date only
-- TIME = Time only
-- TIMESTAMP = Date & Time
-- TIMESTAMPTZ = Date, Time & Timestamp Timezone
-- INTERVAL - Difference
-- DATE---------------
-- Format = YYYY-MM-DD
-- CURRENT_DATE = Current Date
-- NOW() = Current date & time
CREATE TABLE table_dates(
	id SERIAL PRIMARY KEY,
	employee_name varchar(100) NOT NULL,
	hire_date DATE NOT NULL,
	add_date DATE DEFAULT CURRENT_DATE
);
SELECT
*
FROM
table_dates;

INSERT INTO table_dates(employee_name, hire_date) VALUES
('Ryan','2026-10-01'),
('Aleks','2026-09-01'),
('Nalini','2026-08-01'),
('Richard','2026-07-01');

-- TIME---------------
-- Stores the time of day value HH:MM, HH:MM:SS, HHMMSS
-- Current time is server time
SELECT CURRENT_TIME;
SELECT CURRENT_TIME(4);
-- Local time location
SELECT LOCALTIME(4);
-- Arithematic Operation
SELECT time '10:00' - time '04:00' as RESULT;
-- Interval
-- interval('n type')
-- n = number
-- type = second, minute, hours, day, month, year
SELECT CURRENT_TIME + interval '2 hours' as RESULT;

-- TIMESTAMP & TIMESTAMPTZ----------
-- TIMESTAMP is UTC time GMT
-- TIMESTAMPTZ is converted from UTC to local timezone time when output but stored as UTC
CREATE TABLE table_time_tz (
	ts TIMESTAMP,
	tstz TIMESTAMPTZ
);
SELECT
*
FROM table_time_tz;
INSERT INTO table_time_tz (ts,tstz) VALUES
('2020-02-22 10:10:10-07', '2020-02-22 10:10:10-07');
SHOW TIMEZONE;
SET TIMEZONE = 'America/New York';
SELECT CURRENT_TIMESTAMP;
SELECT TIMEOFDAY();
SELECT NOW();
SELECT timezone('Asia/Singapore','2026-05-12 00:00:00');
SELECT timezone('America/New York','2026-05-12 00:00:00');

-- UUID---------------
-- Universal Unique Identifier unique to the known universe
-- 128-bit quantity 32 character hexadecimal alphanumeric separated by hyphens
-- need uuid-ossp module 3rd party
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
-- References MAC address and Timestamp
SELECT uuid_generate_v1();
-- Completely Random
SELECT uuid_generate_v4();
CREATE TABLE table_uuid (
	product_id UUID DEFAULT uuid_generate_v1(),
	product_name VARCHAR(100) NOT NULL
);
INSERT INTO table_uuid (product_name) VALUES
('Macbook Pro 2019'),
('Macbook Pro 2020'),
('Macbook Pro 2021'),
('Macbook Pro 2022'),
('Macbook Pro 2023');
SELECT
*
FROM table_uuid;

-- Alter the UUID to generate completly random
ALTER TABLE table_uuid
ALTER COLUMN product_id
SET DEFAULT uuid_generate_v4();
INSERT INTO table_uuid (product_name) VALUES
('Macbook Pro 2024'),
('Macbook Pro 2025'),
('Macbook Pro 2026');

-- ARRAY---------------
-- appending square brackets to the data string
CREATE TABLE table_array(
	id SERIAL PRIMARY KEY,
	product_array INTEGER[]
);
INSERT INTO table_array (product_array) VALUES
(ARRAY [1,2,3,4,5,6,7,8,9]);
SELECT
*
FROM
table_array;
-- Select the index inside the array of value start at 1
SELECT
	product_array[4]
FROM
	table_array;
-- Find where a particular value is
SELECT
	id
FROM
	table_array
WHERE
	product_array[4] = 4;


-- HSTORE---------------
-- This is a Data Type that stores the data in key:value pairs
CREATE EXTENSION IF NOT EXISTS hstore;
CREATE TABLE table_hstore(
	book_id SERIAL Primary KEY,
	title VARCHAR(100) NOT NULL,
	book_info hstore
);
INSERT INTO table_hstore(title,book_info) VALUES
(
'Title2',
'
	"publisher" => "NoteBooks",
	"paper_cost" => "$12",
	"ecost" => "$6"
'
);
SELECT
*
FROM table_hstore;
-- Select information in the hstore key:value pair
SELECT
book_info -> 'publisher' AS "Publisher",
book_info -> 'ecost' AS "Electronic Cost"
FROM
table_hstore;

-- JSON---------------
-- PostgresSQL has built in support for JSON
CREATE TABLE table_json(
	id SERIAL PRIMARY KEY,
	docs JSON
);
INSERT INTO table_json (docs) VALUES
('[1,2,3,4,5]'),
('{"key":"value"}');
SELECT
*
FROM table_json;

-- Need to alter the JSON type to JSONB to make @ operator work
ALTER TABLE table_json
ALTER COLUMN docs TYPE JSONB;
SELECT
*
FROM table_json
WHERE docs @>'2';

CREATE INDEX ON table_json USING GIN (docs jsonb_path_ops);


-- NETWORK ADDRESSESS-
-- Used to store network address types
-- data types: cidr, inet, macaddr, macaddr8, inet