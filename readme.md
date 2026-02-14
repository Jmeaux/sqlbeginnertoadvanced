# SQL Beginner to Advanced - AdventureWorks2016

This repository contains SQL practice scripts ranging from beginner to advanced queries using the **AdventureWorks2016** database. The scripts cover:

- Basic SELECT queries
- Filtering with WHERE
- Aggregations with GROUP BY and HAVING
- Joins and multi-table queries
- Set operations: EXCEPT, INTERSECT
- Conditional logic with CASE statements
- Date functions and derived columns
- Reporting examples for business insights

---

## SQL Practice Summary

- Used `EXCEPT` to find customers who never ordered and customers who ordered in one year but not another.
- Used `GROUP BY` and `HAVING` to identify customers with exactly one order.
- Used `INTERSECT` to find customers who ordered in multiple years.
- Focus: choosing between set logic (presence/absence) and aggregation (counts).

---

## SQL Scripts Overview

| # | File Name | Description | Rows / Notes |
|---|-----------|-------------|--------------|
| 01 | `01_basic_select.sql` | Returns first name, middle name, last name | 19972 |
| 02 | `02_rename_columns.sql` | Renames firstname to FName and lastname to LName | 19972 |
| 03 | `03_countryregion.sql` | Returns all records from Person.CountryRegion | 238 |
| 04 | `04_countryregion_rename.sql` | Renames CountryRegionCode as Region Code | 238 |
| 05 | `05_store_name_check.sql` | Corrects invalid alias in Store table | - |
| 06 | `06_salesorderdetail_fix.sql` | Fixes failed query for unitprice and linetotal | 121317 |
| 07 | `07_employee_married_female.sql` | Returns employees who are married and female | 49 |
| 08 | `08_person_unknown_lastname.sql` | Returns Person.Person records where lastname is null | 0 |
| 09 | `09_salesorderheader_gt1500.sql` | Returns SalesOrderHeader where TotalDue > 1500 | 12542 |
| 10 | `10_product_check.sql` | Checks if specific products exist | 4 |
| 11 | `11_productinventory.sql` | Returns ProductID, shelf, quantity with filters | 16 |
| 12 | `12_specialoffer_reseller.sql` | Returns SpecialOffer info for category 'Reseller' | 0 |
| 13 | `13_vendor_ends_les.sql` | Returns vendor info whose name ends in 'les' | 17 |
| 14 | `14_vendor_webservice_notnull.sql` | Excludes vendors with null WebService URL | 0 |
| 15 | `15_scrapreason_failed.sql` | Returns scrap reasons containing 'failed' | 3 |
| 16 | `16_billofmaterials_preassembly.sql` | Returns PreAssemblyQty <= 8 and BOMLevel | 2621 |
| 17 | `17_salesterritory_order.sql` | Returns SalesTerritory sorted by SalesLastYear | 10 |
| 18 | `18_salesterritory_order_ytd.sql` | Sort by SalesLastYear then SalesYTD desc | 10 |
| 19 | `19_product_reorder_sort.sql` | Returns ProductID, Name, ReorderPoint, StandardCost with sorting | 504 |
| 20 | `20_salesterritory_top5.sql` | Returns top 5 SalesTerritory sorted by SalesLastYear/SalesYTD | 5 |
| 21 | `21_salesorderdetail_top22.sql` | Returns top 22 SalesOrderDetail sorted by SpecialOfferID, UnitPrice | 22 |
| 22 | `22_salesorderdetail_linetotal_gt2000.sql` | Returns SalesOrderDetail with LineTotal > 2000 | 21155 |
| 23 | `23_store_salesperson.sql` | Returns stores serviced by specific SalesPersonIDs | 154 |
| 24 | `24_product_color_unknown.sql` | Returns products where Color is null | 248 |
| 25 | `25_product_name_mountain.sql` | Returns products whose Name starts with 'Mountain' | 38 |
| 26 | `26_customer_order_frequency.sql` | Uses CTEs to analyze order frequency by day and month | varies |
| 27 | `27_customer_order_sets.sql` | Uses EXCEPT and INTERSECT for customer orders | varies |
| 28 | `28_employee_resume_hiredate.sql` | Joins Employee, JobCandidate, adds HireDate formatting | 2 |
| 29 | `29_employee_legalname_age.sql` | Creates LegalName and Age derived columns | 26 |
| 30 | `30_employee_fullinfo.sql` | Returns FullName, Age, PhoneNumber, Address, EmailAddress | 290 |
| 31 | `31_employee_status_pto.sql` | Adds StatusCheck and PTO derived columns | 290 |
| 32 | `32_sales_territory_target.sql` | Adds Target derived column based on SalesLastYear vs SalesYTD | 10 |
| 33 | `33_customer_order_dates.sql` | Derives order, due, ship dates, adds extended columns | 31465 |
| 34 | `34_customer_order_frontend.sql` | Adds FrontEndColumn converting first letter of AccountNumber | 31465 |

---

## How to Use

1. **Clone the repository**  
   ```bash
   git clone https://github.com/Jmeaux/sqlbeginnertoadvanced.git
