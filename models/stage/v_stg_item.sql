{%- set yaml_metadata -%}
source_model: 'raw_item'
derived_columns:
  RECORD_SOURCE: '!TPCDS-ITEM'
  EFFECTIVE_FROM: 'REC_START_DATE'
hashed_columns:
  ITEM_HK: 'ITEM_ID'
  ITEM_TYPE_HASHDIFF:
    is_hashdiff: true
    columns:
    - 'ITEM_DESC'
    - 'BRAND'
    - 'CATEGORY_ID'
    - 'CATEGORY'
    - 'CLASS_ID'
    - 'CLASS'
    - 'COLOR'
    - 'CONTAINER'
    - 'FORMULATION'
    - 'MANUFACT_ID'
    - 'MANUFACT'
    - 'PRODUCT_NAME'
  ITEM_DETAILS_HASHDIFF:
    is_hashdiff: true
    columns:
    - 'CURRENT_PRICE'
    - 'SIZE'
    - 'UNITS'
    - 'WHOLESALE_COST'
    - 'MANAGER_ID'
    - 'REC_START_DATE'
    - 'REC_END_DATE'
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