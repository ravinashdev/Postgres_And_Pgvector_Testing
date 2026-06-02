-- Data type comversion------------------------
-- Implicit conversion is done automatically
-- TO_CHAR converts any data type to a string (expression, format mask or how the data should look)
SELECT
	TO_CHAR(
		333,
		'999'
	);

SELECT
	release_date,
	TO_CHAR(release_date, 'DD-MM-YYY'),
	TO_CHAR(release_date, 'Dy, MM, YYY')
FROM movies;

SELECT
	TO_CHAR(
		TIMESTAMP '2020-01-010 10:30:59',
		'HH24:MI:SS'
	);

FROM movies;

SELECT
	movie_id,
	revenues_domestic,
	TO_CHAR(revenues_domestic, '$99999D99')
FROM movies_revenues;

-- TO_NUMBER (expression, format mask or how the data should look)
SELECT TO_NUMBER(
	'1420.89',
	'9999.99'
);

	-- Currency
SELECT TO_NUMBER(
	'$1420.89',
	'L9G999.99'
);

-- TO_DATE (expression, format mask or how the data should look)
SELECT TO_DATE(
	'March 07, 2019',
	'Month DD, YYYY'
);

-- TO_TIMESTAMP (expression, format mask or how the data should look)
SELECT TO_TIMESTAMP(
	'2020-10-28 10:30:25',
	'YYYY-MM-DD HH:MI:SS'
);