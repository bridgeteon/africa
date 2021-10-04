SELECT 
C_CUSTOMER_SK AS CUSTOMER_SK,
C_CUSTOMER_ID AS CUSTOMER_ID,
C_CURRENT_ADDR_SK AS CURRENT_ADDR_SK,
C_FIRST_SHIPTO_DATE_SK AS FIRST_SHIPTO_DATE_SK,
C_FIRST_SALES_DATE_SK AS FIRST_SALES_DATE_SK,
C_SALUTATION AS SALUTATION,
C_FIRST_NAME AS FIRST_NAME,
C_LAST_NAME AS LAST_NAME,
C_PREFERRED_CUST_FLAG AS PREFERRED_CUST_FLAG,
C_BIRTH_DAY AS BIRTH_DAY,
C_BIRTH_MONTH AS BIRTH_MONTH,
C_BIRTH_YEAR AS BIRTH_YEAR,
C_BIRTH_COUNTRY AS BIRTH_COUNTRY,
C_LOGIN AS LOGIN,
C_EMAIL_ADDRESS AS EMAIL_ADDRESS,
C_LAST_REVIEW_DATE LAST_REVIEW_DATE_SK,
dd.D_DATE AS LAST_REVIEW_DATE
FROM SNOWFLAKE_SAMPLE_DATA.TPCDS_SF10TCL.CUSTOMER AS c
inner join  SNOWFLAKE_SAMPLE_DATA.TPCDS_SF10TCL.DATE_DIM AS  dd
on dd.d_date_sk = c.c_last_review_date
WHERE c.C_CUSTOMER_SK in ( 
    select ss.WS_BILL_CUSTOMER_SK  
    from {{ source('tpch_sample', 'WEB_SALES') }} AS ss
    inner join {{ source('tpch_sample', 'DATE_DIM') }} AS ds
    on ds.d_date_sk = ss.ws_sold_date_sk 
    WHERE ds.D_DATE >= TO_DATE('{{ var('load_start_date') }}')
      AND ds.D_DATE <= TO_DATE('{{ var('load_date') }}')
   )