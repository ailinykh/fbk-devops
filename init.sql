CREATE DATABASE fbk
    WITH 
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.utf8'
    LC_CTYPE = 'en_US.utf8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

\connect fbk

CREATE TABLE fbk_table (
	id serial PRIMARY KEY,
	fbk_value VARCHAR ( 255 ) NOT NULL,
	created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);