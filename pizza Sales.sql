-- Total Revenue --
select sum(total_price) As Total_Sales
from pizza_sales;
-- Avg Order Value --
select sum(total_price)/count(distinct order_id) As Avg_Order_Value
from pizza_sales;
-- Total Pizza Sold--
select sum(quantity)  as Total_Pizza_Sold
from pizza_sales;
-- Total Orders--
select count(distinct order_id) As Total_Orders
from pizza_sales;
-- Avg pizza Per order--
Select sum(quantity)/count(distinct order_id) as Avg_Pizza_per_Ord
from pizza_sales;
-- Daily Trend--
select dayname(order_date) As Day,format(sum(total_price),0) AS Total_Sales
from pizza_sales
group by day;
-- Monthly Trend--
select monthname(order_date) As Month,format(sum(total_price),0) As Total_Sales
from pizza_sales
group by Month;

-- Percentage of pizza Category --
select pizza_category, format(sum(total_price)*100/(select sum(total_price)from pizza_sales ),0) AS Ratio
from pizza_sales
group by pizza_category;
-- Percentage of pizza Size --
select pizza_size, format(sum(total_price)*100/(select sum(total_price)from pizza_sales ),2) AS PSR
from pizza_sales
group by pizza_size;
-- Top 5 Seller --
select pizza_name,sum(total_price) As Total_price
from pizza_sales
group by pizza_name
order by Total_price desc limit 5;
-- Quantity--
select pizza_name,sum(quantity) As Total_Quantity
from pizza_sales
group by pizza_name
order by Total_Quantity desc limit 5;
-- Order --
select pizza_name,count(distinct order_id) As Total_Order
from pizza_sales
group by pizza_name
order by Total_Order desc limit 5;
-- bottom 5 --
select pizza_name,sum(total_price) As Total_price
from pizza_sales
group by pizza_name
order by Total_price  limit 5;
-- quantity --
select pizza_name,sum(quantity) As Total_Quantity
from pizza_sales
group by pizza_name
order by Total_Quantity  limit 5;
-- order --
select pizza_name,count(distinct order_id) As Total_Order
from pizza_sales
group by pizza_name
order by Total_Order limit 5;

