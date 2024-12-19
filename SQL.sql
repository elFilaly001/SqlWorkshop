-- database creation
CREATE DATABASE example_database;

-- user creation
CREATE USER 'example_user' IDENTIFIED BY 'password';

-- grant permissions
GRANT ALL PRIVILEGES ON example_database.* TO 'example_user';
GRANT SELECT, INSERT, UPDATE, DELETE ON example_database.* TO 'example_user';
GRANT CREATE ON example_database.* TO 'example_user';

--revoke permissions
REVOKE ALL PRIVILEGES ON example_database.* FROM 'example_user';

-- drop user
DROP USER 'example_user';

-- create table
CREATE TABLE example_table (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);

--unique constraint
--not null constraint
--default constraint
--check constraint
--primary key
--foreign key

-- insert data
INSERT INTO example_table (name, email) VALUES ('John Doe', 'john.doe@example.com');

-- select data
SELECT * FROM example_table;

--joins
--inner join
--left join
--right join
--cross join
--self join

-- group by
-- having
-- order by
-- limit
-- offset


-- update data
UPDATE example_table SET name = 'Jane Doe' WHERE email = 'john.doe@example.com';

-- delete data
DELETE FROM example_table WHERE email = 'john.doe@example.com';

-- drop table
DROP TABLE IF EXISTS example_table;

--truncate table
TRUNCATE TABLE example_table;


-- alter table
ALTER TABLE example_table
ADD COLUMN phone_number VARCHAR(20);

-- rename table
RENAME TABLE example_table TO new_example_table;

-- rename column
ALTER TABLE new_example_table
CHANGE COLUMN name new_name VARCHAR(255);

-- drop column
ALTER TABLE new_example_table
DROP COLUMN IF EXISTS email;

-- add column
ALTER TABLE new_example_table
ADD COLUMN address VARCHAR(255);

-- modify column
ALTER TABLE new_example_table
MODIFY COLUMN new_name VARCHAR(255) NOT NULL;

-- add constraint
ALTER TABLE new_example_table
ADD CONSTRAINT unique_email UNIQUE (email);

-- drop constraint
ALTER TABLE new_example_table
DROP CONSTRAINT IF EXISTS unique_email;

-- create view
CREATE VIEW example_view AS SELECT * FROM new_example_table;

-- drop view
DROP VIEW IF EXISTS example_view;

-- create sequence
CREATE SEQUENCE example_sequence;

--transaction
START TRANSACTION;
INSERT INTO new_example_table (new_name, email) VALUES ('Jane Doe', 'jane.doe@example.com');
COMMIT;

-- drop database
DROP DATABASE IF EXISTS example_database;

-- create function
DELIMITER $$
CREATE FUNCTION get_user_name(p_email VARCHAR(255)) RETURNS VARCHAR(255)
BEGIN
    DECLARE v_name VARCHAR(255);
    SELECT new_name INTO v_name FROM new_example_table WHERE email = p_email;
    RETURN v_name;
END$$
DELIMITER ;

-- drop function
DROP FUNCTION IF EXISTS get_user_name;

-- create trigger
DELIMITER $$
CREATE TRIGGER before_insert_example_table
BEFORE INSERT ON new_example_table
FOR EACH ROW
BEGIN
    SET NEW.email = LOWER(NEW.email);
END$$
DELIMITER ;

-- drop trigger
DROP TRIGGER IF EXISTS before_insert_example_table;

