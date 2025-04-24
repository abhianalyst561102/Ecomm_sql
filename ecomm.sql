Create database sakila;

use sakila;

Show tables;

--- Changing the table name to make the table name shorter
RENAME TABLE ECOMMERCE_PRODUCT_DATASET TO ECOM;

----- What are the details of TOP 5 products in the dataset?
SELECT * FROM ECOMMERCE_PRODUCT_DATASET
LIMIT 5;

----- SHOW all products which belong to 'Electronics' category?
SELECT * FROM ECOM
WHERE CATEGORY IN (ELECTRONICS);

---- Show all products whose price is greater than 100.
SELECT * FROM ECOM
WHERE PRICE>100;

---- Show all products which have a rating of 4 or higher and at least 50 reviews?
SELECT * FROM ECOM
WHERE RATING >= 4 AND NYMREVIEWS >= 50; 

---- Which products were added after a date '2023-01-01'?
SELECT PRODUCTNAME,DATEADDED FROM ECOM 
WHERE DATEADDED>'2023-01-01';

--- What is the total number of products in each category?
SELECT CATEGORY, COUNT(*) AS PRODUCTCOUNT FROM ECOM
GROUPBY CATEGORY;

--- What is the total sales revenue across all product?
SELECT SUM(SALES * STOCKQUANTITY) AS TOTAL_REVENUE FROM ECOM ;

--- Which category has the highest average rating?
SELECT CATEGORY, AVG(RATING) AS AVGRATING FROM ECOM
GROUP BY CATEGORY
ORDER BY AVGRATING DESC
LIMIT 1;

--- How many products have zero stock quantitY?
SELECT COUNT(STOCKQUANTITY) AS OUT_OF_STOCK FROM ECOM
WHERE STOCKQUANTITY=0;

--- Which are the top 5 most expensive products?
SELECT PRODUCTNAME , PRICE FROM ECOM
ORDER BY PRICE DESC
LIMIT 5;

--- Show top 5 products which have the highest number of reviews?
SELECT PRODUCTNAME, NUMREVIEWS FROM ECOM
ORDER BY NUMREVIEWS DESC
LIMIT 5;

--- Which 5 products have the highest sales, sorted by sales volume?
SELECT PRODUCTNAME, SALES FROM ECOM
ORDER BY SALES DESC 
LIMIT 1;

--- What are the top 3 products with the highest discount?
SELECT PRODUCTNAME, DISCOUNT FROM ECOM
ORDER BY DISCOUNT DESC
LIMIT 3;

--- Which products have a discount greater than 20% and are still in stock
SELECT PRODUCTNAME , DISCOUNT FROM ECOM
WHERE DISCOUNT > 0.2 AND STOCKQUANTITY != 0;

--- Which products have high sales (e.g., >100 units) but low ratings (<3)?
SELECT PRODUCTNAME, SALES, RATING FROM ECOM
WHERE SALES > 100 AND RATING < 3 ;

--- Which products have a price between $50 and $200 and were added in the last 6 months?
SELECT PRODUCTNAME, PRICE, DATEADDED FROM ECOM
WHERE PRICE BETWEEN 50 AND 200;



