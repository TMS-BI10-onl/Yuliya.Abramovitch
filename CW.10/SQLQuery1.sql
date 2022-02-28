--1) Найдите людей и их номера телефонов, код города которых начинается на  4 и заканчивается на 5. (таблицы Person.PersonPhone, Person.Person) 
SELECT FirstName, LastName, PhoneNumber
FROM [Person].[Person] 
JOIN [Person].[PersonPhone]
ON Person.BusinessEntityID=PersonPhone.BusinessEntityID
WHERE PhoneNumber LIKE '4_5%'

--2) Отнести каждого человека из [HumanResources].[Employee] в свою возрастную категорию:
--Adolescence: 17-20
--Adults: 21-59
--Elderly: 60-75
--Senile: 76-90
SELECT BusinessEntityID, NationalIDNumber, BirthDate, (2022-LEFT (BirthDate,4))AS Range,
CASE WHEN (2022-LEFT (BirthDate,4)) BETWEEN 17 AND 20 THEN 'Adolescence'
	WHEN (2022-LEFT (BirthDate,4)) BETWEEN 21 AND 59 THEN 'Adults'
	WHEN (2022-LEFT (BirthDate,4)) BETWEEN 60 AND 75 THEN 'Elderly'
	WHEN (2022-LEFT (BirthDate,4)) BETWEEN 76 AND 90 THEN 'Senile'
	END Category
FROM [HumanResources].[Employee]
ORDER BY BirthDate

--3) Вывести самый дорогой продукт для каждого цвета из [Production].[Product]
SELECT Color, Name, StandardCost, MAX (StandardCost) OVER (PARTITION BY Color) 
FROM [Production].[Product]  




--SELECT TOP (1) WITH TIES Name, StandardCost