--SELECT DISTINCT(Class),Color, COUNT(Class) AS 'Class Total'
--FROM [Production].[Product]
--WHERE Color IS NULL --AND Class IS NULL
--GROUP BY Class, Color
--ORDER BY Class DESC, COUNT(Class) DESC

SELECT DISTINCT(SellStartDate)
FROM Production.Product