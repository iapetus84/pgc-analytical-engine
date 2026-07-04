-- Create the subscriptions table - parent to auto_renew_periods

CREATE OR REPLACE TABLE `@gcp_project.@silver_data_set.subscriptions` AS
SELECT
  subscription_id,                                        
  ANY_VALUE(NULLIF(payment_gateway, ''))                  payment_gateway,
  ANY_VALUE(NULLIF(product_group, ''))                    product_group,
  ANY_VALUE(NULLIF(product_sub_group, ''))                product_sub_group,
  ANY_VALUE(NULLIF(product_slug, ''))                     product_slug,
  ANY_VALUE(SAFE_CAST(is_auto_renew AS BOOL))             is_auto_renew,
  ANY_VALUE(SAFE_CAST(period_months AS INT64))            period_months,
  ANY_VALUE(SAFE_CAST(started_at AS DATE))                started_at,
  ANY_VALUE(SAFE_CAST(ended_at AS DATE))                  ended_at,
  ANY_VALUE(SAFE_CAST(billings_eur_excl_vat AS NUMERIC))  billings_eur_excl_vat

FROM `@gcp_project.@bronze_data_set.subscriptions`

WHERE SAFE_CAST(billings_eur_excl_vat AS NUMERIC) >= 0  -- excluding two known negative rows

GROUP BY subscription_id
;
