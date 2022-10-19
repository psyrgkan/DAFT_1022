-- 1. From the order_items table, find the price of the highest priced order and lowest price order.
SELECT max(price) FROM order_items;
SELECT min(price) FROM order_items;

-- 2. From the order_items table, what is range of the shipping_limit_date of the orders?
SELECT max(shipping_limit_date) FROM order_items;
SELECT  min(shipping_limit_date) FROM order_items;

-- 3. From the customers table, find the states with the greatest number of customers.
SELECT customer_state, COUNT(*) FROM customers
GROUP BY customer_state 
ORDER BY COUNT(*) DESC
LIMIT 10
;

-- 4. From the customers table, within the state with the greatest number of customers, find the cities with the greatest number of customers.
SELECT customer_city, COUNT(*) FROM customers
WHERE customer_state = 'SP'
GROUP BY customer_city
ORDER BY COUNT(*) DESC
LIMIT 10
;

-- 5. From the closed_deals table, how many distinct business segments are there (not including null)?
SELECT COUNT(DISTINCT(business_segment)) FROM closed_deals
WHERE business_segment IS NOT NULL
;

-- 6. From the closed_deals table, sum the declared_monthly_revenue for duplicate row values in business_segment 
-- and find the 3 business segments with the highest declared monthly revenue (of those that declared revenue).
SELECT business_segment, SUM(declared_monthly_revenue) AS declared_monthly_revenue FROM closed_deals
GROUP BY business_segment
ORDER BY declared_monthly_revenue DESC
LIMIT 3
;

-- 7. From the order_reviews table, find the total number of distinct review score values.
SELECT COUNT(DISTINCT(review_score)) FROM order_reviews;

-- 8. In the order_reviews table, create a new column with a description that corresponds to each number category 
-- for each review score from 1 - 5, then find the review score and category occurring most frequently in the table.
SELECT review_score, COUNT(review_score), 
(CASE review_score
	WHEN 1 THEN 'VERY POOR'
    WHEN 2 THEN 'POOR'
    WHEN 3 THEN 'OK'
	WHEN 4 THEN 'GREAT'
    WHEN 5 THEN 'PERFECT'
    ELSE 'Level doesn`t exist!'
END) AS review_desc
FROM order_reviews
GROUP BY review_score
ORDER BY COUNT(review_score) DESC
;

-- 9. From the order_reviews table, find the review value occurring most frequently and how many times it occurs.
SELECT review_score, COUNT(review_score) FROM order_reviews
GROUP BY review_score
ORDER BY COUNT(review_score) DESC
;
