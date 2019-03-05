SELECT sales.title_id, titleauthor.au_id, SUM(titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100) AS sales_per_author
FROM sales
LEFT JOIN titles
	ON sales.title_id = titles.title_id
LEFT JOIN titleauthor
	ON titles.title_id = titleauthor.title_id
GROUP BY titleauthor.au_id, sales.title_id
	


