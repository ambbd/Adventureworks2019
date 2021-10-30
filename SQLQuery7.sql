/****** Script for SelectTopNRows command from SSMS  ******/
SELECT *
FROM tblEmployee
WHERE [EmployeeLastName] like '_%';

-- % = 0 infninity chracters
-- _ = 1 character
-- [A-g] = In the range A-G
-- [AGQ] = A,G, or Q.
-- [^AGQ] = NOT A, G or Q


select * 
FROM tblEmployee
WHERE EmployeeLastName like '[%]%';

select * 
FROM tblEmployee
WHERE not EmployeeNumber > 200

select * 
FROM tblEmployee
WHERE EmployeeNumber !=200

select * 
FROM tblEmployee
WHERE not (EmployeeNumber >= 200 and EmployeeNumber<=209)

select * 
from tblEmployee
where EmployeeNumber<200 or EmployeeNumber>209

Select *
FROM tblEmployee 
where EmployeeNumber between 200 and 209

select *
FROM tblEmployee 
where EMployeeNumber in (200, 204, 208)

--57. Summarising and ordering data.

select *
FROM tblEmployee 
where DateofBirth between '19760101' and '19861231'
year 1976 and 1986 

select *
FROM tblEmployee 
where DateofBirth >=  '19760101' and '19861231' < '19870101'

select *
FROM tblEmployee 
where year(DateofBirth) between 1976 and 1986

select year(DateofBirth) as YearOfDateOfBirth, count(*) as NumberBorn
FROM tblEmployee
GROUP BY year(DateofBirth)

SELECT * FROM tblEmployee
where year(DateofBirth) = 1967

SELECT year(DateOfBirth) as YearofDateofBirth, count(*) as NumberBorn
FROM tblEmployee
WHERE 1=1
GROUP BY year(DateofBirth)
--non deterministic; given the same input, the output will be the same.
ORDER BY year(DateofBirth) ASC

select top(5) left(EmployeeLastName,1) as Initial, count(*) as CountofInitial
FROM tblEmployee
group by left(EmployeeLastName,1)
order by count(*) DESC

select left(EmployeeLastName,1) as Initial, count(*) as CountofInitial
FROM tblEmployee
where DateofBirth > '19860101'
group by left(EmployeeLastName,1)
having count(*)>=20
order by count(*) DESC

