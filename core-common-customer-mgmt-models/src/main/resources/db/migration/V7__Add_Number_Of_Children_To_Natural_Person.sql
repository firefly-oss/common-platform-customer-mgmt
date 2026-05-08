-- ======================================================
-- FLYWAY MIGRATION V7: ADD NUMBER_OF_CHILDREN TO NATURAL_PERSON TABLE
-- ======================================================
-- This migration adds the number_of_children column to the natural_person table.
-- Tracks how many dependent children the individual customer has.

ALTER TABLE natural_person ADD COLUMN number_of_children SMALLINT;

COMMENT ON COLUMN natural_person.number_of_children IS 'Number of dependent children of the natural person';
