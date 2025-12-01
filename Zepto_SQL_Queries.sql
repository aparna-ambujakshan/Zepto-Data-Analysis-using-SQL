create database zepto;
use zepto;
show tables;
select * from zepto;
select count(*) from zepto;
ALTER TABLE zepto
CHANGE COLUMN 'Category' 'category' VARCHAR(255);

select * from zepto 
where 
name is null or
category is null or
mrp is null or
discountPercent is null or
discountedSellingPrice is null or
availableQuantity is null or 
weightInGms is null or 
outOfStock is null or 
quantity is null;

##Different product categories

select distinct category
from zepto
order by category;

## Products instock vs outofstock
select outOfStock, count(sku_id)
from zepto
group by outOfStock;

## Product names present multiple times
select name, count(sku_id) as No_of_SKU
from zepto
group by name
having No_of_SKU > 1
order by No_of_SKU desc;

## Data Cleaning

#Products with 0 mrp

select * from zepto
where mrp = 0 or discountedSellingPrice =0;

#Temporarily disable safe updates
SET SQL_SAFE_UPDATES = 0;
DELETE FROM zepto WHERE mrp = 0;
SET SQL_SAFE_UPDATES = 1;  -- turn it back on

#convert paise to rupees
update zepto
set mrp = mrp/100.0,
discountedSellingPrice = discountedSellingPrice/100.0;

##Q1. Find the top best—value products based on the discount percentage.
select distinct name, mrp, discountPercent
from zepto
order by discountPercent desc
limit 10;

##Q2. What are the Products with High MRP but Out of Stock
select distinct name, mrp
from zepto
where outOfStock = 'TRUE' and mrp > 300
order by mrp desc;

##Q3. Calculate Estimated Revenue for each category
select category,
sum(discountedSellingPrice * availableQuantity) as Total_Revenue
from zepto
group by category
order by Total_revenue;

##Q4. Find all products where MRP is greater than 500 and discount is less than 10%.
select distinct name, mrp, discountPercent
from zepto
where mrp > 500 and discountPercent < 10
order by mrp desc, discountPercent desc;

##Q5. Identify the top 5 categories offering the highest average discount percentage.
select category, round(avg(discountPercent),2) as Avg_discount
from zepto
group by category
order by avg_discount desc
limit 5;

##Q6. Find the price per gram for products above 1OOg and sort by best value.
select distinct name, weightInGms, discountedSellingPrice,
round(discountedSellingPrice/weightInGms,2) as price_per_gram
from zepto
where weightInGms >= 100
order by price_per_gram;

##Q7 .Group the products into categories like Low, Medium, Bulk.
select distinct name, weightInGms,
case when weightInGms < 1000 then 'Low'
	when weightInGms < 5000 then 'Medium'
    else 'Bulk'
    end as weight_category
from zepto;

##Q8.What is the Total Inventory Weight Per Category
select category, sum(weightInGms * availableQuantity) as total_weight
from zepto
group by category
order by total_weight;