CREATE TABLE pizza_data.pizza_sale
    (order_id INT,
    order_date DATE,
    pizza_name VARCHAR(100),
    size VARCHAR(20),
    quantity INT,
    total_price DECIMAL(10,2));
    
    SELECT*
    FROM pizza_sales;
    
    select*
    from pizza_sales
    where pizza_id is null;
    
    select *
    from pizza_sales 
    where unit_price < 15.00;
    
    -- TO FIND THE BEST SELLING PIZZA FROM THE QUANTITY 
    
SELECT pizza_name, 
sum(quantity) AS total_quantity_sold
FROM pizza_data.pizza_sales
GROUP BY pizza_name
ORDER BY total_quantity_sold DESC;

     -- TO GET TOTAL REVENUE
	
Select 
sum(total_price) as total_revenue
from pizza_data.pizza_sales;

Select total_price,
sum(total_price) as total_revenue
from pizza_data.pizza_sales
group by total_price
order by total_revenue desc;

-- TO GET THE SIZE WITH MOST REVENUE

Select pizza_size,
sum(total_price) as total_size_revenue
from pizza_data.pizza_sales
group by pizza_size
order by total_size_revenue asc;

-- TO GET MONTHLY REVENUE

Select *
from pizza_sales;

Select 
    date_format(order_date, '%Y-%m') as month,
    sum(total_price) as monthly_revenue
from pizza_data.pizza_sales
group by month
order by month;

-- TO GET BUSIEST ORDER DAY

SELECT 
    DATE(order_date) AS day, 
    COUNT(order_id) AS total_orders
FROM pizza_data.pizza_sales
GROUP BY day
ORDER BY total_orders DESC
LIMIT 5;

-- AVERAGE PRICE

Select 
avg (total_price) as Average_order_price
from pizza_data.pizza_sales;

-- RECENTLY ORDERED PIZZA

select pizza_size, 
count(*) AS orders
from pizza_data.pizza_sales
group by  pizza_size
order by orders DESC;


