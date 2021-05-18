CREATE TABLE [IF NOT EXISTS] users (
   id serial PRIMARY KEY,
   name varchar
);

INSERT INTO users (id, name)
VALUES (1, 'test1');
VALUES (2, 'test2');
VALUES (3, 'test3');
VALUES (4, 'test4');