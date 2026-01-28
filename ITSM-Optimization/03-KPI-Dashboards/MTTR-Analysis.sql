-- Mean Time to Resolution (MTTR) Analysis
-- Calculates average resolution time for high and critical incidents

SELECT 
    Priority,
    COUNT(*) AS TotalIncidents,
    AVG(DATEDIFF(hour, OpenTime, CloseTime)) AS AvgResolutionHours,
    MIN(DATEDIFF(hour, OpenTime, CloseTime)) AS MinResolutionHours,
    MAX(DATEDIFF(hour, OpenTime, CloseTime)) AS MaxResolutionHours
FROM Incidents
WHERE Priority IN ('P1', 'P2')
GROUP BY Priority
ORDER BY Priority;
