{%- set yaml_metadata -%}
source_model: 'raw_web_customer'
derived_columns:
  RECORD_SOURCE: '!TPCH-WEB-CUSTOMER'
  EFFECTIVE_FROM: 'LAST_REVIEW_DATE'
hashed_columns:
  CUSTOMER_HK: 'CUSTOMER_ID'
  CUSTOMER_DETAILS_HASHDIFF:
    is_hashdiff: true
    columns:
    - 'CUSTOMER_ID'
    - 'SALUTATION'
    - 'FIRST_NAME'
    - 'LAST_NAME'
    - 'PREFERRED_CUST_FLAG'
    - 'EMAIL_ADDRESS'
  CUSTOMER_PII_HASHDIFF:
    is_hashdiff: true
    columns:
    - 'BIRTH_DAY'
    - 'BIRTH_MONTH'
    - 'BIRTH_YEAR'
    - 'BIRTH_COUNTRY'
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{% set source_model = metadata_dict['source_model'] %}

{% set derived_columns = metadata_dict['derived_columns'] %}

{% set hashed_columns = metadata_dict['hashed_columns'] %}

WITH staging AS (
{{ dbtvault.stage(include_source_columns=true,
                  source_model=source_model,
                  derived_columns=derived_columns,
                  hashed_columns=hashed_columns,
                  ranked_columns=none) }}
)

SELECT *,
       TO_DATE('{{ var('load_date') }}') AS LOAD_DATE
FROM staging
