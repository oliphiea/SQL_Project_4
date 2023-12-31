# Write a SQL query to count the number of employees in each department.
# Return department code and number of employees.
SELECT 
    COUNT(*), emp_dept
FROM
    emp_details
GROUP BY emp_dept; 


# Write a SQL query to count all the orders generated on 
# '2012-08-17'.Return number of orders.
SELECT 
    COUNT(*)
FROM
    orders
WHERE
    ord_date = '8/17/2012';


# Write a SQL query to determine the maximum order (purchase) amount 
# generated by each salesperson. Filter the rows for the salesperson ID 
# in the range 5003 and 5008 (Begin and end values are included). 
# Return salesperson id and maximum purchase amount.
SELECT 
    MAX(purch_amt), salesman_id
FROM
    salesman
        JOIN
    orders USING (salesman_id)
GROUP BY salesman_id
HAVING salesman_id BETWEEN 5003 AND 5008;


# Write a SQL query to find the salespeople and customers who live in the same city. 
# Return customer name, salesperson name and salesperson city.
SELECT 
    c.cust_name, s.name AS sales_name, s.city AS sales_city
FROM
    customers AS c
        JOIN
    salesman AS s USING (salesman_id)
WHERE
    c.city = s.city; 


# Write a SQL query to locate the orders made by customers. 
# Return order number, customer name.
SELECT 
    ord_no, cust_name
FROM
    orders
        JOIN
    customers USING (customer_id);


# Write a SQL query to find those customers who are served by a salesperson and the 
# salesperson earns commission in the range of 12% to 14% (Begin and end values are included.).
# Return cust_name AS"Customer",city AS "City".
SELECT 
    cust_name AS Customer, c.city AS City
FROM
    customers AS c
        JOIN
    salesman AS s USING (salesman_id)
WHERE
    c.salesman_id = s.salesman_id
        AND commission BETWEEN 0.12 AND 0.14;


# Write a SQL query to find salespeople who received commissions of more than 12 percent 
# from the company.Return Customer Name, customer city, Salesman, commission.
SELECT 
    cust_name, c.city, name AS sales_name, commission
FROM
    customers AS c
        JOIN
    salesman AS s USING (salesman_id)
WHERE
    c.salesman_id = s.salesman_id
        AND commission > 0.12;
        

# Write a SQL query to calculate the average purchase amount of all orders. 
# Return average purchase amount.
SELECT 
    AVG(purch_amt)
FROM
    orders;
