--User defined data types
SELECT * FROM locations;
--Address TYPE
-- Define the doamian
CREATE DOMAIN addr VARCHAR(100) NOT NULL;
-- Utilize it here
CREATE TABLE locations(
	address addr
);
INSERT INTO locations (address) VALUES ('44 E New York Ave, Somers Point, NJ');

-- Positive Numeric
CREATE DOMAIN positive_numeric INT NOT NULL CHECK (VALUE>0);
ALTER TABLE locations
ADD COLUMN positive_numbers positive_numeric DEFAULT 1;
INSERT INTO locations (positive_numbers) VALUES (-10);

-- Postal Code
CREATE DOMAIN us_post_code AS TEXT
CHECK (
    VALUE ~ '^\d{5}$'
    OR VALUE ~ '^\d{5}-\d{4}$'
);

ALTER TABLE locations
ADD COLUMN postal_code us_post_code;

UPDATE locations SET postal_code = '08824';

-- Email address
CREATE DOMAIN email AS TEXT
CHECK(
	VALUE ~ '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
);
ALTER TABLE locations
ADD COLUMN email_address email;

UPDATE locations SET email_address = 'email@email.com';

-- Enum or SET of Values
CREATE DOMAIN valid_color AS VARCHAR(10)
CHECK (
VALUE IN ('red','green','blue')
);

ALTER TABLE locations
ADD COLUMN color valid_color;

UPDATE locations SET color = 'yellow';
UPDATE locations SET color = 'green';

-- Get a list or of all Domains or drop a Domain listed under Schema in PGAdmin tool or use commands below
SELECT typname
FROM pg_catalog.pg_type
JOIN pg_catalog.pg_namespace
ON pg_namespace.oid = pg_type.typnamespace
WHERE
typtype = 'd' and nspname = 'public';

-- DROP DOMAIN 'name' CASCADE
-- will drop and delete the entire column of data associated

-- CREATE TYPES Composite
CREATE TYPE address AS (
	city VARCHAR(50),
	country VARCHAR(20)
);

ALTER TABLE locations
ADD COLUMN composite_address address;
INSERT INTO locations (address) VALUES(ROW('Somers Point, NJ'));

SELECT (address).country FROM locations WHERE (address).city = 'NJ' ;

-- ENUM
CREATE TYPE currency AS ENUM ('USD','EUR','GBP');
ALTER TABLE locations
ADD COLUMN currency currency DEFAULT 'EUR';
UPDATE locations SET currency = 'USD';
SELECT 'USD'::currency;

-- To drop a Data type use the command below
-- DROP TYPE type_name
-- ALTER data types
CREATE TYPE myadress AS (
	city VARCHAR(50),
	country VARCHAR(20)
);

ALTER TYPE myadress RENAME TO my_address;