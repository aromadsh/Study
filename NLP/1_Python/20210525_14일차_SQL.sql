use w3schools;

SELECT * FROM Customers
ORDER BY CustomerName ASC;

select CustomerName, Country from customers; 

select distinct Country from customers;

select * from customers where Country = 'France';

select * from customers where ContactName like 'Mar%';

select * from customers where ContactName like '%et';

select * from customers where Country = 'France' and CustomerName like 'La%';

select * from customers where Country = 'France' and CustomerName like 'La%';

select * from customers where country = 'Germany' or CustomerName like 'Ma%';

select * from customers where not country = 'France';

select * from customers where Country in ('France', 'Spain')

SELECT * FROM w3schools.products where Price >= 15 and Price <= 20;

select * from products where Price between 15 and 20;

select ProductId from products where Price between 15 and 20;

select * from products where ProductID in (select ProductId from products where Price between 15 and 20)

SELECT * FROM customers where PostalCode is NULL;

SELECT * FROM customers where PostalCode is not NULL;

select * from customers order by CustomerName asc;

select * from products order by Price desc;

select * from customers order by CustomerName asc, Country desc;

select * from customers order by Country desc, CustomerName asc;

select * from customers where Country = 'UK' limit 3;

select * from customers where Country = 'UK';

select * from customers where Country = 'UK' order by CustomerName desc limit 3;

select 
*,
case 
	when price < 30 then '저' 
    when price <= 50 then '중' 
    else '고' 
end
from products;

select 
*,
case 
	when price < 30 then '저' 
    when price <= 50 then '중' 
    else '고' 
end as Category 
from products;

select count(country) as country_count from customers where Country = 'France';

select avg(price) from products;

select sum(Quantity) from order_details;

select min(price) from products;

select max(price) from products;