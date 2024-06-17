/* 
    Nick Winters
    Automobile Sales Analysis
*/

--------------------------------------------------------------------------------
/*				                 Analysis                	 		          */
--------------------------------------------------------------------------------

-- 1. Peak the data
Select * from sales;

-- 2. Distinct status type
SELECT DISTINCT status FROM sales;

-- 3. Motorcycle orders (order number, price, and sales amount)
SELECT order_num, price, sales FROM sales
WHERE product_line = 'Motorcycles';

-- 4. List of Customers and their address information
SELECT DISTINCT customer, address_l1, address_l2, city, state, postal_code FROM sales;

-- 5. List of orders where sales exceeded $1,500
SELECT order_num, customer, sales, qtr FROM sales
WHERE sales > '$1,500.00';

-- 6. 4th quarter sales report
SELECT product_line, quantity, sales, deal_size FROM sales
WHERE qtr = 4;

-- 7. All sales from the Japan, EMEA, and APAC territories, organized by deal size
SELECT territory, customer, order_date, product_code, deal_size from sales
WHERE territory IN ('Japan', 'EMEA', 'APAC')
ORDER BY deal_size;

-- 8. Sales in November through December
SELECT month_id, sales, customer from sales
WHERE month_id BETWEEN 11 AND 12;

-- 9. All sales whose amount was between $2,000 and $3,000.
SELECT order_num from sales
WHERE sales BETWEEN '$2,000.00' AND '$3,000.00';

/*  10. (Buisness Scenario)
	The sales department suspects that certain customers tend to regularly place small
	orders instead of medium or large orders. They have asked for a list of sales in the third
	and fourth quarter that have a small deal size. Include order number, quarter, customer,
	and deal size.
*/
SELECT order_num, qtr, customer, deal_size from sales
WHERE qtr IN (3,4) AND deal_size = 'Small';

/*  11. (Buisness Scenario)
	After further inspecting your previous query, the sales manager has asked you to provide
	a list of all sales orders that occurred in quarters 1 or 2 that were made by the customers
	Mini Classics, Herkku Gifts, or Tekni Collectables Inc.
*/
SELECT order_num, qtr, customer, deal_size from sales
WHERE qtr In (1,2) AND customer IN ('Mini Classics', 'Herku Gifts', 'Tekni Collectables Inc.');

-- 12. List of customers that starts with T.
SELECT customer FROM sales
WHERE customer LIKE 'T%';

-- 13. List of customers and their phone numbers if their phone number has a 55 in it.
SELECT customer, phone FROM sales
WHERE phone LIKE '%55%';

-- 14. List of customers and their states if the state starts with a C.
SELECT customer, sales.state FROM sales
WHERE sales.state LIKE 'C_';

-- 15. List of product codes that have a 46 in them.
SELECT product_code FROM sales
WHERE product_code LIKE '%46%';

-- 16. List of customers whose name has the WORD `of` in it.
SELECT customer FROM sales
WHERE customer LIKE '% of %';