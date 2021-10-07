{%- set source_model = "v_stg_customer_p10_sales_knvv","v_stg_customer_c11_sales_knvv","v_stg_customer_e03_sales_knvv" -%}
{%- set src_pk = "CUSTOMER_SALES_DISTRIBUTION_DIVISION_HK" -%}
{%- set src_fk = ["CUSTOMER_HK", "SALES_ORG_HK", "DISTRIBUTION_CHANNEL_HK", "DIVISION_HK"] -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ dbtvault.link(src_pk=src_pk, src_fk=src_fk, src_ldts=src_ldts,
                 src_source=src_source, source_model=source_model) }}