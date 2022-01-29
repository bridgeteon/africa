{{ config(materialized='incremental')    }}

{%- set source_model = "v_stg_c11_product_mara","v_stg_e03_product_mara" -%}
{%- set src_pk = "PRODUCT_HK" -%}
{%- set src_nk = "MATNR","DV_BKEY_CODE" -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ dbtvault.hub(src_pk=src_pk, src_nk=src_nk, src_ldts=src_ldts,
                src_source=src_source, source_model=source_model) }}