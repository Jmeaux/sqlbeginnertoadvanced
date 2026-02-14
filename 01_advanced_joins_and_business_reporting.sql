/*
Return a list of first name, last name and  phone numbers 
All records need to have phone numbers
*/

select p.firstname, p.lastname,
(
	select pp.phonenumber
	from person.personphone pp
	where pp.businessentityid = p.BusinessEntityID
	)
from person.person p

SELECT 
    p.FirstName,
    p.LastName,
    CASE 
        WHEN (
            SELECT pp.PhoneNumber
            FROM Person.PersonPhone pp
            WHERE pp.BusinessEntityID = p.BusinessEntityID
        ) IS NULL THEN 'No Phone Number'
        ELSE (
            SELECT pp.PhoneNumber
            FROM Person.PersonPhone pp
            WHERE pp.BusinessEntityID = p.BusinessEntityID
        )
    END AS PhoneNumber
FROM Person.Person p;



/*
Using the same tables from question 1, provide a concatenated value that includes Title, First Name, Middle Name, Last name and Suffix . 
Alias this as Full name. Also include their email addresses. All records need to have an email address
*/

SELECT 
    CONCAT(
        p.Title, ' ',
        p.FirstName, ' ',
        p.MiddleName, ' ',
        p.LastName, ' ',
        p.Suffix
    ) AS FullName, (
    select pe.emailaddress 
    from person.emailaddress pe
    where pe.BusinessEntityID = p.BusinessEntityID
    ) as Email
FROM Person.Person p  -- 19972

/*
Provide a list of phone numbers where the phone number type is "Home" 
*/
select phonenumber
from sales.vIndividualCustomer
where phonenumbertype = 'Home' -- 9154

/*
Provide a list of contact types available (No joins invloved in this query)
*/

select *
from person.ContactType

/*
Using the query  from question 4, filter the results to only return contact types that match the following : 
Sales Agent,Sales Associate,Sales Representative,Sales Manager  (No joins invloved in this query)
*/

select name
from person.ContactType
where name in ('Sales Agent', 'Sales Associate', 'Sales Representative', 'Sales Manager')  -- 4

/*
Using the query from the previous line, use  a conditional logic to return the following values :
       -- If contact type is either Sales Agent or Sales Associate, display contact type as "Junior Level - Sales" 
	   -- If contact type is Sales Representative, display contact type as "Senior Level - Sales" 
	    -- If contact type is Sales Manager, display contact type as "Leadership - Sales" 
-- HINT : use the case expression to return the required value. (No joins invloved in this query)
*/

select name,
case
    when name in ('sales agent', 'sales associate') then 'Junior Level - Sales'
    when name = 'sales representative' then 'Senior Level - Sales'
    when name ='sales manager' then 'Leadership - Sales'
End as Level
from person.contacttype
where name in ('Sales Agent', 'Sales Associate', 'Sales Representative', 'Sales Manager')  -- 4
 

