USE AdventureWorks2016


/* 
You have been tasked to return the first Name, Middle Name and last Name 
from the person.Person table
*/

SELECT
	firstname,
	middlename,
	lastname
FROM person.person --19972



/* 
You manager will like you to use your answer from question 1
and rename the firstName to FName and the Last Name to LName
*/

SELECT 
	firstname AS FName,
	lastname AS LName
FROM 
	person.person --19972




/* 
Your manager wants you to write a query to return all the records 
from the Person.CountryRegion
*/

SELECT * 
FROM
	person.countryregion --238



/* 
Using your query result from question 3, the manager will like you to
rename the CountryRegionCode to display Region Code
*/

SELECT 
	countryregioncode AS 'Region Code'
FROM 
	person.countryregion --238



/*
Look at the query below, is the query correct, if yes what will be the result.
If NO, what is wrong with the Query. The intention is to get the Name as Store Name
*/
SELECT 
	Name AS Store Name, 
	SalesPersonID
FROM 
	[Sales].[Store]

-- It is not correct, SQL does not recognize 'Name' because of the order that it reads the code





/*
The query below is failing, and as a senior DA, your manager have asked you to
look at it and fixed it. What is wrong with the code and what is the correct code?
*/

SELECT 
	unit price, line total
FROM 
	Sales.SalesOrderDetail

--SQL does not recognize 'unit' or 'line'

SELECT 
	unitprice, 
	linetotal
FROM 
	sales.salesorderdetail -- 121,317 







/*
Please provide a list of store names serviced  by salespersonIDs 277,280 and 286
 
*/

SELECT
	name
FROM
	sales.store
WHERE salespersonid in (277, 280, 286) --154





/*
Please return all the records in the Person.Person table
*/

SELECT * 
FROM
	person.person  --19972




/* 
Using your answer from question 8, please return the first name, last name
and middle name from the person.person
*/

SELECT
	firstname, 
	lastname, 
	middlename
FROM 
	person.person  --19972







/*
Return all the records from the Person.CountryRegion where
the name is Australia 
*/

SELECT *
FROM
	person.countryregion
WHERE name = 'Australia'  -- 1




/* 
 As a data analyst you have been task by your 
 manager to return the currencycode and name from 
 the Sales.Currency table. It is important that 
 as part of the request that you return only the name
 names that is Naira
*/

SELECT
	currencycode, 
	name
FROM
	sales.currency
WHERE name = 'Naira'  -- 1




/* 
Please return all the records from the person.address table
*/

SELECT *
FROM
	person.address  --19614

/* 
Using your code from question 12, please return only the city, postal code,
and the address ID
*/

SELECT
	city, 
	postalcode, 
	addressid
FROM 
	person.address  -- 19614

/* 
It is the holiday season and your manager wants you to write a code
that will return all the records from the humanresource.employees table.
*/

SELECT * 
FROM
	humanresources.employee  -- 290






/* 
Using the answer you got from question 14, your manager now wants your to
only display the jobtitle, the birthdate, the vacation hours
and their sick leave hours of the employees.
*/

SELECT
	jobtitle, 
	birthdate, 
	vacationhours, 
	sickleavehours
FROM
	humanresources.employee  -- 290

 /*
Return the JobTitle ,BirthDate ,MaritalStatus, Gender from the
employee table that are married 
*/

SELECT
	jobtitle, 
	birthdate, 
	maritalstatus, 
	gender
FROM 
	humanresources.employee
WHERE maritalstatus = 'm'  -- 146



 /*
Return the JobTitle ,BirthDate ,MaritalStatus, Gender from the
employee table that are female 
*/

SELECT
	jobtitle, 
	birthdate, 
	maritalstatus, 
	gender
FROM humanresources.employee
WHERE gender = 'f'  -- 84


/* 
You work for a manufacturing company and the directors are about
to make a decision on designing of a new product, 
they will like you to check in the production.product table to see if the 
product names listed below exists in the database
	Chainring Nut
	Chain Stays
	Touring End Caps
	Flat Washer 1
*/

SELECT *
FROM production.product
WHERE name in ('chainring nut', 'chain stays', 'touring end caps', 'flat washer 1') -- 4




/*
The festive period is here and your company will like you to 
keep track of the inventory of the company. Your manager wants
 you to generate a dataset that will display the product ID, 
 shelf and quantity from the product.productinventory table. 
*/

SELECT
	productid, 
	shelf, 
	quantity
FROM 
	production.productinventory  -- 1069








