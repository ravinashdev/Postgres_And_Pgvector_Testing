-- A sequence is an ordered list of integers
CREATE SEQUENCE IF NOT EXISTS test_seq;
-- To return the next value of the sequence
SELECT nextval('test_seq5');
-- To return the current value of the sequence
SELECT currval('test_seq');
-- Set value of the sequence
SELECT setval('test_seq',100);
-- Set value of the sequence with no skip
SELECT setval('test_seq',100,false);
-- Set initial value of the sequence
CREATE SEQUENCE IF NOT EXISTS test_seq2 START WITH 100;
-- Restart a sequence
ALTER SEQUENCE test_seq RESTART with 100;
-- Rename a sequence
ALTER SEQUENCE test_seq RENAME TO my_seq;
-- Multiple sequence parameters to create a sequence
CREATE SEQUENCE IF NOT EXISTS test_seq3
START WITH 500
INCREMENT 50
MINVALUE 500
MAXVALUE 6000;
-- Specify the Data Type
CREATE SEQUENCE IF NOT EXISTS test_seq4 AS SMALLINT;
-- Create a descending sequence and cycle (start again when it reaches floor) or no cycle (produces error)
CREATE SEQUENCE IF NOT EXISTS test_seq5
START WITH 3
INCREMENT -1
MINVALUE 1
MAXVALUE 3
CYCLE;
-- Dropping a sequence
DROP SEQUENCE <name>;

-- Attach a sequence to an existing table column
CREATE TABLE users2(
	user_id SERIAL PRIMARY KEY,
	user_name VARCHAR(50)
);
INSERT INTO users2 (user_name) VALUES ('Ryan');
INSERT INTO users2 (user_name) VALUES ('Aleks');
INSERT INTO users2 (user_name) VALUES ('Nalini');
SELECT * FROM users2;
ALTER SEQUENCE users2_user_id_seq RESTART WITH 100;

-- Attach a sequence to an new table column
CREATE TABLE users3(
	user_id INT PRIMARY KEY,
	user_name VARCHAR(50)
);
SELECT * FROM users3;
-- 1. Create the sequence
CREATE SEQUENCE IF NOT EXISTS user3_user_id_seq
START WITH 100 OWNED BY users3.user_id;
-- 2. Alter the table and attach sequence
ALTER TABLE users3
ALTER COLUMN user_id SET DEFAULT nextval ('user3_user_id_seq');
INSERT INTO users3 (user_name) VALUES ('Ryan');
INSERT INTO users3 (user_name) VALUES ('Aleks');
INSERT INTO users3 (user_name) VALUES ('Nalini');

-- List all sequences in a DB
SELECT relname sequence_name
FROM pg_class
WHERE
relkind = 'S';

-- Share sequence amongst 2 or more tables
CREATE SEQUENCE IF NOT EXISTS common_fruits_seq START WITH 100;

CREATE TABLE apples_sequence_shared(
	fruit_id INT DEFAULT nextval('common_fruits_seq') NOT NULL,
	fruit_name VARCHAR(50)
);

CREATE TABLE bananas_sequence_shared(
	fruit_id INT DEFAULT nextval('common_fruits_seq') NOT NULL,
	fruit_name VARCHAR(50)
);

INSERT INTO apples_sequence_shared (fruit_name) VALUES ('big_apple');
INSERT INTO bananas_sequence_shared (fruit_name) VALUES ('big_bananas');
SELECT * FROM apples_sequence_shared;
SELECT * FROM bananas_sequence_shared;

-- Alphanumeric Sequence
CREATE SEQUENCE table_sequence;

CREATE TABLE contacts(
	contact_id TEXT NOT NULL DEFAULT ('ID'|| nextval('table_sequence')),
	contact_name VARCHAR(150)
);

INSERT INTO contacts (contact_name) VALUES ('Ryan');
INSERT INTO contacts (contact_name) VALUES ('Aleks');
INSERT INTO contacts (contact_name) VALUES ('Nalini');

SELECT * FROM contacts;

