CREATE TABLE departments (
         department_id INT, 
         department_name VARCHAR(50)
     );
     CREATE TABLE employees (
         employee_id INT, 
         employee_name VARCHAR(100), 
         salary DECIMAL(10, 2), 
         department_id INT
     );
     INSERT INTO departments VALUES 
         (1, 'HR'), 
         (2, 'Finance'), 
         (3, 'IT'), 
         (4, 'Marketing');
     INSERT INTO employees VALUES 
         (1, 'Ravi Gupta', 50000.00, 1), 
         (2, 'Meera Singh', 60000.00, 2), 
         (3, 'Amit Shah', 70000.00, 3), 
         (4, 'Nisha Patil', 40000.00, 1), 
         (5, 'Vikram Yadav', 90000.00, 2), 
         (6, 'Arjun Reddy', 80000.00, 3), 
         (7, 'Deepika Kumar', 30000.00, 4), 
         (8, 'Kavya Nair', 35000.00, 4), 
         (9, 'Ritesh Choudhary', 45000.00, 3), 
         (10, 'Riya Kapoor', 50000.00, 2);

SELECT * FROM DEPARTMENTS
SELECT * FROM EMPLOYEES

/*
Find the average salary of employees in each department.
*/

WITH CTE AS
(
    SELECT DEPARTMENT_ID,
           AVG(SALARY) AS AVERAGE_SALARY
    FROM EMPLOYEES
    GROUP BY DEPARTMENT_ID
)
SELECT D.DEPARTMENT_NAME,
       CTE.AVERAGE_SALARY
FROM CTE
JOIN DEPARTMENTS D ON CTE.DEPARTMENT_ID = D.DEPARTMENT_ID;


