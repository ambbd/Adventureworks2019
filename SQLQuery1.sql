Use PortfolioProject
GO 

SELECT TOP (1000) [iso_code]
      ,[continent]
      ,[location]
      ,[date]
      ,[total_cases]
      ,[new_cases]
      ,[new_cases_smoothed]
      ,[total_deaths]
      ,[new_deaths]
      ,[new_deaths_smoothed]
      ,[total_cases_per_million]
      ,[new_cases_per_million]
      ,[new_cases_smoothed_per_million]
      ,[total_deaths_per_million]
      ,[new_deaths_per_million]
      ,[new_deaths_smoothed_per_million]
      ,[reproduction_rate]
      ,[icu_patients]
      ,[icu_patients_per_million]
      ,[hosp_patients]
      ,[hosp_patients_per_million]
      ,[weekly_icu_admissions]
      ,[weekly_icu_admissions_per_million]
      ,[weekly_hosp_admissions]
      ,[weekly_hosp_admissions_per_million]
      ,[new_tests]
      ,[total_tests]
      ,[total_tests_per_thousand]
      ,[new_tests_per_thousand]
      ,[new_tests_smoothed]
      ,[new_tests_smoothed_per_thousand]
      ,[positive_rate]
      ,[tests_per_case]
      ,[tests_units]
      ,[total_vaccinations]
      ,[people_vaccinated]
      ,[people_fully_vaccinated]
      ,[total_boosters]
      ,[new_vaccinations]
      ,[new_vaccinations_smoothed]
      ,[total_vaccinations_per_hundred]
      ,[[total_deaths]]
      ,[people_fully_vaccinated_per_hundred]
      ,[total_boosters_per_hundred]
      ,[new_vaccinations_smoothed_per_million]
      ,[stringency_index]
      ,[population]
      ,[population_density]
      ,[median_age]
      ,[aged_65_older]
      ,[aged_70_older]
      ,[gdp_per_capita]
      ,[extreme_poverty]
      ,[cardiovasc_death_rate]
      ,[diabetes_prevalence]
      ,[female_smokers]
      ,[male_smokers]
      ,[handwashing_facilities]
      ,[hospital_beds_per_thousand]
      ,[life_expectancy]
      ,[human_development_index]
      ,[excess_mortality]
  FROM [PortfolioProject].[dbo].[covid_data]

 -- -- Select distinct continent

 -- SELECT DISTINCT continent
 -- FROM covid_data

 -- SELECT *
 -- FROM covid_data
 -- Where continent is null or continent = ''

 -- -- check to see if continent and location have same data or different data.


 --SELECT DISTINCT location, continent, [new_cases]
 -- FROM covid_data
 -- Where continent = ''

 -- Find continent, location with the highest total number of deaths and highest total of new deaths
 -- What age of group has the most deaths
 -- Get top 20 locations and remove any empty continent field.


 SELECT  TOP(20) continent,location, SUM(CAST(new_deaths as float))  as TotalNewDeaths
 FROM covid_data
 WHERE continent NOT IN (' ')
 GROUP BY  continent,location
 ORDER BY SUM(CAST(new_deaths as float)) desc

 SELECT *
 FROM covid_data

 -- Get the top 50, total number of people fully vaccinated per hundred, who lives in the U.S and compare it to the total number of cases
 SELECT  [date]
       ,continent
       ,SUM(CAST(total_cases AS float))                                                                                AS TotalCovidCases
       ,YEAR([date])                                                                                                   AS [YEAR]
       ,MONTH([date])                                                                                                  AS [MONTH]
       ,DAY(date)                                                                                                      AS [DAY]
       ,SUM(CAST([total_deaths]                                                                                        AS float)) AS TotalCovidDeaths
       ,IIF(SUM(CAST([total_deaths] AS float))=0,0,SUM(CAST(total_cases AS float))/SUM(CAST([total_deaths] AS float))) AS Percentage_of_cases_to_people_vaccinated_perhundred
FROM covid_Data
WHERE continent= 'North America' AND YEAR([date])='2021'
GROUP BY  date
         ,continent
 --ORDER BY SUM(CAST(total_cases as float))/SUM(CAST([total_deaths] as float))
 -- Extrapulate the year, month, and day
 
SELECT [total_cases],[location],[new_cases],[date]
FROM covid_data
WHERE Location LIKE '%United States%' AND
continent= 'North America' AND [date]='2021-09-20'

SELECT sum(cast([new_cases] as float))
FROM covid_data
WHERE Location LIKE '%United States%' AND
continent= 'North America' AND [date] BETWEEN '2020-09-20' and '2021-09-20'