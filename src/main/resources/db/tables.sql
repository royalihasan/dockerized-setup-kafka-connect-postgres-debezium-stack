-- create a User Table
CREATE TABLE users
(
    id         SERIAL PRIMARY KEY,
    username   VARCHAR(255) UNIQUE NOT NULL,
    password   VARCHAR(255)        NOT NULL,
    email      VARCHAR(255) UNIQUE NOT NULL,
    created_on TIMESTAMP           NOT NULL,
    last_login TIMESTAMP
);
-- Insert a user
INSERT INTO users (username, password, email, created_on) VALUES ('test', 'test', 'test', NOW());
-- Select all users
SELECT * FROM users;
