{%- set source_model = "v_stg_c11_invoice_vbrk","v_stg_e03_invoice_vbrk" -%}
{%- set src_pk = "INVOICE_HK" -%}
{%- set src_nk = "VBELN" -%}
{%- set src_ldts = "LOAD_DT" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ dbtvault.hub(src_pk=src_pk, src_nk=src_nk, src_ldts=src_ldts,
                src_source=src_source, source_model=source_model) }}