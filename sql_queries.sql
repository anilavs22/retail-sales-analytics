CREATE DATABASE retail_sales;
USE retail_sales;
DESCRIBE store;
SELECT `Order Date`
FROM store
LIMIT 5;
SET SQL_SAFE_UPDATES = 0;
ALTER TABLE store
MODIFY COLUMN `Order_Date` DATE;
SELECT `Order_Date`
FROM store
LIMIT 5;
SELECT * FROM store
LIMIT 10;
SELECT
    COUNT(*) AS total_rows
FROM store;
SELECT
    SUM(Sales) AS total_revenue
FROM store;
SELECT
    SUM(Profit) AS total_profit
FROM store;
SELECT
    `Product_Name`,

    SUM(Sales) AS revenue

FROM store

GROUP BY `Product_Name`

ORDER BY revenue DESC

LIMIT 10;

SELECT
    Region,

    SUM(Sales) AS total_sales

FROM store

GROUP BY Region;
SELECT
    `Customer_Name`,

    SUM(Sales) AS total_sales

FROM store

GROUP BY `Customer_Name`

ORDER BY total_sales DESC

LIMIT 10;

SELECT
    MONTH(`Order_Date`) AS month,

    SUM(Sales) AS monthly_sales

FROM store

GROUP BY month

ORDER BY month;

SELECT
    Segment,

    SUM(Sales) AS revenue,

    SUM(Profit) AS profit

FROM store

GROUP BY Segment;


SELECT
    `Sub_Category`,

    SUM(Sales) AS revenue

FROM store

GROUP BY `Sub_Category`

ORDER BY revenue DESC;

SELECT
    Category,

    SUM(Profit) AS total_profit

FROM store

GROUP BY Category;


SELECT
    City,

    SUM(Sales) AS revenue

FROM store

GROUP BY City

ORDER BY revenue DESC

LIMIT 10;
SELECT
    Discount,

    AVG(Profit) AS avg_profit

FROM store

GROUP BY Discount

ORDER BY Discount;

SELECT
    `Customer_Name`,

    SUM(Sales) AS total_sales,

    RANK() OVER(
        ORDER BY SUM(Sales) DESC
    ) AS customer_rank

FROM store

GROUP BY `Customer_Name`;
SELECT
    `Order_Date`,

    Sales,

    SUM(Sales) OVER(
        ORDER BY `Order_Date`
    ) AS running_total

FROM store;
SELECT *

FROM (

    SELECT

        Category,

        `Product_Name`,

        SUM(Sales) AS revenue,

        RANK() OVER(
            PARTITION BY Category
            ORDER BY SUM(Sales) DESC
        ) AS rank_num

    FROM store

    GROUP BY Category, `Product_Name`

) ranked

WHERE rank_num <= 3;