SELECT EndYear AS Year, [1] AS January, [2] AS February, [12] AS December
FROM
(SELECT OrderQty, p.EndYear, p.EndMonth
FROM (
SELECT OrderQty, YEAR(DueDate) AS EndYear, MONTH (DueDate) AS EndMonth	
FROM Production.WorkOrder) p
WHERE p.EndMonth IN (1,2,12)
) AS SourceTable
PIVOT (SUM(OrderQty)
FOR EndMonth IN ([1], [2], [12])
) AS PivotTable
ORDER BY Year ASC
