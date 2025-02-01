ALTER TABLE
    user_invitations
ADD
    COLUMN expiry timestamp(0) WITH time zone NOT NULL;