select Country, count(Country) as country_count from customers 
group by country order by country_count asc;

select Country, City, count(city) as city_count from customers 
group by country, city order by city_count desc; 

select Country, City from customers;

-- having 연습
select Country, count(Country) as cc from customers
group by Country having cc > 5  order by cc desc;

select ProductName, Price from products 
where ProductName like "c%" and Price > 20
order by Price desc;

select CategoryID, sum(Price), max(Price), min(Price) 
from products group by CategoryID;

select CustomerName, OrderDate from customers 
inner join orders
on orders.CustomerID = customers.CustomerID;

select customers.CustomerName, orders.OrderDate from customers 
inner join orders
on orders.CustomerID = customers.CustomerID;

select c.CustomerName, o.OrderDate from customers as c 
inner join orders as o
on o.CustomerID = c.CustomerID;

select c.CustomerName, o.OrderDate from customers as c 
left join orders as o
on o.CustomerID = c.CustomerID;

select c.CustomerName, o.OrderDate from customers as c 
right join orders as o
on o.CustomerID = c.CustomerID;

select c.CustomerName, o.OrderDate from customers as c 
left join orders as o
on o.CustomerID = c.CustomerID
union all
select c.CustomerName, o.OrderDate from customers as c 
right join orders as o
on o.CustomerID = c.CustomerID;


Select s.country, c.categoryname, p.productname, p.price, count(*)
from suppliers as s
inner join products as p
On s.supplierid = p.supplierid
inner join categories as c
On p.categoryid = c.categoryid
Group by s.country;

select s.City, s.SupplierName, p.ProductName, p.Price
from Products as p
inner join suppliers as s
on s.SupplierID = p.SupplierID
where s.City = 'Tokyo';

select s.City, s.SupplierName, p.ProductName, p.Price
from products as p, suppliers as s
where p.SupplierID = s.SupplierID and s.City = "Tokyo";

select s.City, s.SupplierName, p.ProductName, p.Price
from products p, suppliers s
where p.SupplierID = s.SupplierID and s.City = "Tokyo";

select c.CategoryID, c.CategoryName, p.ProductName
from products p
inner join categories c
on p.CategoryID = c.CategoryID
where c.CategoryName = 'Seafood'; 

select c.CategoryID, c.CategoryName, p.ProductName
from products p, categories c
where p.CategoryID = c.CategoryID
and c.CategoryName = 'Seafood'; 

select s.Country, c.CategoryName, count(p.ProductID), avg(p.Price)
from products p
inner join suppliers s
on p.SupplierID = s.SupplierID
inner join categories c
on p.CategoryID = c.CategoryID
group by s.Country, c.CategoryName;

select s.Country, c.CategoryName, count(p.ProductID), avg(p.Price)
from products p, suppliers s, categories c
where p.CategoryID = c.CategoryID and s.SupplierID = p.SupplierID
group by s.Country, c.CategoryName;

select o.OrderID, c.CustomerName, e.LastName, s.ShipperName, count(*)
from orders o
inner join customers c
on o.CustomerID = c.CustomerID
inner join employees e
on o.EmployeeID = e.EmployeeID
inner join shippers s
on o.ShipperID = s.ShipperID
inner join order_details od
on o.OrderID = od.OrderID
group by od.OrderID;

select o.OrderID, c.CustomerName, e.LastName, s.ShipperName, count(*)
from orders o, customers c, employees e, shippers s, order_details od
where o.CustomerID = c.CustomerID and o.EmployeeID = e.EmployeeID and
s.ShipperID = o.ShipperID and o.OrderID = od.OrderID
group by od.OrderID;

select s.supplierName, sum(od.Quantity) as total_quantity
from suppliers s
inner join products p
on p.SupplierID = s.SupplierID
inner join order_details od
on od.ProductID = p.ProductID
group by s.SupplierName
order by total_quantity desc
limit 3;

select s.supplierName, sum(od.Quantity) as total_quantity
from suppliers s, products p, order_details od
where p.SupplierID = s.SupplierID and od.ProductID = p.ProductID
group by s.SupplierName
order by total_quantity desc
limit 3;

select c.CategoryName, cm.City, sum(od.Quantity) as total_quantity
from order_details od
inner join products p
on p.ProductID = od.ProductID
inner join categories c
on c.CategoryID = p.CategoryID
inner join orders o
on o.OrderID = od.OrderID
inner join customers cm
on cm.CustomerID = o.CustomerID
group by c.CategoryID, cm.City
order by total_quantity desc;

select c.CategoryName, cm.City, sum(od.Quantity) as total_quantity
from order_details od, products p, categories c, orders o, customers cm
where p.ProductID = od.ProductID 
and c.CategoryID = p.CategoryID 
and o.OrderID = od.OrderID
and cm.CustomerID = o.CustomerID
group by c.CategoryId, cm.City
order by total_quantity desc;


select c.Country, p.ProductName, sum(od.Quantity) as total_quantity, 
sum(od.Quantity * p.Price) as total_price
from Customers c, Products p, Orders o, Order_Details od
where c.CustomerID = o.CustomerID
and o.OrderID = od.OrderId
and od.ProductID = p.ProductID
and c.country = 'USA'
group by p.ProductName
order by total_price desc;



