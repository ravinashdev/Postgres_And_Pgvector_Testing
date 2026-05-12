-- Operators
-- Use parenthsis always when you can
-- 1. Comparison
-- = , >, <, >=, <=, <> != (Not Equal TO)
-- 2. Logical
-- AND
-- OR
-- LIKE
-- IN
-- BETWEEN
-- 3. Aritmetic
-- +,-,/,*,%(Modulo)

-- Using WHERE clause to add specific conditions
-- SELECT
-- 	columnname
-- FROM tablename
-- WHERE
-- 	conditions
-- If you alias the columns in the SELECT clause you cannot use them in the WHERE clause
-- PostgresSQL order of operations FROM -> WHERE -> SELECT -> ORDER BY
-- ________________=_________________
SELECT
	DISTINCT *
FROM movies
WHERE
	-- MUST be single quote '' not ""
	movie_lang = 'English';
-- ________________<>_________________
SELECT
	DISTINCT *
FROM movies
WHERE
	-- MUST be single quote '' not ""
	movie_lang <> 'English';
-- ______________AND <>_________________
SELECT
	DISTINCT *
FROM movies
WHERE
	-- MUST be single quote '' not ""
	movie_lang <> 'English'
	AND
	age_certificate = '18';
-- ______________OR <>_________________
SELECT
	DISTINCT *
FROM movies
WHERE
	-- MUST be single quote '' not ""
	movie_lang <> 'English'
	OR
	age_certificate = '18';
-- ______________AND OR _______________
SELECT
	DISTINCT *
FROM movies
WHERE
	-- MUST be single quote '' not ""
	(
	movie_lang = 'English'
	OR
	movie_lang = 'Chinese'
	)
	AND
	age_certificate = '12'
ORDER BY
	movie_lang ASC;
-- ______________> | < _______________
SELECT
	movie_length as "Run Time (Mins)",
	movie_name
FROM movies
WHERE
	movie_length >= 100
ORDER BY
	movie_length DESC;
-- __________Dates >< (Type Cast)________
SELECT
	movie_length AS "Run Time (Mins)",
	movie_name AS "Title",
	release_date AS "Release Date"
FROM movies
WHERE
	release_date >= '2000-01-01'
ORDER BY
	release_date DESC;
-- __________String >< (Type Cast)________
-- Evaluates to everything after the letter 'E' alphabetically
SELECT
	movie_length AS "Run Time (Mins)",
	movie_name AS "Title",
	release_date AS "Release Date",
	movie_lang AS "Language"
FROM movies
WHERE
	movie_lang > 'English'
ORDER BY
	movie_lang ASC;

--______________ LIMIT & OFFSET_____________
--______________ LIMIT_____________
SELECT
	movie_length AS "Run Time (Mins)",
	movie_name AS "Title"
FROM movies
ORDER BY
	movie_length DESC
LIMIT 5;
--______________ LIMIT & WHERE_____________
SELECT
	first_name ||' '|| last_name AS "Full name",
	date_of_birth AS "DOB",
	nationality AS "Country of Birth"
FROM directors
WHERE
	nationality = 'American'
ORDER BY
	date_of_birth ASC
LIMIT 5;
-- ---------------------
SELECT
	first_name ||' '|| last_name AS "Full name",
	date_of_birth AS "DOB",
	gender AS "Sex"
FROM actors
WHERE
	gender = 'F'
ORDER BY
	date_of_birth DESC
LIMIT 10;
-- -----------------------
SELECT
*
FROM movies_revenues
ORDER BY
	revenues_domestic DESC NULLS LAST
LIMIT 10;
--______________OFFSET_____________
-- Will offset the start of the limit by 5 records down
SELECT
*
FROM movies_revenues
ORDER BY
	revenues_domestic DESC NULLS LAST
LIMIT 10 OFFSET 5;

--______________ FETCH_____________
-- FETCH {FIRST|NEXT}[row_count]{ROW|ROWS} ONLY
SELECT
*
FROM movies
FETCH FIRST 5 ROW ONLY;
-- -----------------------
SELECT
*
FROM movies
ORDER BY
	movie_length DESC NULLS LAST
FETCH FIRST 5 ROW ONLY;
-- -----------------------
SELECT
*
FROM directors
ORDER BY
	date_of_birth ASC NULLS LAST
FETCH FIRST 5 ROW ONLY;
-- -----------------------
SELECT
*
FROM actors
WHERE gender = 'F'
ORDER BY
	date_of_birth DESC NULLS LAST
