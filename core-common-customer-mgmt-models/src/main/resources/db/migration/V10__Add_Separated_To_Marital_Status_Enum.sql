-- ======================================================
-- FLYWAY MIGRATION V10: ADD SEPARATED TO MARITAL STATUS ENUM
-- ======================================================
-- BE-5a (2026-05): The functional spec promises 5 marital states
-- (SINGLE, MARRIED, SEPARATED, DIVORCED, WIDOWED) but V1__Create_Enums.sql
-- shipped only 4. Adding the missing SEPARATED value here so the database
-- accepts it alongside the Java enum and OpenAPI schema.
-- Idempotent: ADD VALUE IF NOT EXISTS makes the migration safe to re-run
-- against environments where the value may already exist.

ALTER TYPE marital_status_enum ADD VALUE IF NOT EXISTS 'SEPARATED';

COMMENT ON TYPE marital_status_enum IS
    'Marital status of a natural person. Values: SINGLE, MARRIED, SEPARATED, DIVORCED, WIDOWED. SEPARATED added in V10 (BE-5a, 2026-05).';
