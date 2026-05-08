-- ======================================================
-- FLYWAY MIGRATION V9: ADD APPLICATION_ID TO CONSENT TABLE
-- ======================================================
-- This migration adds the application_id column to the consent table.
-- The application_id is a NULLABLE soft link to a lending application,
-- intentionally without a foreign key because the lending data lives in a
-- separate microservice. An index supports efficient lookups by application.

ALTER TABLE consent ADD COLUMN application_id UUID;

CREATE INDEX ix_consent_application_id ON consent(application_id);

COMMENT ON COLUMN consent.application_id IS 'Soft link (no FK) to a lending application id; nullable because consents may exist outside the context of an application';
