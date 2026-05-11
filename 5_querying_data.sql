-- Select all from table
-- SELECT * FROM tablename
-- SQL keywords are by default case insensitive but the convention
 -- is to to use uppercase for easy readability
 -- Postgres evaluates the FROM clause before the SELECT clause
 -- Use * wisely to prevent clogging the data pipeline performance
SELECT * FROM actors;
select * from actors;
-- Better to use select SELECT columnname to limit results if you know what you're looking for
-- SELECT column1,column2 FROM tablename
SELECT first_name, last_name FROM actors;
SELECT movie_name, movie_lang FROM movies;

-- Adding Aliases (AS is optional but conventional for readability)
-- SELECT columnname AS alias_name, columnname AS alias_name FROM tablename
-- use double quotes to persist capitalization, spaces of aliases as Postgres defaults to lowercase
SELECT
	first_name AS firstname,
	last_name AS "Last Name's"
FROM actors;

-- Using SELECT statement for expressions using || to join 2 columns and Alias the new concatenated column
SELECT first_name, last_name FROM actors;
SELECT first_name || ' ' ||last_name AS full_name FROM actors;


-- Using ORDER BY to sort records
-- SELECT
-- 	column_name
-- FROM tablename
-- ORDER BY order of columns matters
-- 	sort_expression [ASC|DESC] ASC is by default,
-- 	....
-- 	sort_expression [ASC|DESC] ASC is by default
SELECT
	first_name AS "Given Name",
	last_name AS "Surname",
	date_of_birth AS "DOB"
FROM actors
ORDER BY
	-- columnname nd alias are both acceptable
	date_of_birth DESC,
	"Surname" ASC;

-- Using ORDER BY to sort records by expressions
SELECT
	first_name AS "Given Name",
	LENGTH(first_name) AS "Character Length"
FROM actors
ORDER BY
	"Character Length" DESC;

-- Using ORDER BY to sort records by columnname or number
-- both statements below are equivalent for results
SELECT
	first_name AS "Given Name",
	date_of_birth AS "DOB"
FROM actors
ORDER BY
	"Given Name" ASC NULLS LAST,
	"DOB" DESC NULLS LAST;
-- NUMBER (Does not start at index 0 starts at 1) better to use explicit name
-- add nulls first or last, nulls last is default
SELECT
	first_name AS "Given Name",
	last_name AS "Surname",
	date_of_birth AS "DOB"
FROM actors
ORDER BY
	1 ASC NULLS LAST,
	3 DESC NULLS LAST;

-- Selecting Distinct values (Group Duplicate Values)
SELECT
	DISTINCT
	movie_lang AS "Language",
	age_certificate AS "Age Group"
FROM movies
ORDER BY
	"Age Group" ASC;
-- Get all unique records in a table
SELECT
	DISTINCT *
FROM movies
ORDER BY
	movie_id ASC;