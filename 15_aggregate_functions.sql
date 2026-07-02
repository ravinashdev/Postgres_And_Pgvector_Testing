-- COUNT-----------------------------
SELECT COUNT(*) FROM movies;
-- specific column
SELECT COUNT(movie_id) FROM movies;
-- distinct
SELECT
	COUNT(DISTINCT(movie_lang))
FROM movies;
-- WHERE
SELECT
	COUNT(*)
FROM movies
WHERE
	movie_lang = 'English';

-- SUM-----------------------------
-- Only can be run on integers
SELECT
	SUM(revenues_domestic)
FROM movies_revenues;

-- Filter all NULL and duplicate
SELECT
	SUM(DISTINCT(revenues_domestic))
FROM movies_revenues;

-- MIN MAX-----------------------------
SELECT
	MIN(revenues_domestic)
FROM movies_revenues;

SELECT
	MAX(revenues_domestic)
FROM movies_revenues;

SELECT
	*
FROM movies
WHERE
	movie_lang = 'English';
ORDER BY release_date DESC;

SELECT
	MAX (release_date)
FROM movies
WHERE
	movie_lang = 'English';

-- GREATEST LEAST-----------------------------
-- used for a list of integers of all same data type
-- different from MAX since it doesn't accept DISTINCT keyword
SELECT GREATEST (200,1,-6,89);
SELECT LEAST (200,1,-6,89);

-- AVG-----------------------------
SELECT
	AVG(revenues_domestic),
	SUM(revenues_domestic)
FROM movies_revenues;

-- Combinig columns with mathematical operators
SELECT 2+10 AS addition;
SELECT 2-10 AS subtraction;
SELECT 22/7::numeric(10,2) AS division;
SELECT 11*2::numeric(10,2) AS multiplication;
SELECT 22%7::numeric(10,2) AS modulus;

SELECT
	movie_id,
	revenues_domestic,
	revenues_international,
	(revenues_domestic + revenues_international) AS "total revenue"
FROM movies_revenues
WHERE (revenues_domestic + revenues_international) IS NOT NULL
ORDER BY 4 DESC NULLS LAST;