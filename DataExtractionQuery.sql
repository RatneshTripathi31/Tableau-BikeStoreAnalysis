USE [BikeStore]


SELECT cus.customer_id,
CONCAT( cus.first_name,' ',cus.Last_name)as Customer_Name,
cus.city,
cus.state, 
ord.order_id,
ord.order_date,
SUM(ite.quantity) as Total_quantity,
SUM(ite.quantity*ite.list_price) as Total_Revenue ,
pro.product_name,
cat.category_name,
brd.brand_name,
sto.store_name,
CONCAT( stf.first_name,' ',stf.Last_name)as Sales_Person
FROM  sales.customers cus 
JOIN sales.orders ord 
ON cus.customer_id=ord.customer_id 
JOIN sales.order_items ite 
ON ord.order_id=ite.order_id
JOIN production.products pro
ON ite.product_id=pro.product_id
JOIN production.categories cat
ON pro.category_id= cat.category_id
JOIN sales.stores sto
ON sto.store_id=ord.store_id
JOIN sales.staffs stf 
ON stf.staff_id=ord.staff_id
JOIN production.brands brd
ON brd.brand_id= pro.brand_id
group by
cus.customer_id, 
CONCAT( cus.first_name,' ',cus.Last_name),
cus.city,
cus.state, 
ord.order_id, 
ord.order_date,
pro.product_name, 
cat.category_name,
brd.brand_name,
sto.store_name,
CONCAT( stf.first_name,' ',stf.Last_name)
order by cus.customer_id;






/*

select * from sales.order_items;
select * from sales.orders;

select * from sales.staffs;
select * from sales.stores;
*/
