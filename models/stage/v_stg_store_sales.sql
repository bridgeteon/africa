{%- set yaml_metadata -%}
source_model: 'raw_store_sales'
derived_columns:
  RECORD_SOURCE: '!TPCDS-STORE_SALES'
  EFFECTIVE_FROM: 'SOLD_DATE'
hashed_columns:
  SALE_HK: 'TICKET_NUMBER'
  CUSTOMER_HK: 'CUSTOMER_ID'
  ITEM_HK: 'ITEM_ID'
  LINK_CUSTOMER_SALES_HK:
  - 'TICKET_NUMBER'
  - 'CUSTOMER_ID'
  LINK_SALE_ITEM_HK:
  - 'TICKET_NUMBER'
  - 'ITEM_ID'
  SAT_SALE_ITEM_HASHDIFF:
    is_hashdiff: true
    columns:
    - 'ITEM_ID'
    - 'QUANTITY'
    - 'WHOLESALE_COST'
    - 'LIST_PRICE'
    - 'SALES_PRICE'
    - 'EXT_DISCOUNT_AMT'
    - 'EXT_SALES_PRICE'
    - 'EXT_WHOLESALE_COST'
    - 'EXT_LIST_PRICE'
    - 'EXT_TAX'
    - 'COUPON_AMT'
    - 'NET_PAID'
    - 'NET_PAID_INC_TAX'
    - 'NET_PROFIT'
  SALE_HASHDIFF:
    is_hashdiff: true
    columns:
    - 'TICKET_NUMBER'
    - 'STORE_ID'
    - 'SOLD_DATE'
    - 'SOLD_TIME'
    - 'SOLD_HOUR'
    - 'SOLD_MINUTE'
    - 'SOLD_SECOND'
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