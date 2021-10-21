DROP TABLE IF EXISTS organizations CASCADE;

CREATE TABLE organizations (
  id SERIAL PRIMARY KEY NOT NULL,
  legal_name VARCHAR(255) NOT NULL,
  date_deactivated DATETIME NOT NULL,
  active BOOLEAN NOT NULL DEFAULT TRUE
);