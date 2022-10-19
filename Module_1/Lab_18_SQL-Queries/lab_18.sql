CREATE DATABASE IF NOT EXISTS lab_18;
USE lab_18;

-- 1. What are the different genres?
SELECT prime_genre FROM applestore
GROUP BY prime_genre
;

-- 2. Which is the genre with the most apps rated?
SELECT prime_genre FROM applestore
GROUP BY prime_genre
ORDER BY SUM(rating_count_tot) DESC
LIMIT 1
;

-- 3. Which is the genre with most apps?
SELECT prime_genre FROM applestore
GROUP BY prime_genre
ORDER BY COUNT(id) DESC
LIMIT 1
;

--  4. Which is the one with least?
SELECT prime_genre FROM applestore
GROUP BY prime_genre
ORDER BY COUNT(id) ASC
LIMIT 1
;

-- 5. Find the top 10 apps most rated.
SELECT track_name FROM applestore
ORDER BY rating_count_tot DESC
LIMIT 10
;

-- 6. Find the top 10 apps best rated by users.
SELECT track_name FROM applestore
ORDER BY user_rating DESC
LIMIT 10
;

-- 7. Take a look at the data you retrieved in question 5. Give some insights.
/* 
Facebook seems to be the most rated app, I am assuming that means that it either
has existed for the longest time, or that it is the app that most people use it. 
As with the rest of the apps, they seem to be quite popular, such as the bible,
pacman, google earth and others
*/
-- 8. Take a look at the data you retrieved in question 6. Give some insights.
/*
I would say that these are the apps that even though the might be niche, or not, 
they are particularly enjoyable by the user. Such as Sudoku, iQuran and others
*/

-- 9. Now compare the data from questions 5 and 6. What do you see?
/*
I notice that (at least in the sample dataset that we are using because of Mac), 
there seems to be a major difference between the most popular and the most enjoyable 
ones. The only one that seems to overlap is the Bible
*/

-- 10. How could you take the top 3 regarding both user ratings and number of votes?
/*
I could use maybe their product of user ratings and # of votes to get the top 3 of both
*/

-- 11. Do people care about the price of an app? Do some queries, comment why are you doing 
-- them and the results you retrieve. What is your conclusion?
-- first let's see the user_rating, price and rating_count_tot
SELECT track_name, price, user_rating, rating_count_tot FROM applestore
ORDER BY price DESC
;
-- now we could look at the prices grouped for >4 and under to see the average rating and rating_count_tot
SELECT AVG(user_rating),
CASE WHEN price > 3 THEN 1 ELSE 0 END AS price3
FROM applestore
GROUP BY price3
;
-- We notice that the average difference in not significant in the user ratings
SELECT AVG(rating_count_tot),
CASE WHEN price > 3 THEN 1 ELSE 0 END AS price3
FROM applestore
GROUP BY price3
;
-- We notice however that the ones with a low price or a price lower than 3 are more likely to be 
-- downloaded and rated.