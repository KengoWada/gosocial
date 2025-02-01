CREATE TABLE IF NOT EXISTS user_invitations(
    token bytea PRIMARY KEY,
    user_id bigint NOT NULL,
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users (id)
);