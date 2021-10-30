SELECT DISTINCT(Class),Color, COUNT(Class) AS 'Class Total',[ProductNumber]
FROM [Production].[Product]
WHERE Color IS NOT NULL AND Class IS NOT NULL
GROUP BY Class, Color
--HAVING COUNT(Class) > 10
--ORDER BY Class DESC, COUNT(Class) DESC