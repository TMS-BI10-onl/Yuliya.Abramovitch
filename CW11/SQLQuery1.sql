--Определить контролера, который на городских маршрутах собрал большую сумму штрафов.
WITH fullTable
AS 
	(
	SELECT Inspector.InspectorName, RouteType.Type, Jorney.Fine
	FROM Inspector
	LEFT JOIN Route
	ON Inspector.InspectorID = Jorney.InspectorID
	LEFT JOIN Route
	ON Jorney.RouteID = Route.RouteID
	LEFT JOIN RouteType
	ON Route.RoutetypeID = RouteType.TypeID
	WHERE Inspector IS NOT NULL AND RouteType.Type='CITY'
	)
SELECT TOP (1) *
FROM (
	SELECT DriverName,  SUM (Fine) as LeaderOfFine
	FROM fullTable
	GROUP BY DriverName) AS FineCount
ORDER BY FineCount.LeaderOfFine DESC


--Вывести водителей (с указанием ФИО) и их кол-во рейсов по типам маршрутов за январь 2022 года. 
--Результаты вывести в виде транспорнированной таблицы (оси - водители и типы маршрутов).
WITH FullTable
AS (
SELECT *
FROM Driver
JOIN Jorney
ON Driver.DriverID = Jorney.DriverID
JOIN Route
ON Jorney.RouteID = Route.RouteID
JOIN RouteType
ON Route.RouteTypeID = RouteType.TypeID
WHERE YEAR(Jorney.Date)=2022 AND MONTH(Jorney.Date)='January'
)
SELECT DriverName, [Urban], [Intercity], [International]
FROM (
	SELECT RouteType, DriverName, MONTH(RouteDate)
	FROM FullTable
	) Ft
PIVOT
	(COUNT (DriverName)
	FOR RouteType IN ([Urban], [Intercity], [International] )
) tab