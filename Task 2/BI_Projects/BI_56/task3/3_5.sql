SELECT
    dl.Country,
    dd.CalendarYear AS Year,
    dd.EnglishMonthName AS Month,
    SUM(fs.OrderLineShippingCost) AS TotalShippingCost
FROM
    Fact_InternetSales fs
    JOIN Dim_Location dl ON fs.ShipToLocationKey = dl.LocationKey
    JOIN Dim_Date dd ON fs.ShipDateKey = dd.DateKey
WHERE
    dl.Country = 'United Kingdom'
    AND fs.ShipMethod = 'Cargo International'
    AND dd.CalendarYear = 2020
    AND dd.EnglishMonthName IN ('January', 'February', 'March', 'April', 'May', 'June')
GROUP BY
    dl.Country,
    dd.CalendarYear,
    dd.EnglishMonthName
ORDER BY
    dl.Country,
    dd.CalendarYear;
   