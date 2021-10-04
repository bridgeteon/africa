SELECT 
SS_TICKET_NUMBER AS TICKET_NUMBER,
c.C_CUSTOMER_ID AS CUSTOMER_ID,
dd.D_DATE AS SOLD_DATE,
td.T_TIME AS SOLD_TIME,
td.t_hour AS SOLD_HOUR,
td.t_minute AS SOLD_MINUTE,
td.t_second AS SOLD_SECOND,
i.I_ITEM_ID AS ITEM_ID,
st.S_STORE_ID AS STORE_ID,
SS_QUANTITY AS QUANTITY,
SS_WHOLESALE_COST AS WHOLESALE_COST,
SS_LIST_PRICE AS LIST_PRICE,
SS_SALES_PRICE AS SALES_PRICE,
SS_EXT_DISCOUNT_AMT AS EXT_DISCOUNT_AMT,
SS_EXT_SALES_PRICE AS EXT_SALES_PRICE,
SS_EXT_WHOLESALE_COST AS EXT_WHOLESALE_COST,
SS_EXT_LIST_PRICE AS EXT_LIST_PRICE,
SS_EXT_TAX AS EXT_TAX,
SS_COUPON_AMT AS COUPON_AMT,
SS_NET_PAID AS NET_PAID,
SS_NET_PAID_INC_TAX AS NET_PAID_INC_TAX,
SS_NET_PROFIT AS NET_PROFIT

FROM {{ source('tpch_sample', 'STORE_SALES') }} AS ss
inner JOIN {{ source('tpch_sample', 'CUSTOMER') }} AS c
ON ss.SS_CUSTOMER_SK = c.C_CUSTOMER_SK
inner join {{ source('tpch_sample', 'ITEM') }} AS i
ON ss.SS_ITEM_SK = i.I_ITEM_SK
inner join {{ source('tpch_sample', 'DATE_DIM') }} AS dd
on dd.d_date_sk = ss.ss_sold_date_sk 
inner join {{ source('tpch_sample', 'TIME_DIM') }} td
on td.t_time_sk = ss.ss_sold_time_sk
inner join {{ source('tpch_sample', 'STORE') }} st
on st.s_store_sk = ss.ss_store_sk
WHERE SS_CUSTOMER_SK IS NOT NULL

AND SOLD_DATE = TO_DATE('{{ var('load_date') }}')