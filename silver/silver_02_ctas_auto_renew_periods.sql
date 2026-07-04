-- Create the renew periods table - child to subscriptions

CREATE OR REPLACE TABLE `@gcp_project.@silver_data_set.auto_renew_periods` AS

SELECT
  subscription_id
, SAFE_CAST(ar_valid_from AS DATE) AS ar_valid_from
, SAFE_CAST(ar_valid_to AS DATE)   AS ar_valid_to
, DATE_DIFF(
    SAFE_CAST(ar_valid_to AS DATE),
    SAFE_CAST(ar_valid_from AS DATE),
    DAY
  )                                AS period_duration_days
, ROW_NUMBER() OVER (
    PARTITION BY subscription_id
    ORDER BY SAFE_CAST(ar_valid_from AS DATE)
  )                                AS toggle_sequence

FROM `@gcp_project.@bronze_data_set.subscriptions`

WHERE ar_valid_from IS NOT NULL
  AND SAFE_CAST(ar_valid_to AS DATE) >= SAFE_CAST(ar_valid_from AS DATE)

;
