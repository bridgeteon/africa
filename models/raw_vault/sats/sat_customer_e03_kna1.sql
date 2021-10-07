{%- set source_model = "v_stg_e03_customer" -%}
{%- set src_pk = "CUSTOMER_HK" -%}
{%- set src_hashdiff = "CUSTOMER_HASHDIFF" -%}
{% set columns_query %}
select column_name from edw.information_schema.columns where lower(table_name) = '{{source_model}}' and table_catalog = 'EDW' and LOWER(table_schema) = '{{schema}}'
and column_name not like  ('%HASHDIFF') and column_name not like '%HK' and column_name not like 'LOAD_%D%' and column_name <> 'RECORD_SOURCE'
{% endset %}

{% set results = run_query(columns_query) %}
{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0].values() %}
{% else %}
{% set results_list = [] %}
{% endif %}


{%- set src_payload = results_list -%}
{%- set src_eff = "LOAD_EFF_DT" -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ dbtvault.sat(src_pk=src_pk, src_hashdiff=src_hashdiff,
                src_payload=src_payload, src_eff=src_eff,
                src_ldts=src_ldts, src_source=src_source,
                source_model=source_model) }}