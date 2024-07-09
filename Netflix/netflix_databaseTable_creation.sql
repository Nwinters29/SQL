/* 
    Nick Winters
    Netflix Database and Table Creation
*/

--------------------------------------------------------------------------------
/*				                 Create Database         	 		          */
--------------------------------------------------------------------------------
Create DATABASE Netflix;

--------------------------------------------------------------------------------
/*				               Create Netflix Table         	 		      */
-------------------------------------------------------------------------------- 
CREATE TABLE netflix(
    show_id         VARCHAR(255),
    type            VARCHAR(255),         
    title           TEXT,
    director        TEXT,
    country         VARCHAR(255),
    date_added      DATE,
    release_year    INT,
    rating          VARCHAR(255),
    duration        VARCHAR(255),
    listed_in       VARCHAR(255)
    );

--------------------------------------------------------------------------------
/*				                 Populate Table         	 		          */
--------------------------------------------------------------------------------
COPY netflix
FROM '/Users/Shared/netflix.csv'
WITH (FORMAT CSV,HEADER);
