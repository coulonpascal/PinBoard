DROP  DATABASE IF EXISTS pinboard_drupal;

-- Create the database user
DROP USER IF EXISTS pinboard_user;

CREATE USER pinboard_user WITH PASSWORD 'pinboard2017';

-- Create the database	
CREATE DATABASE pinboard_drupal with OWNER = postgres ENCODING = 'UTF8';	
