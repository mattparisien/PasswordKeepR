DROP TABLE IF EXISTS passwords CASCADE;

CREATE TABLE passwords (
  id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(255),
  url VARCHAR(255) NOT NULL,
  username VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  category_id INTEGER REFERENCES categories(id) ON DELETE CASCADE,
  user_id INTEGER REFERENCES reservations(id) ON DELETE CASCADE,
  org_id INTEGER REFERENCES organizations(id) ON DELETE CASCADE DEFAULT NULL,
  created TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
  modified TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW()
);
