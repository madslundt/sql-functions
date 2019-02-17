DECLARE @table_name VARCHAR(100)
DECLARE @column_name VARCHAR(100)

SET @table_name = 'table'
SET @column_name = 'column'

-- Find columns that contains @column_name in table @table_name
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = @table_name AND COLUMN_NAME LIKE '%' + @column_name + '%'

-- Find in all objects where @column_name is used
SELECT OBJECT_NAME(OBJECT_ID),
definition
FROM sys.sql_modules
WHERE definition LIKE '%' + @column_name + '%'

-- Find in stored procedures where @column_name is used
SELECT DISTINCT OBJECT_NAME(OBJECT_ID),
object_definition(OBJECT_ID)
FROM sys.Procedures
WHERE object_definition(OBJECT_ID) LIKE '%' + @column_name + '%'
