DROP TABLE IF EXISTS organizations CASCADE;

CREATE TABLE organizations (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255) NOT NULL,
  created TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
  modified TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()
);
