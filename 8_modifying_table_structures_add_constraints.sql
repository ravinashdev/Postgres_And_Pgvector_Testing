CREATE TABLE persons (
	person_id SERIAL PRIMARY KEY,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20) NOT NULL
);

SELECT
*
FROM users;

-- Modify Table Structure---------------------------
-- Adding a column
ALTER TABLE persons
ADD COLUMN age INT NOT NULL;
ALTER TABLE persons
ADD COLUMN nationality VARCHAR(20) NOT NULL;
ALTER TABLE persons
ADD COLUMN email VARCHAR(100) UNIQUE;
-- Rename a Table
ALTER TABLE persons
RENAME TO users;
-- Rename a column
ALTER TABLE users
RENAME COLUMN age TO person_age;
-- Drop a Column
ALTER TABLE users
DROP COLUMN person_age;
-- Add a COLUMN
ALTER TABLE users
ADD COLUMN age VARCHAR(10) NOT NULL;
-- Change the Data Typeof a COLUMN USING
ALTER TABLE users
ALTER COLUMN age TYPE INT
USING age::integer;
-- SET a DEFUALT VALUE of COLUMN
ALTER TABLE users
ADD COLUMN is_enabled VARCHAR(1);
ALTER TABLE users
ALTER COLUMN is_enabled SET DEFAULT 'Y';

INSERT INTO users (first_name,last_name,nationality,email,age) VALUES
('Ryan','R','Canadian','email@gmail.com',35);

-- ADD Constraints to Columns-----------------------
CREATE TABLE web_links (
	link_id SERIAL PRIMARY KEY,
	link_url VARCHAR(255) NOT NULL,
	link_target VARCHAR(20)
);

SELECT
*
FROM web_links;

INSERT INTO web_links (link_url, link_target) VALUES
('https://google.com','_blank');

-- Constraints for example every link_url must be a unique value no duplicates
ALTER TABLE web_links
ADD CONSTRAINT unique_web_url UNIQUE (link_url);

ALTER TABLE web_links
ADD COLUMN is_enabled VARCHAR(2);

INSERT INTO web_links (link_url, link_target) VALUES
('https://amazon.com','_blank'),
('https://youtube.com','_blank');

-- Set a column to only accept defined or allowed values
ALTER TABLE web_links
ADD CHECK (is_enabled IN ('Y','N'));
INSERT INTO web_links (link_url, link_target, is_enabled) VALUES
('https://netflix.com','_blank','Y');

-- Update a column with a constraint will block update if outside constraint
UPDATE web_links
SET is_enabled = 'Y'
WHERE link_id = 4;

UPDATE web_links
SET is_enabled = 'G'
WHERE link_id = 3;