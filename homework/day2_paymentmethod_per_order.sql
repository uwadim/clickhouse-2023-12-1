with source as (select * from {{ref('stg_payments')}}),

payment_order as (select order_id, payment_method,  sum(amount) over (partition by order_id,payment_method) as sum_payord, sum(amount) over (partition by order_id) as sum_order from source order by order_id asc
)
select * from payment_order
