CREATE TABLE FunctionCounter (Function_Name NVARCHAR (30), Function_Count INT)
MERGE FunctionCounter AS targt  
USING (SELECT a FROM [dbo].[data_for_merge]) AS src 
ON targt.Function_Name=src.a
WHEN MATCHED THEN 
UPDATE SET targt.Function_Count = targt.Function_Count+1
WHEN NOT MATCHED BY TARGET AND src.a IS NOT NULL
THEN INSERT (Function_Name, Function_Count)
VALUES (src.a, 1);

MERGE FunctionCounter AS targt  
USING (SELECT b FROM [dbo].[data_for_merge]) AS src 
ON targt.Function_Name=src.b
WHEN MATCHED THEN 
UPDATE SET targt.Function_Count = targt.Function_Count+1
WHEN NOT MATCHED BY TARGET AND src.b IS NOT NULL
THEN INSERT (Function_Name, Function_Count)
VALUES (src.b, 1);

MERGE FunctionCounter AS targt  
USING (SELECT c FROM [dbo].[data_for_merge]) AS src 
ON targt.Function_Name=src.c
WHEN MATCHED THEN 
UPDATE SET targt.Function_Count = targt.Function_Count+1
WHEN NOT MATCHED BY TARGET AND src.c IS NOT NULL
THEN INSERT (Function_Name, Function_Count)
VALUES (src.c, 1);

MERGE FunctionCounter AS targt  
USING (SELECT d FROM [dbo].[data_for_merge]) AS src 
ON targt.Function_Name=src.d
WHEN MATCHED THEN 
UPDATE SET targt.Function_Count = targt.Function_Count+1
WHEN NOT MATCHED BY TARGET AND src.d IS NOT NULL
THEN INSERT (Function_Name, Function_Count)
VALUES (src.d, 1);

MERGE FunctionCounter AS targt  
USING (SELECT e FROM [dbo].[data_for_merge]) AS src 
ON targt.Function_Name=src.e
WHEN MATCHED THEN 
UPDATE SET targt.Function_Count = targt.Function_Count+1
WHEN NOT MATCHED BY TARGET AND src.e IS NOT NULL
THEN INSERT (Function_Name, Function_Count)
VALUES (src.e, 1);

MERGE FunctionCounter AS targt  
USING (SELECT f FROM [dbo].[data_for_merge]) AS src 
ON targt.Function_Name=src.f
WHEN MATCHED THEN 
UPDATE SET targt.Function_Count = targt.Function_Count+1
WHEN NOT MATCHED BY TARGET AND src.f IS NOT NULL
THEN INSERT (Function_Name, Function_Count)
VALUES (src.f, 1);

MERGE FunctionCounter AS targt  
USING (SELECT g FROM [dbo].[data_for_merge]) AS src 
ON targt.Function_Name=src.g
WHEN MATCHED THEN 
UPDATE SET targt.Function_Count = targt.Function_Count+1
WHEN NOT MATCHED BY TARGET AND src.g IS NOT NULL
THEN INSERT (Function_Name, Function_Count)
VALUES (src.g, 1);

MERGE FunctionCounter AS targt  
USING (SELECT h FROM [dbo].[data_for_merge]) AS src 
ON targt.Function_Name=src.h
WHEN MATCHED THEN 
UPDATE SET targt.Function_Count = targt.Function_Count+1
WHEN NOT MATCHED BY TARGET AND src.h IS NOT NULL
THEN INSERT (Function_Name, Function_Count)
VALUES (src.h, 1);

MERGE FunctionCounter AS targt  
USING (SELECT i FROM [dbo].[data_for_merge]) AS src 
ON targt.Function_Name=src.i
WHEN MATCHED THEN 
UPDATE SET targt.Function_Count = targt.Function_Count+1
WHEN NOT MATCHED BY TARGET AND src.i IS NOT NULL
THEN INSERT (Function_Name, Function_Count)
VALUES (src.i, 1);


--Есть ли способ, чтобы сделать это "полотно" короче?

/*
SELECT*
FROM [dbo].[FunctionCounter]
ORDER BY Function_Name
*/

/*
SELECT *
FROM [dbo].[data_for_merge]
*/ 
