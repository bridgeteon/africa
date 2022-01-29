{{ config(materialized='incremental')    }}

{%- set source_model = "v_stg_c11_sales_vbuk","v_stg_e03_sales_vbuk" -%}
{%- set src_pk = "SALES_HK" -%}
{%- set src_nk = "VBELN","DV_BKEY_CODE" -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ dbtvault.hub(src_pk=src_pk, src_nk=src_nk, src_ldts=src_ldts,
                src_source=src_source, source_model=source_model) }}