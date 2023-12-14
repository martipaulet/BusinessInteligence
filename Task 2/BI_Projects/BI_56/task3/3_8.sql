SELECT
    d.CalendarYear AS 'Calendar Year',
    d.EnglishMonthName AS Month,
    l.Country AS Country,
    SUM(l.TaxRate) AS TotalTax
    
FROM Fact_InternetSales i
JOIN Dim_Location l ON i.ShipToLocationKey = l.LocationKey
JOIN Dim_Date d ON i.OrderDateKey = d.DateKey

WHERE d.MonthNumberOfYear BETWEEN 1 AND 6 
    AND (l.Country = 'France' OR l.Country = 'Germany')
    AND d.CalendarYear = 2021
GROUP BY d.CalendarYear, d.EnglishMonthName, l.Country
ORDER BY CASE d.EnglishMonthName
             WHEN 'January' THEN 1
             WHEN 'February' THEN 2
             WHEN 'March' THEN 3
             WHEN 'April' THEN 4
             WHEN 'May' THEN 5
             WHEN 'June' THEN 6
         END;