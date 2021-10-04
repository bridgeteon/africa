{%- set source_model = "v_stg_inventory" -%}
{%- set src_pk = "LINK_INVENTORY_HK" -%}
{%- set src_hashdiff = "INVENTORY_HASHDIFF" -%}
{%- set src_payload = ["ITEM_ID","INVENTORY_DATE", "INV_QUANTITY_ON_HAND", "WAREHOUSE_ID", "WAREHOUSE_NAME"] -%}
{%- set src_eff = "EFFECTIVE_FROM" -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ dbtvault.sat(src_pk=src_pk, src_hashdiff=src_hashdiff,
                src_payload=src_payload, src_eff=src_eff,
                src_ldts=src_ldts, src_source=src_source,
                source_model=source_model) }}