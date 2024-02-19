/* Drop Index on query table*/
ALTER TABLE query
DROP INDEX idx_query_assignment;


/* Select all queries using IN clause without Index*/
Select count(*) as count From query where query_assn in
('Assignment 3','Assignment 4','Assignment 5','Assignment 6','Assignment 7',
 'Assignment 8', 'Assignment 9', 'Assignment 10', 'Assignment 11');


/* Select all queries using OR clause without Index */
Select count(*) as count From query where
query_assn = 'Assignment 3' or
query_assn = 'Assignment 4' or
query_assn = 'Assignment 5' or
query_assn = 'Assignment 6' or
query_assn = 'Assignment 7' or
query_assn = 'Assignment 8' or
query_assn = 'Assignment 9' or
query_assn = 'Assignment 10' or
query_assn = 'Assignment 11';


/* Select all queries using LIKE Clause without Index */
Select count(*) as count From query where query_assn like 'Assignment %';


/* Select all queries using UNION Clause without Index */
Select sum(c) as count From
(Select count(*) as c From query where query_assn = 'Assignment 3'
union
Select count(*) as c From query where query_assn = 'Assignment 4'
union
Select count(*) as c From query where query_assn = 'Assignment 5'
union
Select count(*) as c From query where query_assn = 'Assignment 6'
union
Select count(*) as c From query where query_assn = 'Assignment 7'
union
Select count(*) as c From query where query_assn = 'Assignment 8'
union
Select count(*) as c From query where query_assn = 'Assignment 9'
union
Select count(*) as c From query where query_assn = 'Assignment 10'
union
Select count(*) as c From query where query_assn = 'Assignment 11')
as counts;


/* Create Index on query table */
CREATE INDEX idx_query_assignment ON query (query_assn);


/* Select all queries using IN clause with Index */
Select count(*) as count From query where query_assn in
('Assignment 3','Assignment 4','Assignment 5','Assignment 6','Assignment 7',
 'Assignment 8', 'Assignment 9', 'Assignment 10', 'Assignment 11');



/* Select all queries using OR clause with Index */
Select count(*) as count From query where
query_assn = 'Assignment 3' or
query_assn = 'Assignment 4' or
query_assn = 'Assignment 5' or
query_assn = 'Assignment 6' or
query_assn = 'Assignment 7' or
query_assn = 'Assignment 8' or
query_assn = 'Assignment 9' or
query_assn = 'Assignment 10' or
query_assn = 'Assignment 11';


/* Select all queries using LIKE Clause with Index */
Select count(*) as count From query where query_assn like 'Assignment %';


/* Select all queries using UNION Clause with Index */
Select sum(c) as count From
(Select count(*) as c From query where query_assn = 'Assignment 3'
union
Select count(*) as c From query where query_assn = 'Assignment 4'
union
Select count(*) as c From query where query_assn = 'Assignment 5'
union
Select count(*) as c From query where query_assn = 'Assignment 6'
union
Select count(*) as c From query where query_assn = 'Assignment 7'
union
Select count(*) as c From query where query_assn = 'Assignment 8'
union
Select count(*) as c From query where query_assn = 'Assignment 9'
union
Select count(*) as c From query where query_assn = 'Assignment 10'
union
Select count(*) as c From query where query_assn = 'Assignment 11')
as counts;


/* Find queries associated with this assignment */
Select query_id, query_desc, query_dur From query where query_assn = 'Assignment12' Order by query_ended desc limit 10;