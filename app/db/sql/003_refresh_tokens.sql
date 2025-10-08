CREATE TABLE IF NOT EXISTS main.refresh_tokens (
  id           BIGSERIAL PRIMARY KEY,
  user_id      BIGINT NOT NULL REFERENCES main.users(id) ON DELETE CASCADE,
  token_hash   TEXT NOT NULL,
  jti          TEXT NOT NULL,
  created_at   TIMESTAMPTZ NOT NULL DEFAULT now(),
  expires_at   TIMESTAMPTZ NOT NULL,
  revoked      BOOLEAN NOT NULL DEFAULT FALSE
);

CREATE UNIQUE INDEX IF NOT EXISTS idx_refresh_jti ON main.refresh_tokens(jti);
CREATE INDEX IF NOT EXISTS idx_refresh_user ON main.refresh_tokens(user_id);