WITH salesum AS (SELECT 
	customerid,
	SUM(totaldue) AS customertotal
FROM 
	sales.salesorderheader
GROUP BY
	customerid
)
SELECT customerid
FROM salesum
WHERE customertotal > 10000
