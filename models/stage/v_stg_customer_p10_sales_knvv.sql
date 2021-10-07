
{%- set yaml_metadata -%}
source_model: 
  sapp10_tbl: 'KNVV'
derived_columns:
  RECORD_SOURCE: '!SAPP10_KNVV'
  LOAD_EFF_DT: TO_DATE('{{ var('load_date') }}')
hashed_columns:
  CUSTOMER_HK: 'KUNNR'
  SALES_ORG_HK: 'VKORG'
  DISTRIBUTION_CHANNEL_HK:  'VTWEG'
  DIVISION_HK: 'SPART'
  CUSTOMER_SALES_DISTRIBUTION_DIVISION_HK:
  - 'KUNNR'
  - 'VKORG'
  - 'VTWEG'
  - 'SPART'
  LSAT_CUSTOMER_SALES_DISTRIBUTION_DIVISION_HASHDIFF:
    is_hashdiff: true
    exclude_columns: true
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

