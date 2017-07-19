--psql -a -f overwatch.sql

CREATE TABLE characters (id SERIAL PRIMARY KEY, name VARCHAR(255), role VARCHAR(255), image_url VARCHAR(255) health INT);

INSERT INTO characters (name, role, image_url, health) VALUES ('Reaper', 'Offense', 'image_url', 250);


CREATE TABLE organizations (id SERIAL PRIMARY KEY, name VARCHAR(255), alignment VARCHAR(255));

CREATE TABLE users (id SERIAL PRIMARY KEY, email VARCHAR(255), password_digest VARCHAR(255));

ALTER TABLE characters ADD organization INT references organizations(id);

INSERT INTO organizations (name, alignment) VALUES ('New Overwatch', 'Good');

INSERT INTO organizations (name, alignment) VALUES ('Talon', 'Evil');

CREATE TABLE membership (id SERIAL PRIMARY KEY, character_id INT references characters(id), organization_id INT references organizations(id));

INSERT INTO membership (character_id, organization_id) VALUES (3, 2);

INSERT INTO membership (character_id, organization_id) VALUES (3, 3);
