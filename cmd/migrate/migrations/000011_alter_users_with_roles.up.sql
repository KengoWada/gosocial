-- Add role_id column
ALTER TABLE
    IF EXISTS users
ADD
    COLUMN role_id INT REFERENCES roles(id) DEFAULT 1;

-- Update existing users to the 'user' role
UPDATE
    users
SET
    role_id = (
        SELECT
            id
        FROM
            roles
        WHERE
            name = 'user'
    );

-- Remove the default value from role_id
ALTER TABLE
    users
ALTER COLUMN
    role_id DROP DEFAULT;

-- Set the role_id column to not be null
ALTER TABLE
    users
ALTER COLUMN
    role_id
SET
    NOT NULL;