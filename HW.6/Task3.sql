CREATE PROCEDURE HumanResources.udfCreateObject
@BusinessEntityID int,
@NationalIDNumber NVARCHAR
AS
BEGIN
UPDATE HumanResources.Employee
SET NationalIDNumber = @NationalIDNumber
WHERE BusinessEntityID = @BusinessEntityID
END;
EXEC HumanResources.udfCreateObject @BusinessEntityID=15, @NationalIDNumber='879341111';

SELECT BusinessEntityID, NationalIDNumber
FROM HumanResources.Employee
WHERE BusinessEntityID = 15;