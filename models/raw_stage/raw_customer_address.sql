select ca_address_sk,
ca_address_id AS ADDRESS_ID,
customer_id AS CUSTOMER_ID,
ca_street_number AS STREET_NUMBER,
ca_street_name AS STREET_NAME,
ca_street_type AS STREET_TYPE,
ca_suite_number AS SUITE_NUMBER,
ca_city AS CITY,
ca_county AS COUNTY,
ca_state AS STATE,
ca_zip AS ZIP,
ca_country AS COUNTRY,
ca_gmt_offset AS GMT_OFFSET,
ca_location_type AS LOCATION_TYPE,
last_review_date AS LAST_REVIEW_DATE
from {{ source('tpch_sample', 'CUSTOMER_ADDRESS') }} AS ca
inner join {{ ref('raw_customer') }} AS c
on c.current_addr_sk = ca.ca_address_sk
