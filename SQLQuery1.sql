select * from
[Order] o
JOIN customer c
ON o.customerId = c.Id
where c.Id = 85

select * from Customer
where Id = 85 

select * from 
Customer c
Left JOIN [Order] o
ON o.customerId = c.Id


--1.Provide the first and last name of the customer, invoice number, and invoice amount."
Select * from
[Order] o
JOIN Customer c 
ON o.CustomerId = c.Id

--2.Display all products and add 2 columns for the supplier's name..
Select p.ProductName,s.CompanyName,s.ContactName *
from Product p 
INNER JOIN Supplier s 
ON p.SuplierId = S.Id

--3.Show the invoice number, invoice date, product name, individual catalog price of the product, and individual selling price of the product on the invoice.
select o.OrderNumber, o.OrderDate,p.ProductName,p.UnitPrice,oi.UnitPrice
from OrderItem oi
JOIN [OrderItem] o
ON o.Id = oi.OrderId
JOIN Product p
ON p.Id = oi. ProductId

--4.Display all invoices from the year 2012, along with the first and last name of the customer.
select orderdate,FirstName,TotalAmount from [Order] o 
JOIN Customer c 
ON c.Id = o.CustomerId
where year (OrderDate) = 2012
--5.List the products and their suppliers only for the products with a catalog price > 50.
select * from Product p
JOIN Supplier s
ON s.Id = p.SupplierId
where UnitPrice > 50 
--6.List the countries and the names of customers who placed orders in April 2014, and sort them by country in descending order.
select distinct Country,FirstName,LastName,OrderDate
from Customer c
JOIN [Order] o
ON c.Id = o.CustomerId
where year(o.OrderDate) = 2014 and month (o.OrderDate) = 4 
order by Country desc
--7.Display the products and their suppliers, and filter out the products with a selling price > 200.
select *
from Product p
JOIN Supplier s
ON p.SupplierId = s.Id
JOIN OrderItem oi
ON oi.ProductId = p.Id
where oi. UnitPrice > 200
--8.List the names of the products and the names of their suppliers for the products that are in stock (where 1 is not in stock).
select * from Product p 
JOIN Supplier s
ON p.supplierId = s.Id
where IsDiscontinued = 0 
--9.List all invoices and add a column for their customers with invoices exceeding $1000.
select * from [Order] o 
JOIN Customer c 
ON c.id = o.customerid
where o.totalamount > 1000
--10. List all customers who placed orders in 2013 and 2014 and are from Germany.
select distinct c.Firstname,c.LastName
from customer c
JOIN [Order] o 
ON o.customerid = c.Id
where year (o.OrderDate) in 2013,2014 and c.Country 'Germany'

-- 11.Display the suppliers who have not sold any products.
select CompanyName 
from Supplier s
LEFT JOIN Product p
ON p.SupplierId = s.Id
LEFT JOIN OrderItem oi
ON oi.ProductId = p.Id 
where oi.Id is NULL 

--12.Display all products that were sold at a discount, i.e., sold at a price lower than the catalog price.
select * 
from Product p 
JOIN OrderItem oi
ON oi.ProductId = p.Id
where oi.UnitPrice < p.UnitPrice

--13.Display all customers who placed orders in 2012 and are from France, with the first and last names attached in one column.
select CONCAT(c.Firstname,''c.LastName) as fullname 
from Customer c
JOIN [Order] o
ON c.id = o.CustomerId
where year(o.OrderDate) = 2012 and c.Country = 'France'

--14.This SQL query retrieves the full names of customers who placed orders in 2012 and are from France by concatenating their first and last names.
select  c.Firstname +''+c.LastName as fullname 
from Customer c
JOIN [Order] o
ON c.id = o.CustomerId
where year(o.OrderDate) = 2012 and c.Country = 'France'
