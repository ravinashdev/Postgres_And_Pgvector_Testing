-- Upper Lower INICAP--------------------------
-- Upper
SELECT UPPER ('amazing chicken');
SELECT
	UPPER (first_name) as first_name,
	UPPER (last_name) as last_name
FROM users;
-- Lower
SELECT LOWER ('AMAZING CHICKEN');
SELECT
	LOWER (first_name) as first_name,
	LOWER (last_name) as last_name
FROM users;
-- Initcap
SELECT INITCAP ('amazing chicken');
SELECT
	INITCAP (first_name) as first_name,
	INITCAP (last_name) as last_name
FROM users;

-- LEFT & RIGHT--------------------------
-- returns the n character Left or Right from the string starting at index 1
-- =D
SELECT LEFT ('ABCD', 1);
-- =A
SELECT RIGHT ('ABCD', 1);
-- =AB
-- Negative N omits the characters instead o including them
SELECT LEFT ('ABCD', -2);

-- REVERSE--------------------------
-- reverses the order of the string
SELECT REVERSE ('amazing chicken');

-- SPLIT_PART--------------------------
-- splits a string on a specidifed delimiter and returns the nth string
-- =C
SELECT SPLIT_PART ('A|B|C|D','|', 3);

-- TRIM, BTRIM, LTRIM, RTRIM
-- Remove specified characters (spaces are by default) unless specified otherwise
SELECT
	TRIM (
		LEADING
		FROM
			'      Amazing PostgresSQL'
	),
	TRIM(
		TRAILING
		FROM
			'Amazing PostgresSQL     '
	),
	TRIM(
		'Amazing PostgresSQL'
	);
SELECT
	TRIM (
		LEADING '0'
		FROM
			CAST (0000012345 AS TEXT)
	);

SELECT
	LTRIM ('yummy','y');
SELECT
	RTRIM ('yummy','y');
SELECT
	BTRIM ('yummy','y');

-- LPAD and RPAD--------------------------
-- Pads the string to the left or right with a specified character to a specified length (including string length)
-- (spaces added by default) if none provided
SELECT LPAD ('Database',15,'*');
SELECT RPAD ('Database',15,'*');

-- LENGTH--------------------------
SELECT LENGTH ('Amazing PostgresSQL')

-- POSITION--------------------------
-- Returns the first instance location of substring in a string index starts at 1 (case sensitive)
SELECT POSITION ('2026' in 'Amazing PostgreSQL 2026');

-- STRPOS--------------------------
SELECT STRPOS ('Amazing PostgreSQL 2026','2026');

-- SUBSTRING--------------------------
-- Returns the specified substring given the index range of the string starting at 1
SELECT SUBSTRING('What a wonderful world' FROM 1 for 4);

-- REPEAT--------------------------
-- Repeats a string n number of times
SELECT REPEAT('R',4);

-- REPLACE--------------------------
-- Replaces all occurences of a substring with another (case sensitive)
SELECT REPLACE('Ryen','e','a');