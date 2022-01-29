{%- set source_model = "v_stg_e03_customer","v_stg_p10_customer", "v_stg_c11_customer" -%}
{%- set src_pk = "CUSTOMER_HK" -%}
{%- set src_nk = "KUNNR" -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ dbtvault.hub(src_pk=src_pk, src_nk=src_nk, src_ldts=src_ldts,
                src_source=src_source, source_model=source_model) }}