FETCH FIRST 10 ROW ONLY;
-- -----------------------
SELECT
*
FROM movies
ORDER BY
	movie_length DESC NULLS LAST
OFFSET 5
FETCH NEXT 5 ROW ONLY;

--______________ IN and NOT IN_____________
SELECT
*
FROM movies
WHERE(
	movie_lang = 'English'
	OR
	movie_lang = 'Chinese'
	OR
	movie_lang = 'Japanese'
	)
ORDER BY
	movie_lang ASC NULLS LAST;
	-- USING IN Version Below equivalent
SELECT
*
FROM movies
WHERE
	movie_lang IN ('English', 'Chinese', 'Japanese')
ORDER BY
	movie_lang ASC NULLS LAST;

SELECT
*
FROM movies
WHERE
	movie_lang NOT IN ('English', 'Chinese', 'Japanese')
ORDER BY
	movie_lang ASC NULLS LAST;

--______________ BETWEEN and NOT BETWEEN___(<=x<=)______
SELECT
*
FROM actors
WHERE
	date_of_birth BETWEEN '1991-01-01' AND '1995-12-31'
ORDER BY
	date_of_birth ASC NULLS LAST;

SELECT
*
FROM actors
WHERE
	date_of_birth NOT BETWEEN '1991-01-01' AND '1995-12-31'
ORDER BY
	date_of_birth ASC NULLS LAST;

--______________ LIKE and ILIKE________________
-- % matches any sequence of zero or more characters
-- _ underscore matches any single character
-- value LIKE pattern
-- value ILIKE pattern
-------------- full character search------------
SELECT 'hello' LIKE 'hello';
---------- partial character search using %--------
SELECT 'hello' LIKE 'h%';
SELECT 'hello' LIKE '%e%';
-- FALSE
SELECT 'hello' LIKE '%ell';
---------- single character search using _--------
SELECT 'hello' LIKE '_ello';
SELECT 'hello' LIKE '_el__';
---------- partial & single character search using % and _--------
SELECT 'hello' LIKE '%ll_'
-- ---------EXAMPLES-------------
SELECT
*
FROM actors
WHERE
-- Case sensitive
	first_name LIKE 'A%'
ORDER BY
	first_name ASC NULLS LAST;

SELECT
*
FROM actors
WHERE
	last_name LIKE '%a'
ORDER BY
	last_name ASC NULLS LAST;

SELECT
*
FROM actors
WHERE
-- Case sensitive
	first_name LIKE '_____'
ORDER BY
	first_name ASC NULLS LAST;

SELECT
*
FROM actors
WHERE
-- Case sensitive
	first_name LIKE '_l%'
ORDER BY
	first_name ASC NULLS LAST;

SELECT
*
FROM actors
WHERE
--  NOT Case sensitive ILIKE
	first_name ILIKE 'al%'
ORDER BY
	first_name ASC NULLS LAST;

--______________is NULL and is NOT NULL________________
SELECT
*
FROM movies_revenues
WHERE
	revenues_domestic is NULL
	AND
	revenues_international is NULL
ORDER BY
	movie_id ASC;

SELECT
*
FROM movies_revenues
WHERE
	revenues_domestic is NOT NULL
	AND
	revenues_international is NOT NULL
ORDER BY
	movie_id ASC;
--______________Concatenation Techniques________________
-- SELECT 'string1' || 'string2' AS new_string;
-- SELECT CONCAT('column1','column2') AS new_string;
-- SELECT CONCAT_WS('|','column1','column2') AS new_string;
SELECT 'hello' || 'world' as new_string;
SELECT 'hello' ||' '||'world' as new_string;
-- ----CONCAT------
SELECT
-- MUST use Double Quotes to Alias new column name with a space "Actor Name"
	CONCAT_WS(' ',first_name,last_name) AS "Actor Name",
	date_of_birth AS "DOB"
FROM actors
ORDER BY
	last_name;
-- ----CONCAT W/NULL------
-- Adding NULL Produces NULL for everything
SELECT 'hello' || NULL ||'world' as new_string;
-- With CONCAT NULL is NOT ignored
SELECT
	revenues_domestic,
	revenues_international,
	CONCAT(revenues_domestic,revenues_international) AS "Total Revenue"
FROM movies_revenues
ORDER BY
	"Total Revenue" DESC NULLS FIRST;
-- With CONCAT_WS NULL is ignored
SELECT
	revenues_domestic,
	revenues_international,
	CONCAT_WS('|',revenues_domestic,revenues_international) AS "Total Revenue"
FROM movies_revenues
ORDER BY
	"Total Revenue" DESC NULLS FIRST;

