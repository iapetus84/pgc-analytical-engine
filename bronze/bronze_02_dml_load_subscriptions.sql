-- Move data from the raw copy into the Bronze table with metadata.

INSERT INTO `@gcp_project.@bronze_data_set.subscriptions`

SELECT 
  *
, CURRENT_TIMESTAMP()
, 'gs://[gcs_bucket]/[file_name]'
FROM `@gcp_project.@ingestion_data_set.hstg_DataAnalystTaskdata_external`
;
