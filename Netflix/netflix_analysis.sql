/*
    Nickolas Winters
    Netflix Data Manipulation and Analysis
*/

--------------------------------------------------------------------------------
/*				               Data Manipulation  		        		      */
--------------------------------------------------------------------------------
-- Peak the data
SELECT * FROM netflix;

-- Create backup table
CREATE TABLE netflix_backup AS SELECT * FROM netflix;

-- Address the missing values in the country and director columns
UPDATE netflix
SET country = NULL
WHERE country = 'Not Given';

UPDATE netflix
SET director = NULL
WHERE director = 'Not Given';
/*
	Noticed that the string 'Not Given' was used to represent missing information 
	rather than NULL. All records of 'Not Given' in the country and director column 
	were updated to represent NULL.
*/

-- Distinct Countries
SELECT DISTINCT country FROM netflix
ORDER BY country;

-- Update the the country column
UPDATE netflix
SET country = 'Germany'
WHERE country = 'West Germany';
/*
	Noticed that the string 'West Germany' was present in the country list along 
	side 'Germany'. Though historicly correct, because it is an outlier and because 
	as of currently there is only Germany, I replaced 'West Germany' with 'Germany'.
*/

-- Distinct Duration for netflix table
SELECT DISTINCT duration FROM netflix
ORDER BY duration;

-- Segment TV and Movie Data
CREATE TABLE TVshows AS
SELECT * From netflix
WHERE type = 'TV Show';

CREATE TABLE movies AS
SELECT * From netflix
WHERE type = 'Movie';
/*
	Noticed that time duration for movies and season duration for tv was lumped into
	the same column (duration). Decided to create two new tables to better segement 
	the movie data from the TV data.
*/

--------------------------------------------------------------------------------
/*				                Analysis        		        		      */
--------------------------------------------------------------------------------

/* Number of Productions Analysis */

-- Most movie and TV productions by country
SELECT count(title) AS productions, country FROM movies
GROUP BY country
ORDER BY productions DESC;

SELECT count(title) AS productions, country FROM TVshows
GROUP BY country
ORDER BY productions DESC;

-- Most productions by director
SELECT count(title) AS productions, director FROM netflix
GROUP BY director
ORDER BY productions DESC;

/* Duration Analysis */

-- Longest Running Series
SELECT title, duration FROM TVshows
ORDER BY duration DESC;

-- Longest Movie runtime
SELECT title, duration FROM movies
ORDER BY duration DESC;

/* Genre Analysis */

-- Directors and their genres
SELECT title, director, listed_in FROM netflix
ORDER BY director;

-- Most listed genre
SELECT listed_in, count(title) AS productions FROM netflix
GROUP BY listed_in
ORDER BY productions DESC;
