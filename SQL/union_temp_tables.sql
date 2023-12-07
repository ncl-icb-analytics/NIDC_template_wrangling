/*
Use this script to UNION the outputs of the R script into a sandpit table.
Comment out providers as neccesary
*/

IF OBJECT_ID('NCL.dbo.ExampleTableName', 'U') IS NOT NULL
DROP TABLE [NCL].[dbo].[ExampleTableName]

SELECT
*
INTO [NCL].[dbo].[ExampleTableName]
FROM ##UCLH

UNION ALL

SELECT
*
FROM ##GOSH

UNION ALL

-- 24 rows
SELECT
*
FROM ##MOOR

UNION ALL

SELECT
*
FROM ##WHIT

UNION ALL

SELECT
*

FROM ##NMUH

union all

SELECT
*
FROM ##RNOH


/*
Use this part to remove providers (or other rows) from the sandpit table, and insert new data.
Useful if changes are made to the excel file.
Commented out for safety.
*/

/*
DELETE FROM [NCL].[dbo].[ExampleTableName] WHERE LEFT(trust_site_code,3) IN ('XXX','YYY')

INSERT INTO  [NCL].[dbo].[ExampleTableName]
SELECT
*
FROM ##RFL
*/

