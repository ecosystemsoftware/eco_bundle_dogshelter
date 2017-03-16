--Main permissions for schema
GRANT ALL ON SCHEMA eco_bundle_dogshelter to public; GRANT ALL ON SCHEMA eco_bundle_dogshelter to anon;

CREATE TABLE dogs (
    id serial PRIMARY KEY,
    name text NOT NULL,
    age integer NOT NULL,
    breed text NOT NULL,
    description text,
    keywords text[],
    image text,
    adopted_by text
);

CREATE VIEW dogs_available AS
    SELECT *,
    dogs.name || '-' || dogs.id as slug,
    dogs.name || ', a ' || dogs.breed || ' currently available for adoption at The Animal Shelter' as page_title
    FROM dogs
    WHERE dogs.adopted_by IS NULL;

CREATE VIEW dogs_adopted AS
    SELECT *,
    dogs.name || '-' || dogs.id as slug,
    dogs.name || ', a ' || dogs.breed || ' was adopted at The Animal Shelter' as page_title
    FROM dogs
    WHERE dogs.adopted_by IS NOT NULL;