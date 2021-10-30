USE AdventureWorksDW2019
GO

ALTER PROC CustomerClassificationAndAnalysis @Parameter_customer_age INT, @Parameter_average_children INT

AS

BEGIN

SELECT 
AVG(CustomerT.[YearlyIncome]) AS 'Average Yearly Income',
CustomerT.[Gender],
AVG(CustomerT.[TotalChildren]) As 'Average Children',
YEAR(CustomerT.[BirthDate]) AS 'Year of Birth',
MONTH(CustomerT.[BirthDate]) AS 'Month of Birth',
YEAR(GETDATE())-YEAR(CustomerT.[BirthDate]) AS 'Age of Customer',
GeoT.[City],
GeoT.[StateProvinceName] AS 'State',
GeoT.[EnglishCountryRegionName] AS 'Country',
(CASE 
	WHEN AVG(CustomerT.[YearlyIncome]) between 160000 and 170000
		THEN 'Class A'
	WHEN AVG(CustomerT.[YearlyIncome]) between 150000 and 160000
		THEN 'Class B' 
	WHEN AVG(CustomerT.[YearlyIncome]) between 140000 and 150000
		THEN 'Class C'
	WHEN AVG(CustomerT.[YearlyIncome]) between 130000 and 140000
		THEN 'Class D' 
	WHEN  AVG(CustomerT.[YearlyIncome]) between 120000 and 130000
		THEN 'Class E'
	ELSE 'Class F'
END
) as [Customer Class]


FROM [dbo].[FactInternetSales] AS SalesT


LEFT JOIN [dbo].[DimCustomer] AS CustomerT ON SalesT.CustomerKey = CustomerT.CustomerKey
LEFT JOIN  [dbo].[DimGeography] AS GeoT ON  CustomerT.GeographyKey = GeoT.GeographyKey

WHERE (YEAR(GETDATE())-YEAR(CustomerT.[BirthDate])) < @Parameter_customer_age

GROUP BY CustomerT.[Gender], YEAR(CustomerT.[BirthDate]), MONTH(CustomerT.[BirthDate]), 
GeoT.City, GeoT.[StateProvinceName], GeoT.[EnglishCountryRegionName], 
(CASE 
	WHEN (CustomerT.[YearlyIncome]) between 160000 and 170000
		THEN 'Class A'
	WHEN (CustomerT.[YearlyIncome]) between 150000 and 160000
		THEN 'Class B' 
	WHEN (CustomerT.[YearlyIncome]) between 140000 and 150000
		THEN 'Class C'
	WHEN (CustomerT.[YearlyIncome]) between 130000 and 140000
		THEN 'Class D' 
	WHEN  (CustomerT.[YearlyIncome]) between 120000 and 130000
		THEN 'Class E'
	ELSE 'Class F'
END
)
HAVING AVG(CustomerT.[TotalChildren]) > @Parameter_average_children
END;