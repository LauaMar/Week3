-- Write a SQL query to find the name and price of the cheapest item(s)
-- es.30 in https://www.w3resource.com/sql-exercises/sql-retrieve-from-table.php

select * 
from item_mast

Select pro_name, pro_price
from item_mast
where pro_price = 
	(select MIN(pro_price) from item_mast)

-- Write a SQL query to display the average price of the items for each company, showing only the company code.
-- es.29 in https://www.w3resource.com/sql-exercises/sql-retrieve-from-table.php

select *
from item_mast

select pro_com, AVG(pro_price)
from item_mast
group by pro_com

/* Write a SQL query to display the name and price of all the items with a price is equal or more than Rs.250, 
and the list contain the larger price first and then by name in ascending order. */
-- es.28 in https://www.w3resource.com/sql-exercises/sql-retrieve-from-table.php

select *
from item_mast

Select pro_name, pro_price
from item_mast
where pro_price>=250.00
order by pro_price desc, pro_name

--Write a SQL query to calculate the average price of all products of the manufacturer which code is 16. 
--es.26 in https://www.w3resource.com/sql-exercises/sql-retrieve-from-table.php

select *
from item_mast

Select AVG(pro_price) as [average price], pro_com
from item_mast
--where pro_com = 16 -- funziona allo stesso modo
group by pro_com
having pro_com = 16

--Write a SQL query to find all the products with a price between Rs.200 and Rs.600.
--es.25 in https://www.w3resource.com/sql-exercises/sql-retrieve-from-table.php

select *
from item_mast

select *
from item_mast
where pro_price Between 200 and 600

--Write a SQL query to show all the winners in Physics for 1970 together with the winner of Economics for 1971
-- es.19 in https://www.w3resource.com/sql-exercises/sql-retrieve-from-table.php

select *
from nobel_win
where subject = 'physics' and year = 1970
union
select *
from nobel_win
where subject = 'Economics' and year = 1971


--Write a SQL query to show all the winners of nobel prize in the year 1970 except the subject Physiology and Economics
-- es.19 in https://www.w3resource.com/sql-exercises/sql-retrieve-from-table.php

select *
from nobel_win 
where year = 1970 
	--and subject in ('Physics','Chemistry','Literature')
	and subject not in ('Physiology','Economics')


/* Write a SQL query to find all the details of the nobel winners for the subject not started with the letter 'P' 
   and arranged the list as the most recent comes first, then by name in order. */
-- es.23 in https://www.w3resource.com/sql-exercises/sql-retrieve-from-table.php
select *
from nobel_win
where subject not like 'P%'
order by year desc, winner

/* Write a SQL query to find all the details of 1970 winners by the ordered to subject and winner name; but the list 
contain the subject Economics and Chemistry at last. */
---- es.24 in https://www.w3resource.com/sql-exercises/sql-retrieve-from-table.php

select *
from nobel_win
where year=1970 and subject not in('Economics','Chemistry')
--order by subject, winner -- se metto questo non funziona
union
select *
from nobel_win
where year=1970 and subject in('Economics','Chemistry')

-- soluzione es.24 proposta, ma non l'ho capita
select*
from nobel_win
where year =1970
order by 
case
	when subject IN ('Economics','Chemistry') then 1
	else 0
end asc, 
subject, winner

-- Write a SQL statement to get the maximum purchase amount of all the orders. 
-- es 6 from https://www.w3resource.com/sql-exercises/sql-aggregate-functions.php

select *
from orders
where purch_amt = (select MAX(purch_amt) from orders)

--Write a SQL statement to find the highest purchase amount ordered by the each customer with their ID and 
-- highest purchase amount. 
-- es 9 from https://www.w3resource.com/sql-exercises/sql-aggregate-functions.php
select customer_id, MAX(purch_amt) as [highest purchase amount]
from orders 
group by customer_id
order by customer_id

--Write a SQL statement to find the highest purchase amount ordered by the each customer on a particular date 
--with their ID, order date and highest purchase amount.
-- es 10 from https://www.w3resource.com/sql-exercises/sql-aggregate-functions.php

select customer_id, ord_date, MAX(purch_amt) as[highest purchase amount]
from orders
group by customer_id,ord_date
order by [highest purchase amount]

--Write a SQL statement to find the highest purchase amount on a date '2012-08-17' for each salesman with their ID.  
-- es 11 from https://www.w3resource.com/sql-exercises/sql-aggregate-functions.php

select * from orders

select salesman_id, max(purch_amt) as [highest purchase amount]
from orders
where ord_date='2012-08-17'
group by salesman_id

--Write a SQL statement to find the highest purchase amount with their ID and order date, for only those customers who 
--have highest purchase amount in a day is more than 2000.
-- es 12 from https://www.w3resource.com/sql-exercises/sql-aggregate-functions.php
select customer_id,ord_date, Max(purch_amt)
from orders
--where purch_amt>2000
group by customer_id,ord_date
having max(purch_amt)>2000 --alternativa al precedente

--Write a SQL statement to find the highest purchase amount with their ID and order date, for those customers who have
--a higher purchase amount in a day is within the range 2000 and 6000. 
-- es 13 from https://www.w3resource.com/sql-exercises/sql-aggregate-functions.php
select customer_id,ord_date, Max(purch_amt)
from orders
--where purch_amt>2000
group by customer_id,ord_date
having max(purch_amt) between 2000 and 5000--alternativa al precedente

--Write a SQL statement to find the highest purchase amount with their ID and order date, for only those customers who 
--have a higher purchase amount in a day is within the list 2000, 3000, 5760 and 6000.  
-- es 14 from https://www.w3resource.com/sql-exercises/sql-aggregate-functions.php
select customer_id,ord_date, Max(purch_amt)
from orders
--where purch_amt>2000
group by customer_id,ord_date
having max(purch_amt) in ('2000', '3000', '5760', '6000')--alternativa al precedente

--Write a SQL statement to find the highest purchase amount with their ID, for only those customers whose ID
-- is within the range 3002 and 3007. 
-- es 15 from https://www.w3resource.com/sql-exercises/sql-aggregate-functions.php
select customer_id, MAX(purch_amt)
from orders
group by customer_id
having customer_id between 3002 and 3007

-- Write a SQL statement to display customer details (ID and purchase amount) whose IDs are within the 
--range 3002 and 3007 and highest purchase amount is more than 1000. 
-- es 16 from https://www.w3resource.com/sql-exercises/sql-aggregate-functions.php

select customer_id, max(purch_amt) as [highest purchase amount]
from orders
group by customer_id
having customer_id between 3002 and 3007
    and Max(purch_amt)>1000
	

