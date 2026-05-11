-- Flyway V11: extend natural_person with the economic / employment profile fields
-- captured during the individual onboarding journey.
--
-- The existing columns `occupation` and `monthly_income` are reused for the front-end
-- fields `position` and `monthlySalary` respectively (mapping is done in the experience
-- BFF). The 10 columns below cover the remaining attributes from the front-end form.
--
-- All new columns are NULLABLE: the row already exists at this point (created during
-- customer registration) and is updated in place. Cross-field requirements (e.g.
-- employmentStatus is mandatory, employmentType is required when employmentStatus is
-- in {private, public, civil}, …) are enforced at the experience tier via Bean
-- Validation so that other consumers can read partial profiles without surprise.

ALTER TABLE natural_person
    ADD COLUMN employment_status     VARCHAR(30),
    ADD COLUMN employment_type       VARCHAR(20),
    ADD COLUMN employer              VARCHAR(200),
    ADD COLUMN employment_start_date DATE,
    ADD COLUMN annual_paydays        SMALLINT,
    ADD COLUMN housing_type          VARCHAR(20),
    ADD COLUMN housing_cost          NUMERIC(19, 4),
    ADD COLUMN housing_start_date    DATE,
    ADD COLUMN existing_loans        SMALLINT,
    ADD COLUMN other_debts           NUMERIC(19, 4);

COMMENT ON COLUMN natural_person.employment_status     IS 'Front-side enum: private, public, civil, selfEmployed, entrepreneur, unemployedBenefit, unemployed, retired, other.';
COMMENT ON COLUMN natural_person.employment_type       IS 'Contract type (private/public/civil only): permanent, temporary, project, internship, na.';
COMMENT ON COLUMN natural_person.employer              IS 'Employer trade name.';
COMMENT ON COLUMN natural_person.employment_start_date IS 'Start date of current employment / activity (ISO date).';
COMMENT ON COLUMN natural_person.annual_paydays        IS 'Paydays per year (typically 12 or 14).';
COMMENT ON COLUMN natural_person.housing_type          IS 'rent, mortgage, owned, family.';
COMMENT ON COLUMN natural_person.housing_cost          IS 'Monthly housing cost (rent or mortgage installment).';
COMMENT ON COLUMN natural_person.housing_start_date    IS 'Start date of current housing situation (ISO date).';
COMMENT ON COLUMN natural_person.existing_loans        IS 'Number of currently active loans (0..3; 3 means three or more).';
COMMENT ON COLUMN natural_person.other_debts           IS 'Total monthly amount of other recurring debts.';
