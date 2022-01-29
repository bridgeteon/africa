{%- set yaml_metadata -%}
source_model: 'hub_customer'
src_pk: 'CUSTOMER_PK'
as_of_dates_table: 'util_days'
satellites:
  SAT_CUSTOMER_P10_KNA1:
    pk:
        'PK': 'CUSTOMER_HK'
    ldts:
        'LDTS': 'LOAD_EFF_DT'
  SAT_CUSTOMER_C11_KNA1:
    pk:
        'PK': 'CUSTOMER_HK'
    ldts:
        'LDTS': 'LOAD_EFF_DT'
  SAT_CUSTOMER_E03_KNA1:
    pk:
        'PK': 'CUSTOMER_HK'
    ldts:
        'LDTS': 'LOAD_EFF_DT'
src_ldts: 'LOAD_EFF_DT'      
src_ldts: 'LOAD_EFF_DT'

{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{% set source_model = metadata_dict['source_model'] %}

{% set src_pk = metadata_dict['src_pk'] %}

{% set as_of_dates_table = metadata_dict['as_of_dates_table'] %}

{{ dbtvault.pit(source_model=metadata_dict['source_model'], 
                src_pk=metadata_dict['src_pk'],
                as_of_dates_table=metadata_dict['as_of_dates_table'],
                satellites=metadata_dict['satellites'],
                src_ldts=metadata_dict['src_ldts']) }}