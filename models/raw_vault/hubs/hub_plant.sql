{%- set source_model = "v_stg_c11_plant_t001w","v_stg_e03_plant_t001w" -%}
{%- set src_pk = "PLANT_HK" -%}
{%- set src_nk = "WERKS" -%}
{%- set src_ldts = "LOAD_DT" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ dbtvault.hub(src_pk=src_pk, src_nk=src_nk, src_ldts=src_ldts,
                src_source=src_source, source_model=source_model) }}