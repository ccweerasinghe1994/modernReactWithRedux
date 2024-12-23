-- 1. Drop the database if it exists
DROP DATABASE IF EXISTS bookdb;

-- 2. Drop roles (users) if they exist
DROP ROLE IF EXISTS bookadmin;
DROP ROLE IF EXISTS bookuser;

-- 3. Create the database with UTF8 encoding and appropriate locale settings
CREATE DATABASE bookdb
    WITH 
    OWNER = abc -- Replace with the desired owner, e.g., 'postgres'
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.UTF-8'
    LC_CTYPE = 'en_US.UTF-8'
    TEMPLATE = template0;

-- 4. Connect to the newly created database
\c bookdb

-- 5. Create roles (users) with passwords
CREATE ROLE bookadmin WITH LOGIN PASSWORD 'secret';
CREATE ROLE bookuser WITH LOGIN PASSWORD 'secret';

-- 6. Grant privileges to bookadmin
-- Connect privilege allows the user to connect to the database
GRANT CONNECT ON DATABASE bookdb TO bookadmin;

-- Usage on schema allows access to objects within the schema
GRANT USAGE ON SCHEMA public TO bookadmin;

-- Grant various table-level privileges
GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES, TRIGGER ON ALL TABLES IN SCHEMA public TO bookadmin;

-- Grant schema-level privileges
GRANT CREATE, USAGE ON SCHEMA public TO bookadmin;


-- Grant execute privilege on functions
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO bookadmin;

-- Set default privileges for future tables and functions
ALTER DEFAULT PRIVILEGES IN SCHEMA public 
    GRANT SELECT, INSERT, UPDATE, DELETE, REFERENCES, TRIGGER ON TABLES TO bookadmin;

ALTER DEFAULT PRIVILEGES IN SCHEMA public 
    GRANT EXECUTE ON FUNCTIONS TO bookadmin;

-- 7. Grant privileges to bookuser
GRANT CONNECT ON DATABASE bookdb TO bookuser;
GRANT USAGE ON SCHEMA public TO bookuser;

-- Grant table-level privileges
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO bookuser;

-- Grant schema-level create privilege
GRANT CREATE ON SCHEMA public TO bookuser;

-- Set default privileges for future tables
ALTER DEFAULT PRIVILEGES IN SCHEMA public 
    GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO bookuser;
