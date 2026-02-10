
/*
SQL Practice Summary

Used EXCEPT to find customers who never ordered and customers who ordered in one year but not another.

Used GROUP BY and HAVING to identify customers with exactly one order.

Used INTERSECT to find customers who ordered in multiple years.

Focus: choosing between set logic (presence/absence) and aggregation (counts).
*/






SELECT 
	customerid
FROM	
	sales.customer
EXCEPT
SELECT
	customerid,
	salesorderid
FROM  
	sales.salesorderheader


---------------------------------------------


SELECT
	customerid,
	COUNT(*) AS ordercount
FROM sales.salesorderheader
GROUP BY
	customerid
HAVING COUNT(*) = 1

----------------------------------------------------------------


SELECT
	customerid
FROM sales.salesorderheader
WHERE YEAR(orderdate) = 2014
EXCEPT
SELECT
	customerid
FROM sales.salesorderheader
WHERE YEAR(orderdate) = 2015

-------------------------------------------------------------------


SELECT
	customerid
FROM sales.salesorderheader
WHERE YEAR(orderdate) = 2013
INTERSECT
SELECT
	customerid
FROM sales.salesorderheader
WHERE YEAR(orderdate) = 2014



	

