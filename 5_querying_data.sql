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