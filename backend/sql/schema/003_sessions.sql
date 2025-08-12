-- +goose Up
CREATE TABLE sessions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES users (id) ON DELETE CASCADE,
    refresh_token_hash TEXT UNIQUE,
    issued_at TIMESTAMPTZ NOT NULL,
    expires_at TIMESTAMPTZ NOT NULL,
    revoked_at TIMESTAMPTZ,
    CONSTRAINT uq_sessions_refresh_token_hash UNIQUE (refresh_token_hash)
);

-- index for quick lookup using user id 
CREATE INDEX idx_sessions_user_id ON sessions (user_id);

-- index to speed up deleting expired sessions  
CREATE INDEX idx_sessions_expires_at ON sessions (expires_at);

-- partial index for cleanup job  as it stores only active sessions
CREATE INDEX idx_sessions_active_expires_at ON sessions (expires_at) WHERE revoked_at IS NULL;

-- +goose Down
DROP INDEX IF EXISTS idx_sessions_active_expires_at;
DROP INDEX IF EXISTS idx_sessions_expires_at;
DROP INDEX IF EXISTS idx_sessions_user_id;
DROP TABLE IF EXISTS sessions;
