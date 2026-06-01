select * from sales;

--QUERY 1 (TOTAL COMPANY REVENUE)
select sum(REVENUE) as total_revenue
from sales;

--QUERY 2 (TOP REVENUE PRODUCTS)
select
	p.product_name,
	SUM(s.revenue) AS revenue
from sales s
join products p
on s.product_id = p.product_id
group by p.product_name
order by revenue DESC;

--QUERY 3 (TOP CUSTOMERS)
select
	customer_name,
	SUM(revenue) as revenue
from sales
group by customer_name
order by revenue DESC;

--QUERY 4 (CATEGORY REVENUE ANALYSIS)
select
	p.category,
	SUM(s.revenue) as total_revenue
from sales s
join products p
on s.product_id = p.product_id
group by p.category
order by total_revenue DESC;

--QUERY 5 (PRODUCT PROFIT ANALYSIS)
select
	p.product_name,
	sum(s.revenue) as revenue,
	sum(s.quantity_sold * p.unit_cost) as total_cost,
	sum(s.revenue) - sum(s.quantity_sold * p.unit_cost) as profit
from sales s
join products p
on s.product_id = p.product_id
group by p.product_name
order by profit DESC;


