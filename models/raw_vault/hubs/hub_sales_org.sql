{%- set source_model = "v_stg_c11_sales_organization_tvko","v_stg_e03_sales_organization_tvko" -%}
{%- set src_pk = "SALES_ORG_HK" -%}
{%- set src_nk = "VKORG" -%}
{%- set src_ldts = "LOAD_DT" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ dbtvault.hub(src_pk=src_pk, src_nk=src_nk, src_ldts=src_ldts,
                src_source=src_source, source_model=source_model) }}