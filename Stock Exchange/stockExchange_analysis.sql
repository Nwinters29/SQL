/* 
    Nick Winters
    Stock Exchange Analysis
*/

--------------------------------------------------------------------------------
/*				                 Analysis                	 		          */
--------------------------------------------------------------------------------

-- 1. Peak the data
SELECT * FROM stocks;

/* High vs Low Analysis */

-- 2.. Average high stock value, organized by stock index
SELECT s_index, avg(s_high) AS avg_value
FROM stocks
GROUP BY s_index
ORDER BY s_index;

-- 3. Difference and percent change in highest and lowest value, organized by stock index
SELECT s_index, s_date, s_high-s_low  as diff, 
CAST(((s_high-s_low)/s_close) * 100 AS numeric (10,2)) AS percent_delta 
FROM stocks
ORDER BY s_index;

-- 4. Difference between the high and low stock values, organized by diffenece
SELECT s_index, s_high-s_low as difference FROM stocks
WHERE s_high NOTNULL
ORDER BY difference DESC;

/* Close vs Open Analysis */

-- 5. Percent change between opening and closing value, organized by the percent change 
SELECT s_index, CAST ((s_close-s_open)/s_open * 100 AS numeric (10,2))as percent_change FROM stocks
WHERE s_close NOTNULL  
ORDER BY percent_change DESC; 

-- 6. Average percent change between opening and closing value, organized by percent change
SELECT s_index, AVG((s_close-s_open)/s_open * 100) AS percent_change
FROM stocks
WHERE s_close NOTNULL
GROUP BY s_index
ORDER BY percent_change DESC;

/* Closing Value Analysis */

-- 7. Average closing value for each index
SELECT s_index, AVG(s_close) FROM stocks
GROUP BY s_index
ORDER BY s_index;

-- 8. Difference between the close and adjusted close values
SELECT s_index, s_close-adj_close as close_difference FROM stocks;

-- 9. Average difference between the close and adjusted close values organized by the stock index.
SELECT s_index, AVG(s_close-adj_close) AS average_difference
FROM stocks
GROUP BY s_index
ORDER BY s_index;

/* Volume Traded Analysis */ 

-- 10. Dollar volume
SELECT s_index, volume * adj_close as dollar_volume FROM stocks
WHERE adj_close NOTNULL
ORDER BY dollar_volume DESC;

-- 11. Total volume traded for each stock organized by total volume
SELECT s_index, SUM(volume)  AS tot_volume FROM stocks
GROUP BY s_index
ORDER BY tot_volume;

-- 12. Total volume traded for each stock organized by stock index
SELECT s_index, SUM(volume) AS total_volume
FROM stocks
GROUP BY s_index
ORDER By s_index;

/* Days Traded Analysis */

-- 13. Total number of days each stock was traded for, ordered by stock
SELECT s_index, COUNT(s_date) AS stock_days
FROM stocks
GROUP BY s_index
ORDER BY s_index;