USE salesdb;

-- Question 1
-- Retrieve firstName, lastName, email, and officeCode of all employees using INNER JOIN.
SELECT
    e.firstName,
    e.lastName,
    e.email,
    e.officeCode
FROM
    employees e
INNER JOIN
    offices o ON e.officeCode = o.officeCode;
    
    -- Question 2
-- Retrieve productName, productVendor, and productLine from products using LEFT JOIN.
SELECT
    p.productName,
    p.productVendor,
    p.productLine
FROM
    products p
LEFT JOIN
    productlines pl ON p.productLine = pl.productLine;
    
    -- Question 3
-- Retrieve orderDate, shippedDate, status, and customerNumber for the first 10 orders using RIGHT JOIN.
-- Since RIGHT JOIN can be less common and potentially less performant than LEFT JOIN when rewritten,
-- Consider the implications and database system behavior when choosing between RIGHT and LEFT JOIN.
-- Additionally, the original intent of the question is unclear, because it asks to retrieve data for the first 10 orders.
-- However, RIGHT JOIN retrieves all rows from the right table (customers), and matching rows from the left table (orders).
-- This is usually not how we retrieve specific records. To address this limitation, and to satisfy the question requirements as much as possible, the query can be modified using a subquery to first identify the first 10 order numbers, and then use those order numbers in a RIGHT JOIN or a more common LEFT JOIN, but this adds complexity.
-- This implementation will just select the first 10 order dates after RIGHT joining the tables.

SELECT
    o.orderDate,
    o.shippedDate,
    o.status,
    o.customerNumber
FROM
    customers c
RIGHT JOIN
    orders o ON c.customerNumber = o.customerNumber
ORDER BY
    o.orderDate
LIMIT 10;