-- Data type conversion------------------------
-- Implicit conversion is done automatically
-- Explicit conversion is done vis conversion functions
SELECT
*
FROM movies;

-- Implicit
SELECT
*
FROM movies
WHERE
	movie_id = 1;

SELECT
*
FROM movies
WHERE
	movie_id = '1';
-- Explicit
SELECT
*
FROM movies
WHERE
	movie_id = INTEGER '1';

------------- CAST-------------
-- used to convert a value of one type to another data type
-- CAST (expression AS target_data_type);
-- String to Integer
SELECT
	CAST('10' AS INTEGER);
SELECT
	CAST('10n' AS INTEGER);

-- String to Date Conversion
SELECT
	CAST('2020-01-01' AS DATE),
	CAST('01-MAY-2020' AS DATE);

-- String to Boolean
SELECT
	CAST('true' AS BOOLEAN),
	CAST('false' AS BOOLEAN),
	CAST('0' AS BOOLEAN),
	CAST('1' AS BOOLEAN);

-- String to double
SELECT
	CAST('14.7888' AS DOUBLE PRECISION);

------------- :: -------------
-- expression::type
-- Alternative to CAST
SELECT
	'10'::INTEGER,
	'2020-01-01'::DATE,
	'01-MAY-2020'::DATE;

-- String to Timestamp
SELECT '2020-02-20 10:30:25.467'::TIMESTAMP;

-- String to Interval
SELECT
	'10 minute'::INTERVAL,
	'4 hour':: INTERVAL,
	'1 DAY'::INTERVAL,
	'2 Week'::INTERVAL,
	'5 month'::INTERVAL;

------------Implicit to Explicit Conversions-------------
-- Using integer and factorial
SELECT factorial(20);
SELECT factorial(20) AS "Implicit result";
SELECT CAST(factorial(20) AS BIGINT) AS "Explicit result";
-- Round with numeric
SELECT ROUND(10,4) AS "Implicit result";
SELECT ROUND(CAST(10 AS NUMERIC),4) AS "Explicit result";
-- CAST with text SUBSTR is a slice
SELECT SUBSTR('123456',2) AS "result";
SELECT
	SUBSTR('123456',2) AS "Implicit",
	SUBSTR(CAST('123456' AS TEXT),2) AS "Explicit";

-----------------Table Data Conversions------------------
CREATE TABLE ratings (
	rating_id SERIAL PRIMARY KEY,
	rating VARCHAR(1) NOT NULL
);

SELECT
*
FROM ratings;

INSERT INTO ratings (rating) VALUES
('A'),
('B'),
('C'),
('D');

INSERT INTO ratings (rating) VALUES
('1'),
('2'),
('3'),
('4');

-- CASE Statement
SELECT
	rating_id,
	CASE
		WHEN rating~E'^\\d+$' THEN
			CAST (rating AS INTEGER)
		ELSE
			0
		END AS rating
FROM ratings;