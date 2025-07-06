-- +goose Up
CREATE EXTENSION IF NOT EXISTS "pgcrypto";   


CREATE TYPE role AS ENUM ('host','server','food_runner','bartender_north','bartender_south','cocktailer','kitchen_line','kitchen_prep');

CREATE TABLE users (
  id             UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  email          TEXT         NOT NULL UNIQUE,
  password_hash  TEXT         NOT NULL,
  first_name     TEXT,
  last_name      TEXT,
  phone          TEXT,
  is_active      BOOLEAN      NOT NULL DEFAULT true,
  created_at     TIMESTAMPTZ  NOT NULL DEFAULT now(),
  updated_at     TIMESTAMPTZ
);

CREATE TABLE employees (
  user_id        UUID  PRIMARY KEY
                       REFERENCES users(id) ON DELETE CASCADE,
  role           role      NOT NULL,
  hire_date      DATE      NOT NULL,
  is_active      BOOLEAN   NOT NULL DEFAULT true
  -- hourly_wage  NUMERIC(6,2), -- will add later
);

-- +goose Down
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS users CASCADE;

DROP TYPE  IF EXISTS role CASCADE;

DROP EXTENSION IF NOT EXISTS "pgcrypto";
