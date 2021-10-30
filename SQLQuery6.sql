USE [70-461]
GO

--Creating DATABASE Objects:

ALTER TABLE dbo.tblEmployee
ADD Department VARCHAR(10);

SELECT * 
FROM dbo.tblEmployee

INSERT INTO tblEmployee
VALUES(132,	'Dylan',	'A',	'Word',	'KT597579M',	'5/15/1974',	'Litigation')

ALTER TABLE dbo.tblEmployee
DROP COLUMN Deparment

ALTER TABLE dbo.tblEmployee
ADD Department VARCHAR(15);

WITH CTE AS
( SELECT EmployeeNumber, EmployeeFirstName, EmployeeMiddleName, EmployeeGovernmentID, DateofBirth, Department, ROW_NUMBER() OVER
(PARTITION BY EmployeeFirstName, EmployeeMiddleName, EmployeeGovernmentID, DateofBirth, Department
ORDER BY EmployeeFirstName, EmployeeMiddleName, EmployeeGovernmentID, DateofBirth, Department) row_num FROM tblEmployee
)  
DELETE FROM cte WHERE row_num > 1;  

ALTER TABLE dbo.tblEmployee
ALTER COLUMN Department VARCHAR(20)

SELECT LEN( 'Department')

INSERT INTO tblEmployee([EmployeeNumber],[EmployeeFirstName],[EmployeeMiddleName],[EmployeeLastName],[EmployeeGovernmentID],[DateofBirth],[Department])
VALUES ( 133,	'Diane',	'L',	'Wood',	'MA038420I', '10/31/1993',	'HR')

--+++++++++++++++++++++

