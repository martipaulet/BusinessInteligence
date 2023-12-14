WITH RankedCountries AS (
    SELECT
        l.Country AS Country,
        SUM(i.OrderLineProfit) AS TotalProfit,
        ROW_NUMBER() OVER (ORDER BY SUM(i.OrderLineProfit) DESC) AS CountryRank
    FROM
        Fact_InternetSales i
    JOIN
        Dim_Location l ON i.ShipToLocationKey = l.LocationKey
    JOIN
        Dim_Product p ON i.ProductKey = p.ProductKey
    WHERE
        i.UnitPrice BETWEEN 1000 AND 2000
    GROUP BY
        l.Country
)
SELECT
    Country,
    TotalProfit AS Profit
FROM
    RankedCountries
WHERE
    CountryRank <= 3
ORDER BY
    TotalProfit DESC;