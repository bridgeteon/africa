SELECT 
dd.D_DATE as INVENTORY_DATE,
i.I_ITEM_ID as ITEM_ID,
INV_QUANTITY_ON_HAND,
w.W_WAREHOUSE_ID as WAREHOUSE_ID,
w.W_WAREHOUSE_NAME AS WAREHOUSE_NAME
FROM
{{ source('tpch_sample', 'INVENTORY') }} as iv
INNER JOIN {{ source('tpch_sample', 'DATE_DIM') }} as dd
on dd.D_DATE_SK = iv.INV_DATE_SK
INNER JOIN {{ source('tpch_sample', 'ITEM') }} as i
ON i.I_ITEM_SK = iv.INV_ITEM_SK
INNER JOIN {{ source('tpch_sample', 'WAREHOUSE') }} as w
on w.W_WAREHOUSE_SK = iv.INV_WAREHOUSE_SK

WHERE INVENTORY_DATE = TO_DATE('{{ var('load_date') }}')