/*Using the query from question 6, provide  a list of business entityids and personids associated with the contact types returned in question 7
-- HINT : Multi table Joins  (joining more than 2 tables together) 
*/
select name, businessentityid, personid
from person.contacttype pc 
join person.businessentitycontact pb on pc.contacttypeid = pb.contacttypeid
where name in ('Sales Agent', 'Sales Associate', 'Sales Representative', 'Sales Manager'



/*
Using the query from question 7, provide the first name and  last name associated with the businessentityids returned 
-- HINT: Multi table Joins
*/

select name, pp.businessentityid, personid, pp.firstname, pp.lastname, ppp.phonenumber
from person.contacttype pc 
join person.businessentitycontact pb on pc.contacttypeid = pb.contacttypeid
join person.person pp on pb.personid = pp.BusinessEntityID
join person.PersonPhone ppp on pp.BusinessEntityID = ppp.businessentityid
where name in ('Sales Agent', 'Sales Associate', 'Sales Representative', 'Sales Manager')  -- 138

/*
Using the query from question 8,add the email address and the phone numbers to the result
*/

select name as 'Position', pp.businessentityid, personid, pp.firstname, pp.lastname, pe.EmailAddress
from person.contacttype pc 
join person.businessentitycontact pb on pc.contacttypeid = pb.contacttypeid
join person.person pp on pb.personid = pp.BusinessEntityID
join person.EmailAddress pe on pp.BusinessEntityID = pe.BusinessEntityID
where name in ('Sales Agent', 'Sales Associate', 'Sales Representative', 'Sales Manager')  -- 138

/*
Provide a list of loginid and resumes from the human resources schema. Please return all loginids even if they do not  have a resume
*/


select he.loginid, hj.resume
from HumanResources.Employee he
full join HumanResources.JobCandidate hj on
he.BusinessEntityID = hj.BusinessEntityID  -- 301


/*
Using the query from question 10, provide a list of logins and resumes that has a resume on file.
	-- ANS: This one is different from question 30 because now, the question is asking us to find only LoginIDs that have a resume on file
	-- An INNER JOIN would be more appropriate for this. A LEFT JOIN would be incorrect unless you add additional conditions
*/

select he.loginid, hj.resume
from HumanResources.Employee he
join HumanResources.JobCandidate hj on
he.BusinessEntityID = hj.BusinessEntityID  -- 2



/*
Using the query from question 11, add the hire date to the result and replace the dashed "-" in the hiredate with a slash "\"
 --  HINT : USE the REPLACE function (Read up on Replace either online or in the TSQL slides
*/

select he.loginid, hj.resume, replace(he.HireDate, '-', '/') as 'Hire Date' 
from HumanResources.Employee he
join HumanResources.JobCandidate hj on
he.BusinessEntityID = hj.BusinessEntityID  -- 2



/*
Using the query from question 12, add the first and last name to the query
-- HINT : Join to person.person.
*/

select
pp.firstname as 'First Name',
pp.lastname as 'Last Name',
he.loginid,
hj.resume,
replace(he.HireDate, '-', '/') as 'Hire Date' 
from HumanResources.Employee he
join HumanResources.JobCandidate hj on
he.BusinessEntityID = hj.BusinessEntityID
join person.person pp on hj.BusinessEntityID =
pp.BusinessEntityID  -- 2



/*
Using the query from question 13, retrieve the first letter from the first name and the last letter from the last name and concatenate it . 
    -- Example FirstName = 'John' ; LastName = 'Smith' ; Result = 'JH'
	--HINT: Use the left function  to extract the first character and the concat function to contenate the extracted values
*/
select
concat(
left(pp.firstname, 1),
right(pp.lastname, 1)
) as 'Initials',
he.loginid,
hj.resume,
replace(he.HireDate, '-', '/') as 'Hire Date' 
from HumanResources.Employee he
join HumanResources.JobCandidate hj on
he.BusinessEntityID = hj.BusinessEntityID
join person.person pp on hj.BusinessEntityID =
pp.BusinessEntityID  -- 2



/*
Retrieve the FirstName, MiddleName, LastName of all the employees. Also create a derived column called LegalName. LegalName is a combination of the FirstName,
	--MiddleName and LastName. Don't forget to handle the NULL values that might occur in the MiddleName.
	--Also create a derived column for the age of all the employees
	--HINT: Person.Person, HumanResources.Employee, DATEDIFF(), COALESCE() OR ISNULL()
*/

select concat(firstname, '  ', middlename, '  ', lastname) as 'Legal Name',
datediff(year, birthdate, cast(getdate() as date)) as 'Age'
from person.person pp
join HumanResources.Employee he on pp.BusinessEntityID = he.BusinessEntityID  -- 26



/*
Retrieve the FullName, age, PhoneNumber, Address and EmailAddress of all the employees.
	--HINT: Multiple tables and joins involved. You might need to do a little research on the tables that contains these fields and what kind of joins to use.
*/

select concat(firstname, '  ', middlename, '  ', lastname) as 'Legal Name', 
datediff(year, birthdate, cast(getdate() as date)) as 'Age', pa.AddressLine1, pe.emailaddress
from person.person pp
join HumanResources.Employee he on pp.BusinessEntityID = he.BusinessEntityID
join person.personphone ph on he.BusinessEntityID = ph.BusinessEntityID
join person.BusinessEntityAddress pb on ph.BusinessEntityID = pb.BusinessEntityID
join person.address pa on pb.AddressID = pa.AddressID
join person.EmailAddress pe on pb.BusinessEntityID = pe.BusinessEntityID  -- 290




/*
Your company human resource team will like to build a report that shows all employees 
to check if they are salaried or not. They have asked you to Write a query to retrieve
the relevant into from the employee and person table. displaying fields like
first name, last name, job title and hire date. They want you to 
create a dreived column called StatusCheck that will display Exempt if the
If employee is salaried flag (1) and then display 'Not-Exempt' if the employee is not salaried (0)

*/

select 
p.firstname,
p.lastname,
he.jobtitle,
he.hiredate,
case
  when he.salariedflag = 1 then 'Exempt'
  when he.salariedflag = 0 then 'Not Exempt'
end as 'Status Check'
from person.person p
join HumanResources.Employee he on 
p.BusinessEntityID = he.BusinessEntityID



/*
Your human resource are very pleased with the 'StatusCheck' report that you created you create in 
 question 5,but now they want some additional information added to the report:
     human resource will like you to add the total sum of paid time off hours of 
	 each employee this will be the SickLeave Hours and vacation hours.
    If the employee's paid time off hours is greater than 60 hours , display 'Need Carry-Over'
	If employee's paid time off hours is greater less than 40 hours , display 'safe hours'
*/

select 
p.firstname,
p.lastname,
he.VacationHours + he.sickleavehours as 'Paid Time Off',
case 
    when he.vacationhours + he.sickleavehours > 60 then 'Need Carry-Over'
    when he.vacationhours + he.sickleavehours < 40 then 'Safe Hour'
end as 'PTO status'
from person.person p
join HumanResources.employee he on p.BusinessEntityID = he.BusinessEntityID -- 290






/*
Your company is about a make a business decision they needs to know what sales territory 
has hit their target based on the last year sales and the salesYTD (year to date). They
want you to Write a query to retrieve relievant information(Please pick columns that you will like to see in a normal reporting)
 from the SalesTerritory table  and then add a derived column called 'Target' that will display the following:
    If the territory's SalesLastYear exceeds salesYTD , display 'Not met'
	 else display 'Met'.
*/



select 
ss.name,
'$' + cast(ss.saleslastyear as varchar(20)) as [Sales Last Year],
'$' + cast(ss.salesytd as varchar(20)) as [Sales YTD],
case 
    when saleslastyear > salesytd then 'Not Met'
    else 'Met'
end as 'Target'
from sales.salesterritory ss  -- 10





/*
Your company is in the process of rewarding it customers and they have asked you to generate
a query that will display the customer account number, the customer id, from the customer table
and the order date, due date and ship date from the salesorderheader table.
	1. The want you you to only return the date from the order date, due date and ship date 
	2. They want you to write a derived column called DueDateExtended that will add 3 months to the due date
	3. They want you to write a derived column called ShipDateExtended that will add 7 days to the ship date
*/


select
sc.accountnumber, 
sc.customerid,
cast(soh.orderdate as date ) as 'Order Date',
cast(soh.duedate as date) as 'Due Date',
cast(dateadd(month, 3, soh.duedate)as date) as 'Due Date Extended',
cast(soh.shipdate as date) as 'Ship Date',
cast(dateadd(day, 7, soh.duedate)as date) as 'Ship Date Extended'
from sales.customer sc
join sales.SalesOrderHeader soh on sc.CustomerID = soh.CustomerID  -- 31465



/*
The front end developer are finding it hard to using your report that you created in question 9.
They have asked that you create add a derived column called FrontEndColumn that will convert
all the first letter of the account number to lower case.*/


select
lower(left(sc.accountnumber,1))
    + substring(sc.accountnumber,2, len(sc.accountnumber)), 
sc.customerid,
cast(soh.orderdate as date ) as 'Order Date',
cast(soh.duedate as date) as 'Due Date',
cast(dateadd(month, 3, soh.duedate)as date) as 'Due Date Extended',
cast(soh.shipdate as date) as 'Ship Date',
cast(dateadd(day, 7, soh.duedate)as date) as 'Ship Date Extended'
from sales.customer sc
join sales.SalesOrderHeader soh on sc.CustomerID = soh.CustomerID  -- 31465

