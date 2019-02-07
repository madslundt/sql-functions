DECLARE @table_name VARCHAR(100)
DECLARE @column_name VARCHAR(100)

SET @table_name = 'table'
SET @column_name = 'column'

-- Find columns that contains @column_name in table @table_name
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = @table_name AND COLUMN_NAME LIKE '%' + @column_name + '%'
