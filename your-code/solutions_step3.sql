SELECT au_id, SUM(sales_per_author + advance) FROM (
SELECT sales.title_id, titleauthor.au_id, SUM(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS sales_per_author, titles.advance
FROM sales
LEFT JOIN titles
	ON sales.title_id = titles.title_id
LEFT JOIN titleauthor
	ON titles.title_id = titleauthor.title_id
GROUP BY titleauthor.au_id, sales.title_id
) AS total_earnings
GROUP BY au_id
