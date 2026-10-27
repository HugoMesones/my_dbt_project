select seller_id AS seller_name,
 seller_zip_code,
 seller_city,
 seller_state,
 3 AS column_name
from {{ source('sales_database', 'seller') }}