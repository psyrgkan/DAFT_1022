-- Step 1: Calculate the royalty of each sale for each author and the advance for each author and publication
SELECT a.au_id, t.title_id, (t.advance * ta.royaltyper / 100) AS advance,
	(t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100) AS sales_royalty 
FROM titleauthor ta
INNER JOIN authors a
ON ta.au_id = a.au_id
INNER JOIN titles t
ON ta.title_id = t.title_id
INNER JOIN sales s
ON t.title_id = s.title_id
;

-- Step 2: Aggregate the total royalties for each title and author
SELECT a.au_id, t.title_id, SUM((t.advance * ta.royaltyper / 100)) AS sum_advance,
	SUM((t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100)) AS sum_sales_royalty 
FROM titleauthor ta
INNER JOIN authors a
ON ta.au_id = a.au_id
INNER JOIN titles t
ON ta.title_id = t.title_id
INNER JOIN sales s
ON t.title_id = s.title_id
GROUP BY a.au_id, t.title_id
ORDER BY a.au_id
;

-- Step 3: Calculate the total profits of each author
SELECT s1.au_id, SUM(s1.total) as profit
FROM 
(
SELECT a.au_id, t.title_id, (SUM((t.advance * ta.royaltyper / 100)) + 
SUM((t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100)))
AS total
FROM titleauthor ta
INNER JOIN authors a
ON ta.au_id = a.au_id
INNER JOIN titles t
ON ta.title_id = t.title_id
INNER JOIN sales s
ON t.title_id = s.title_id
GROUP BY a.au_id, t.title_id
ORDER BY a.au_id
) AS s1
GROUP BY s1.au_id
ORDER BY profit DESC
LIMIT 3
;

-- Challenge 2 - Alternative Solution
CREATE TEMPORARY TABLE tbl1
SELECT a.au_id, t.title_id, (SUM((t.advance * ta.royaltyper / 100)) + 
SUM((t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100)))
AS total
FROM titleauthor ta
INNER JOIN authors a
ON ta.au_id = a.au_id
INNER JOIN titles t
ON ta.title_id = t.title_id
INNER JOIN sales s
ON t.title_id = s.title_id
GROUP BY a.au_id, t.title_id
ORDER BY a.au_id
;

SELECT tbl1.au_id, SUM(tbl1.total) as profit
FROM tbl1
GROUP BY tbl1.au_id
ORDER BY profit DESC
LIMIT 3
;

-- Challenge 3
CREATE TABLE most_profiting_authors
SELECT tbl1.au_id, SUM(tbl1.total) as profitS
FROM tbl1
GROUP BY tbl1.au_id
ORDER BY profits DESC
LIMIT 3
;