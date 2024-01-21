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
INSERT INTO users (username, password, email, created_on)
VALUES ('test', 'test', 'test', NOW());
INSERT INTO users (username, password, email, created_on)
VALUES ('test2', 'test2', 'test2', NOW());
-- Select all users
SELECT *
FROM users;
-- Alter table add replication full
ALTER TABLE postgres.public.users
    REPLICA IDENTITY FULL;
-- some changes
UPDATE users
SET last_login = NOW()
WHERE username = 'test';

-- Delete a user
DELETE
FROM users
WHERE username = 'test2';

-- create Post Table
CREATE TABLE posts
(
    id         SERIAL PRIMARY KEY,
    title      VARCHAR(255) NOT NULL,
    body       TEXT         NOT NULL,
    created_on TIMESTAMP    NOT NULL,
    author_id  INTEGER      NOT NULL REFERENCES users (id)
);
-- Insert a post
INSERT INTO posts (title, body, created_on, author_id)
VALUES ('test', 'test', NOW(), 1);
-- Select all posts
SELECT *
FROM posts;
-- Alter table add replication full
ALTER TABLE postgres.public.posts
    REPLICA IDENTITY FULL;
-- some changes
UPDATE posts
SET title = 'test2'
WHERE id = 1;
