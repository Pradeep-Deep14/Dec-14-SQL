CREATE TABLE sales (
         sale_id INT, 
         product_id INT, 
         sale_date DATE, 
         sales_amount DECIMAL(10, 2), 
         customer_id INT
     );
     INSERT INTO sales VALUES 
         (1, 1, '2024-01-10', 50000.00, 1001), 
         (2, 2, '2024-01-20', 70000.00, 1002), 
         (3, 1, '2024-02-10', 80000.00, 1003), 
         (4, 2, '2024-02-15', 60000.00, 1004);


SELECT * FROM SALES

/*
Calculate the product with the highest sales amount for each month.
*/

--APPROACH 1
	
WITH CTE AS 
	( SELECT 
		PRODUCT_ID,
		EXTRACT(MONTH FROM SALE_DATE) AS MONTH, 
		SALES_AMOUNT, 
		DENSE_RANK() OVER (PARTITION BY EXTRACT(MONTH FROM SALE_DATE) ORDER BY SALES_AMOUNT DESC) AS DRNK
FROM sales ) 
SELECT PRODUCT_ID, MONTH, SALES_AMOUNT
FROM CTE WHERE DRNK = 1 
ORDER BY MONTH

--APPROACH 2

WITH CTE AS
(
SELECT product_id, 
       EXTRACT(YEAR FROM sale_date) AS sale_year, 
       EXTRACT(MONTH FROM sale_date) AS sale_month, 
       sales_amount, 
       RANK() OVER (PARTITION BY EXTRACT(YEAR FROM sale_date), EXTRACT(MONTH FROM sale_date) ORDER BY sales_amount DESC) AS product_rank 
FROM sales 
)
SELECT * FROM CTE WHERE product_rank = 1;