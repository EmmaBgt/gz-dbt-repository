--Daily Margin and Operational Margin Evolution
-- Operational_margin = margin + shipping_fee - log_cost - ship_cost

SELECT 
 o.orders_id
,o.date_date
,ROUND(o.margin + s.shipping_fee - CAST((s.logcost - s.ship_cost) AS FLOAT64),2) AS operational_margin
,o.quantity
,o.revenue
,o.purchase_cost
,o.margin
,s.shipping_fee AS shipping_fees
,s.logcost AS log_cost
,s.ship_cost
FROM {{ref("int_orders_margin")}} o
LEFT JOIN {{ref("stg_raw__ship")}} s
    USING (orders_id)
ORDER BY orders_id DESC

--  SELECT
--      o.orders_id
--      ,o.date_date
--      ,ROUND(o.margin + s.shipping_fee - (s.logcost + s.ship_cost),2) AS operational_margin
--      ,o.quantity
--      ,o.revenue
--      ,o.purchase_cost
--      ,o.margin
--      ,s.shipping_fee
--      ,s.logcost
--      ,s.ship_cost
--  FROM {{ref("int_orders_margin")}} o
--  LEFT JOIN {{ref("stg_raw__ship")}} s
--      USING(orders_id)
--  ORDER BY orders_id desc