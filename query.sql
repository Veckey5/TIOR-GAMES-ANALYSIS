SELECT
    DateYear,
    [MSI],
    [WORLDS]
FROM
(
SELECT    
    DateYear,
    EventName,
    (SpectatorsNumber+VIPSpectatorsNumber)AS Total
FROM    
    EventDim ed, EventFact ef, DateDim dd
    WHERE ef.DateID = dd.DateID AND ef.EventID = ed.EventID
) up
PIVOT(
   SUM(Total)
    FOR EventName IN ( [MSI], [WORLDS]))AS PVT
 ORDER BY DateYear ASC  
