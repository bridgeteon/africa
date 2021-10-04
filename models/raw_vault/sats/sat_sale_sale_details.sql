{%- set source_model = "v_stg_store_sales" -%}
{%- set src_pk = "SALE_HK" -%}
{%- set src_hashdiff = "SALE_HASHDIFF" -%}
{%- set src_payload = ["TICKET_NUMBER", "STORE_ID", "SOLD_DATE", "SOLD_TIME",
                       "SOLD_HOUR", "SOLD_MINUTE", "SOLD_SECOND"] -%}
{%- set src_eff = "EFFECTIVE_FROM" -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ dbtvault.sat(src_pk=src_pk, src_hashdiff=src_hashdiff,
                src_payload=src_payload, src_eff=src_eff,
                src_ldts=src_ldts, src_source=src_source,
                source_model=source_model) }}