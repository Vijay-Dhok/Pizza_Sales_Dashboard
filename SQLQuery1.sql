select * from pizza_sales;
--Total Revenue
Select sum(total_price) as Total_Revenue from pizza_sales;
--Average order value
select sum(total_price)/count(distinct order_id) as avg_order_value from pizza_sales;
--Total quantity sold
select sum(quantity) as Total_quantity from pizza_sales;
--Total order
Select count(distinct order_id) as Total_Orders from pizza_sales;
--Avg pizza per order
select cast(cast(sum(quantity) as decimal(10,2))/cast(count(distinct order_id)as decimal(10,2))
as decimal(10,2)) from pizza_sales;

--
Select DATENAME(DW,order_date) as Order_day ,count(distinct order_id) as Total_orders from pizza_sales
Group by DATENAME(DW,order_date) ;
--
Select DATENAME(MONTH,order_date) as Order_Month ,count(distinct order_id) as Total_orders from pizza_sales
Group by DATENAME(MONTH,order_date) ;
--
Select pizza_category,sum(total_price)*100/(select SUM(total_price) from pizza_sales) as PCT from pizza_sales
group by pizza_category;
--
Select pizza_size,sum(total_price)*100/(select SUM(total_price) from pizza_sales) as PCT from pizza_sales
group by pizza_size;
--
Select top 5 pizza_name ,sum(total_price) as Total_sales
from pizza_sales group by pizza_name order by Total_sales desc;