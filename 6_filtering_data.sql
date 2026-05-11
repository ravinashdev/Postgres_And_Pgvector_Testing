-- Operators
-- 1. Comparison
-- = , >, <, >=, <=, <> (Not Equal TO)
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