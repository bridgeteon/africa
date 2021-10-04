{%- set source_model = "v_stg_store_sales" -%}
{%- set src_pk = "LINK_CUSTOMER_SALES_HK" -%}
{%- set src_fk = ["CUSTOMER_HK", "SALE_HK"] -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ dbtvault.link(src_pk=src_pk, src_fk=src_fk, src_ldts=src_ldts,
                 src_source=src_source, source_model=source_model) }}