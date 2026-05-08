-- ======================================================
-- FLYWAY MIGRATION V8: ADD COMPANY DATA FIELDS TO LEGAL_ENTITY TABLE
-- ======================================================
-- This migration adds seven additional company data fields to the legal_entity
-- table to support enriched corporate customer onboarding requirements:
--   - employee_range: human-readable range string (e.g. "1-5", "6-25", "250+")
--   - annual_revenue: annual revenue in base currency
--   - cnae_code: Spanish CNAE economic activity code
--   - contact_*: primary commercial contact details (name, position, email, phone)

ALTER TABLE legal_entity
    ADD COLUMN employee_range VARCHAR(20),
    ADD COLUMN annual_revenue NUMERIC(19,2),
    ADD COLUMN cnae_code VARCHAR(10),
    ADD COLUMN contact_name VARCHAR(255),
    ADD COLUMN contact_position VARCHAR(255),
    ADD COLUMN contact_email VARCHAR(255),
    ADD COLUMN contact_phone VARCHAR(50);

COMMENT ON COLUMN legal_entity.employee_range IS 'Human-readable employee count range (1-5, 6-25, 26-50, 51-250, 250+)';
COMMENT ON COLUMN legal_entity.annual_revenue IS 'Annual revenue declared by the legal entity in base currency';
COMMENT ON COLUMN legal_entity.cnae_code IS 'Spanish CNAE economic activity code';
COMMENT ON COLUMN legal_entity.contact_name IS 'Primary commercial contact full name';
COMMENT ON COLUMN legal_entity.contact_position IS 'Primary commercial contact position or role';
COMMENT ON COLUMN legal_entity.contact_email IS 'Primary commercial contact email address';
COMMENT ON COLUMN legal_entity.contact_phone IS 'Primary commercial contact phone number';
