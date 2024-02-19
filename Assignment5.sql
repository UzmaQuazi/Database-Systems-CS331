/* Assignment 5 In-class View of all tables and columns in UDB database */
create or replace view v_udb_table_columns as
seLect TABLE_NAME, ORDINAL_POSITION as COLUMN_NUM, COLUMN_NAME, DATA_TYPE, COALESCE(CHARACTER_MAXIMUM_LENGTH, NUMERIC_PRECISION) as LENGTH, IS_NULLABLE as NULLABLE
from information_schema.columns
where table_schema = 'udb'
order by table_name, ORDINAL_POSITION;

/* Select everything from the new view: v_udb_table_columns*/
select *
from v_udb_table_columns
order by table_name, COLUMN_NUM;

/* Aggregation technique: Retrieve number of columns per table */
select table_name, count(column_name) as columns
from v_udb_table_columns
group by table_name;
