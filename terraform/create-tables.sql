CREATE TABLE IF NOT EXISTS users (
  id serial PRIMARY KEY,
  name VARCHAR(100),
  email text UNIQUE NOT NULL,
  score BIGINT DEFAULT 0,
  joined TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS login (
  id serial PRIMARY KEY,
  email text UNIQUE NOT NULL,
  hash VARCHAR(100) NOT NULL
);
