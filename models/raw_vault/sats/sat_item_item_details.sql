{%- set source_model = "v_stg_item" -%}
{%- set src_pk = "ITEM_HK" -%}
{%- set src_hashdiff = "ITEM_DETAILS_HASHDIFF" -%}
{%- set src_payload = ["CURRENT_PRICE", "SIZE", "UNITS",
                       "WHOLESALE_COST",
                       "MANAGER_ID",
                       "REC_START_DATE",
                       "REC_END_DATE"] -%}
{%- set src_eff = "EFFECTIVE_FROM" -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ dbtvault.sat(src_pk=src_pk, src_hashdiff=src_hashdiff,
                src_payload=src_payload, src_eff=src_eff,
                src_ldts=src_ldts, src_source=src_source,
                source_model=source_model) }}