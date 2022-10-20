-- Challenge 1 - Who Have Published What At Where?

SELECT author.au_id, CONCAT(author.au_fname, " ", author.au_lname) AS FullName, 
		title.title, pub.pub_name
FROM titleauthor ta
INNER JOIN authors author
ON ta.au_id = author.au_id
INNER JOIN titles title
ON ta.title_id = title.title_id
INNER JOIN publishers pub
ON title.pub_id = pub.pub_id
;

-- Challenge 2 - Who Have Published How Many At Where?

SELECT CONCAT(author.au_fname, " ", author.au_lname) AS FullName, 
		pub.pub_name, COUNT(*) as TitleCount
FROM titleauthor ta
INNER JOIN authors author
ON ta.au_id = author.au_id
INNER JOIN titles title
ON ta.title_id = title.title_id
INNER JOIN publishers pub
ON title.pub_id = pub.pub_id
GROUP BY FullName, pub.pub_name
;

-- Challenge 3 - Best Selling Authors

SELECT  author.au_id, CONCAT(author.au_fname, " ", author.au_lname) AS FullName,
		SUM(sale.qty) AS Total
FROM titleauthor ta
INNER JOIN authors author
ON ta.au_id = author.au_id
INNER JOIN titles title
ON ta.title_id = title.title_id
INNER JOIN sales sale
ON title.title_id = sale.title_id
GROUP BY author.au_id
ORDER BY Total DESC
LIMIT 3
;

-- Challenge 4 - Best Selling Authors Ranking

SELECT  author.au_id, CONCAT(author.au_fname, " ", author.au_lname) AS FullName,
		IFNULL(SUM(sale.qty), 0) AS Total
FROM authors author
LEFT JOIN titleauthor ta
ON ta.au_id = author.au_id
LEFT JOIN titles title
ON ta.title_id = title.title_id
LEFT JOIN sales sale
ON title.title_id = sale.title_id
GROUP BY author.au_id
ORDER BY Total DESC
;