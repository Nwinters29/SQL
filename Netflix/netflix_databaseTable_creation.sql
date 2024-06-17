/* 
    Nick Winters
    Netflix Database and Table Creation
*/

--------------------------------------------------------------------------------
/*				                 Create Database         	 		          */
--------------------------------------------------------------------------------
Create DATABASE Netflix;

--------------------------------------------------------------------------------
/*				               Create Stocks Table         	 		          */
--------------------------------------------------------------------------------
CREATE TABLE netflix 
(
   s_index VARCHAR (50),
   s_date DATE,
   s_open numeric(10,2),
   s_high numeric(10,2),
   s_low numeric(10,2),
   s_close numeric(10,2),
   adj_close numeric(10,2),
   volume bigint
);

--------------------------------------------------------------------------------
/*				                 Populate Table         	 		          */
--------------------------------------------------------------------------------
COPY netflix
FROM '/Users/Shared/netflix.csv'
WITH (FORMAT CSV,HEADER);