
/*
-- Analyzes customer order frequency in AdventureWorks by day and month.
-- Identifies customers with single vs multiple orders per day, repeat
-- purchasing across days, and recurring activity within the same month
-- using CTEs, date normalization, and aggregation.

*/




WITH ROW_PER_DAY AS(
SELECT
	CAST(orderdate AS DATE) AS newdate,
	customerid,
	COUNT(*) AS ordercount
FROM sales.SalesOrderHeader
GROUP BY
	CAST(orderdate AS DATE),
	customerid
), customer_count AS
(
SELECT *
FROM ROW_PER_DAY
WHERE ordercount = 1
) 
SELECT newdate, COUNT(*) AS customer_total
FROM customer_count
GROUP BY 
	newdate
ORDER BY
	newdate
GO

WITH day_customer AS(
	SELECT 
		CAST(orderdate AS DATE) AS newdate,
		customerid,
		COUNT(*) AS orderscount
	FROM sales.SalesOrderHeader
	GROUP BY 
		CAST(orderdate AS DATE),
		customerid
)
SELECT 
	newdate,
	COUNT(*) AS customercount
FROM day_customer
WHERE orderscount  > 2
GROUP BY 
	newdate
ORDER BY 
	newdate

go

WITH orderlevel AS (SELECT 
	CAST(orderdate AS DATE) AS newdate,
	customerid,
	COUNT(*) AS ordercount
FROM sales.SalesOrderHeader
GROUP BY 
	CAST(orderdate AS DATE),
	customerid
)
SELECT
	newdate,
	customerid,
	COUNT(*) AS customercount
FROM orderlevel
WHERE ordercount >= 2
GROUP BY 
	CustomerID, 
	newdate
GO

WITH customer_day AS (
	SELECT 
		CAST(orderdate AS DATE) AS newdate, 
		customerid, 
		COUNT(*) AS orders
	FROM sales.SalesOrderHeader
	GROUP BY 
		CAST(orderdate AS DATE),
		customerid
)
SELECT 
	newdate,
	COUNT(*) AS cusomters
FROM customer_day
WHERE orders > 1
GROUP BY 
	newdate
ORDER BY 
	newdate

GO

WITH customer_month AS(
	SELECT 
		customerid,
		DATEPART(month, orderdate) AS datemonth,
		COUNT(*) AS orders
	FROM sales.SalesOrderHeader
	GROUP BY 
		customerid,
		DATEPART(month, orderdate)
)
SELECT 
	customerid,
	COUNT(*) AS months
FROM customer_month
WHERE orders > 1
GROUP BY 
	customerid
ORDER BY 
	customerid

GO

WITH customer_day AS (SELECT
	CAST(orderdate AS DATE) AS realdate,
	soh.customerid,
	COUNT(*) AS orders
FROM sales.SalesOrderHeader soh
GROUP BY 
	CAST(orderdate AS DATE),
	soh.customerid
)
SELECT
	customerid,
	COUNT(*) AS dayscount
FROM customer_day
WHERE orders > 1
GROUP BY
	customerid
ORDER BY
	customerid

GO

WITH customer_day_month AS (SELECT
	DATEFROMPARTS(
	YEAR(orderdate),
	MONTH(orderdate), 1
	) AS yearmonth,
	CAST(orderdate AS DATE) AS newdate,
	customerid,
	COUNT(*) AS orders
FROM sales.SalesOrderHeader
GROUP BY
	DATEFROMPARTS(YEAR(orderdate), MONTH(orderdate), 1),
	CAST(orderdate AS DATE),
	customerid
)
SELECT 
	yearmonth,
	customerid,
	COUNT(*) AS daycount
FROM customer_day_month
WHERE orders > 1
GROUP BY 
	customerid,
	yearmonth
ORDER BY 
	customerid

	


GO

WITH customer_day AS (SELECT
	customerid,
	CAST(orderdate AS DATE) AS newdate
FROM sales.SalesOrderHeader
GROUP BY 
	customerid,
	CAST(orderdate AS DATE)
)
SELECT 
	customerid,
	COUNT(*) AS daycount
FROM customer_day
GROUP BY 
	customerid
HAVING COUNT(*) >= 3
ORDER BY 
	customerid

GO

WITH customer_day AS (SELECT
	customerid,
	CAST(orderdate AS DATE) AS newdate,
	DATEFROMPARTS(YEAR(orderdate), MONTH(orderdate), 1) AS yearmonth
FROM sales.SalesOrderHeader
GROUP BY
	customerid,
	CAST(orderdate AS DATE),
	DATEFROMPARTS(YEAR(orderdate), MONTH(orderdate), 1)
)
SELECT 
	customerid,
	yearmonth,
	COUNT(*) AS daycount
FROM customer_day
GROUP BY
	customerid,
	yearmonth
HAVING COUNT(*) >= 3
ORDER BY 
	customerid


SELECT
	customerid,
	CAST(orderdate AS DATE) AS order_date
FROM sales.salesorderheader
GROUP BY
	customerid,
	CAST(orderdate AS DATE)
ORDER BY 
	CAST(orderdate AS DATE) desc
