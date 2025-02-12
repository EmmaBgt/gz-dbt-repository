
SELECT
date_date
,COUNT(op_marg.orders_id) AS nb_transactions
,ROUND(SUM(op_marg.revenue),2) AS revenue
,ROUND(SUM(op_marg.revenue)/SUM(op_marg.quantity),2) AS avereage_basket
,SUM(op_marg.purchase_cost) AS purchase_cost
,SUM(op_marg.shipping_fees) AS shipping_fees
,SUM(op_marg.log_cost) AS log_cost
,SUM(op_marg.quantity) AS quantity
FROM {{ref("int_orders_operational")}} AS op_marg
GROUP by date_date 
order by date_date DESC