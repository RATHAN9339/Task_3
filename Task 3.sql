create  database bike;

use bike;

select * from order_items;

select order_id,quantity,list_price,discount from order_items where discount>0.05;

select order_id,quantity,list_price,discount from order_items
 where discount>0.05 order by list_price asc;
 
 select customer_id, count(order_id) as total_orders  from orders 
 group by customer_id order by total_orders desc;
 
SELECT 
    o.order_id,o.order_date,
    c.first_name,c.last_name
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
ORDER BY o.order_date;

SELECT 
    p.product_name,c.category_name
FROM products p
LEFT JOIN categories c ON p.category_id = c.category_id
ORDER BY p.product_name;

SELECT 
    c.category_name,
    p.product_name
FROM products p
RIGHT JOIN categories c ON p.category_id = c.category_id
ORDER BY c.category_name;

SELECT 
    product_name,
    (SELECT SUM(quantity)
     FROM order_items oi
     WHERE oi.product_id = p.product_id) AS total_quantity_sold
FROM products p
ORDER BY total_quantity_sold DESC;

Select * from orders;

select * from order_items;


select  item_id,sum(quantity) as total_quantity from order_items group by item_id;

select  item_id,avg(list_price) as average_price 
from order_items group by item_id order by average_price;

CREATE VIEW top_selling_products AS
SELECT 
    p.product_id,
    p.product_name,
    SUM(oi.quantity) AS total_quantity_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_quantity_sold DESC;

SELECT * FROM top_selling_products;

CREATE INDEX idx_customer_id
ON customers(customer_id);

SELECT * FROM customers WHERE customer_id = 105;


