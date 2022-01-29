{{ config(materialized='incremental')    }}

{%- set source_model = "v_stg_c11_distribution_channel_tvtw","v_stg_e03_distribution_channel_tvtw" -%}
{%- set src_pk = "DISTRIBUTION_CHANNEL_HK" -%}
{%- set src_nk = "VTWEG","DV_BKEY_CODE" -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ dbtvault.hub(src_pk=src_pk, src_nk=src_nk, src_ldts=src_ldts,
                src_source=src_source, source_model=source_model) }}