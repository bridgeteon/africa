{%- set source_model = "v_stg_store_sales" -%}
{%- set src_pk = "LINK_SALE_ITEM_HK" -%}
{%- set src_hashdiff = "SAT_SALE_ITEM_HASHDIFF" -%}
{%- set src_payload = ["TICKET_NUMBER","ITEM_ID"
                        , "QUANTITY"
                        , "WHOLESALE_COST"
                        , "LIST_PRICE"
                        , "SALES_PRICE"
                        , "EXT_DISCOUNT_AMT"
                        , "EXT_SALES_PRICE"
                        , "EXT_WHOLESALE_COST"
                        , "EXT_LIST_PRICE"
                        , "EXT_TAX"
                        , "COUPON_AMT"
                        , "NET_PAID"
                        , "NET_PAID_INC_TAX"
                        , "NET_PROFIT"] -%}
{%- set src_eff = "EFFECTIVE_FROM" -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ dbtvault.sat(src_pk=src_pk, src_hashdiff=src_hashdiff,
                src_payload=src_payload, src_eff=src_eff,
                src_ldts=src_ldts, src_source=src_source,
                source_model=source_model) }}