-- Create the table for storing subscriptions data in the Bronze layer.
-- This table holds the snapshot of what has been received with metadata for tracking purposes

CREATE TABLE IF NOT EXISTS pgc-analytical-engine.rec_hstg_bronze.subscriptions (
  subscription_id       STRING
, payment_gateway       STRING
, product_group         STRING
, product_sub_group     STRING
, product_slug          STRING
, period_months         STRING
, started_at            STRING
, ended_at              STRING
, is_auto_renew         STRING
, ar_valid_from         STRING
, ar_valid_to           STRING
, billings_eur_excl_vat STRING
, ingested_at           TIMESTAMP -- metadata: ingestion data
, source_file           STRING    -- metadata: file source
)
;
