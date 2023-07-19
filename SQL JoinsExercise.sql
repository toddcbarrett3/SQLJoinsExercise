/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT products.Name AS "Product Name", categories.Name AS "Category Name"
FROM products
JOIN categories ON products.CategoryID = categories.CategoryID;

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT products.Name AS "Product Name", products.Price, reviews.Rating
FROM products
JOIN reviews ON products.ProductID = reviews.ProductID
WHERE reviews.Rating = 5;

/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT employees.FirstName, employees.LastName, SUM(sales.Quantity) AS "Total Quantity Sold"
FROM employees
JOIN sales ON employees.EmployeeID = sales.EmployeeID
GROUP BY employees.FirstName, employees.LastName
ORDER BY SUM(sales.Quantity) DESC
LIMIT 1;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT departments.Name AS "Dept. Name", categories.Name AS "Category Name"
FROM departments
JOIN categories ON departments.DepartmentID = categories.DepartmentID
WHERE categories.Name = "Appliances"
OR categories.Name = "Games";

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT products.Name AS "Product", SUM(sales.Quantity) AS "Total # Sold", SUM(sales.Quantity*sales.PricePerUnit) AS "Total Price Sold"
FROM products
JOIN sales ON products.ProductID = sales.ProductID
WHERE products.Name LIKE "%hotel%"
GROUP BY products.Name;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT products.Name AS "Product", reviews.Reviewer, MIN(reviews.Rating), reviews.Comment
FROM products
JOIN reviews ON products.ProductID = reviews.ProductID
WHERE products.Name LIKE "%Visio%"
GROUP BY products.Name, reviews.Reviewer, reviews.Comment
LIMIT 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT employees.EmployeeID, employees.FirstName, employees.LastName, products.Name AS "Product Name", SUM(sales.Quantity) AS "Qty. of Products Sold"
FROM employees
JOIN sales ON employees.EmployeeID = sales.EmployeeID
JOIN products ON sales.ProductID = products.ProductID
GROUP BY employees.EmployeeID, employees.FirstName, employees.LastName, products.Name;