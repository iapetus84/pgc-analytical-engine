-- Move data from the raw copy into the Bronze table with metadata.

INSERT INTO `pgc-analytical-engine.rec_hstg_bronze.subscriptions`

SELECT 
  *
, CURRENT_TIMESTAMP()
, 'gs://[gcs_bucket]/[file_name]'
FROM `@gcp_project.@ingestion_data_set.hstg_DataAnalystTaskdata_external`
;
