CREATE USER telegramud WITH password 'telegramud';
GRANT ALL ON DATABASE telegramud TO telegramud;

-- changing active database
\connect telegramud telegramud

-- User --
CREATE TABLE public.users
(
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(25),
  race VARCHAR(25) DEFAULT NULL
);
CREATE UNIQUE INDEX users_name_uindex ON public.users (name);

\connect telegramud postgres

DROP DATABASE telegramud_test;
CREATE DATABASE telegramud_test WITH TEMPLATE telegramud OWNER telegramud;