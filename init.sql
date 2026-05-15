CREATE TABLE items (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

INSERT INTO items (name) VALUES
    ('We did it!'),
    ('Branch is awesome!');
