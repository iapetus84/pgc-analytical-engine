-- Create table in Ingestion layer to store raw string versions of the source data

CREATE OR REPLACE EXTERNAL TABLE `@gcp_project.@ingestion_data_set.hstg_DataAnalystTaskdata_external`
(
  subscription_id       STRING,
  payment_gateway       STRING,
  product_group         STRING,
  product_sub_group     STRING,
  product_slug          STRING,
  period_months         STRING,
  started_at            STRING,
  ended_at              STRING,
  is_auto_renew         STRING,
  ar_valid_from         STRING,
  ar_valid_to           STRING,
  billings_eur_excl_vat STRING
)
OPTIONS (
  format = 'CSV',
  uris = ['gs://@gcs_bucket/hostinger_recruitment_DataAnalystTaskdata_20260630.csv'],
  skip_leading_rows = 1
);
