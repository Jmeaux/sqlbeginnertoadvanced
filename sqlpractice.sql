USE AdventureWorks2016
GO


SELECT *
FROM person.CountryRegion  -- 238


/* 
Using your query result from question 7, the manager will like you to
rename the CountryRegionCode to display Region Code
*/

SELECT countryregioncode AS 'Region Code'
FROM person.countryregion  --238





/*
Look at the query below, is the query correct, if yes what will be the result.
If NO, what is wrong with the Query. The intention is to get the Name as Store Name
*/

-- No because of the order of the preocessing

SELECT 
	Name AS Store Name, 
	SalesPersonID
FROM [Sales].[Store]


/*
The query below is failing, and as a senior DA, your manager have asked you to
look at it and fixed it
*/

SELECT 
	unit price, 
	line total
FROM Sales.SalesOrderDetail

SELECT 
	unitprice, 
	linetotal
FROM sales.salesorderdetail  -- 121317

/*
Return the JobTitle ,BirthDate ,MaritalStatus, Gender from the
employee table that are married and gender is female 
Table: humanresource.employee
*/

SELECT 
	jobtitle, 
	birthdate, 
	maritalstatus, 
	gender
FROM humanresources.employee
WHERE maritalstatus = 'm' and gender = 'f'  -- 49






/*
Write a query to return the First Name, Middle Name and Last Name
from the person.person table who's LastNames are UNKNOWN
*/

SELECT 
	firstname, 
	middlename, 
	lastname
FROM person.person
WHERE lastname is null  -- 0



/*
You have been task to write a query that will return the 
SalesOrderID,SalesOrderNumber,PurchaseOrderNumber
,CustomerID,SalesPersonID,SubTotal,TaxAmt,TotalDue
from the sales.SalesOrderHeader table for those that have
total due grater than 1500
*/

SELECT 
	SalesOrderID,
	SalesOrderNumber,
	PurchaseOrderNumber,
	CustomerID,
	SalesPersonID,
	SubTotal,
	TaxAmt,
	TotalDue
FROM sales.salesorderheader
WHERE totaldue > 1500  -- 12542



/* 
You work for a manufacturing company and the directors are about
to make a decision on designing of a new product, 
they will like you to check in the product table to see if the 
product names listed below exists in the database. If they due, please return the records
	Chainring Nut
	Chain Stays
	Touring End Caps
	Flat Washer 1
*/

SELECT * 
FROM production.product
WHERE name in ('chainring nut', 'chain stays', 'touring end caps', 'flat washer 1')  -- 4




/*
The festive period is here and your company will like you to 
keep track of the inventory of the company. Your manager wants
 you to generate a dataset that will display the product ID, 
 shelf and quantity from the production.productinventory table. 
 Your manage only wants your dataset to return results where 
 the quantity is grater than 450 and the Bin is 7
*/

SELECT 
	productid, 
	shelf, 
	quantity
FROM production.productinventory
WHERE quantity > 450 and bin = 7  -- 16


/*  
Write a query to generate dataset that will display the 
Category,StartDate,EndDate,MinQty,MaxQty from the SpecialOffer table
that have category as reseller and the minimum quantity
are grater than or egual to 1 and maximum quantity are KNOWN
*/

SELECT 
	Category AS 'Reseller',
	StartDate,
	EndDate,
	MinQty,
	MaxQty
FROM sales.SpecialOffer
WHERE minqty <= 1 and maxqty is not null  -- 0




 /* 
Your manager will like you to generate datasets that will display the 
vendor name, account number and credit rating of those vendor whose name 
ends in les from the Purchasing.Vendor table
*/

SELECT 
	name, 
	accountnumber, 
	creditrating
FROM purchasing.vendor
WHERE name like '%les'  -- 17


 /* 
Using the result from question 10, exclude the records that their
Purchasing web Service URL are unknown
*/

SELECT 
name, 
accountnumber, 
creditrating
FROM purchasing.vendor
WHERE name like '%les' and PurchasingWebServiceURL is not null   -- 0




/* 
Due to so many compaint from customers, your manager wants
you to generate datasets that will display the scrap reason
from the production.scrapreason table that contain the word failed. 
this will help them respond to the customers accordingly
*/

SELECT *
FROM production.scrapreason
WHERE name like '%failed%'  -- 3






/*
Please generate dataset that will display the PreAssemblyQty
and BomLevel that have PreAssemblyQty less than or equal to 8.00
*/

SELECT 
	PerAssemblyQty, 
	BOMLevel
FROM [Production].[BillOfMaterials]
WHERE PerAssemblyQty <= 8.00  -- 2621



/*
Retrieve all records from the sales territory table; sort by  salesLastyear from 
lowest to highest
*/

SELECT *
FROM sales.salesterritory
ORDER BY SalesLastYear -- 10

/*
Retrieve all records from the sales territory table; sort by  salesLastyear from 
lowest to highest then by  SalesYTD from highest to lowest  
*/

SELECT *
FROM Sales.SalesTerritory
ORDER BY SalesLastYear, SalesYTD DESC  -- 10


/*
Retrieve ProductID,Name,ReorderPoint, StandardCost  from the products table, then
sort the record by ReorderPoint from lowest to highest then by  StandardCost 
from highest to lowest  
*/

SELECT 
	ProductID,
	Name,
	ReorderPoint, 
	StandardCost 
FROM Production.Product
ORDER BY ReorderPoint, StandardCost DESC  -- 504

/*
Retrieve top 5 records from the sales territory table; 
then sort the records by  salesLastyear from lowest to highest then by  
SalesYTD from highest to lowest 
*/

SELECT TOP 5 *
FROM Sales.SalesTerritory
ORDER BY SalesLastYear, SalesYTD DESC  -- 5

/*
Retrieve top 22 ProductID,SpecialOfferID,UnitPrice from the Sales.SalesOrderDetail; 
sort by SpecialOfferID from highest to lowest then by  UnitPrice from lowest to highest 
*/

SELECT 
	top 22 ProductID,
	SpecialOfferID,
	UnitPrice
FROM Sales.SalesOrderDetail
ORDER BY SpecialOfferID DESC, UnitPrice  -- 22

/*
Provide all the records from the Sales.SalesOrderDetail table that has a linetotal that 
is greater than 2000
*/

SELECT *
FROM Sales.SalesOrderDetail
WHERE LineTotal > 2000  -- 21155

/*
Please provide a list of store names serviced  by salespersonIDs 277,280 and 286 
*/

SELECT *
FROM sales.store
WHERE SalesPersonID in (277, 280, 286)  -- 154

/*
Please provide all Products from the product table where is Color is unknown
*/

SELECT *
FROM Production.product
WHERE color is null  -- 248

/*
Please provide all Products from the product table where is Name  starts with mountain 
*/

SELECT *
FROM production.product
WHERE name like 'mountain%'  -- 38