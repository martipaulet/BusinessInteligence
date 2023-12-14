WITH RankedCategories AS (
    SELECT
        p.ProductTopCategoryName,
        p.ProductSubCategoryName,
        p.ProductModelName,
        SUM(i.OrderQty) AS 'QuantitySold',
        ROW_NUMBER() OVER (PARTITION BY p.ProductTopCategoryName ORDER BY SUM(i.OrderQty) DESC) AS CategoryRank
    FROM
        Fact_InternetSales i
    JOIN
        Dim_Product p ON i.ProductKey = p.ProductKey
    GROUP BY
        p.ProductTopCategoryName, p.ProductSubCategoryName, p.ProductModelName
)
SELECT
    ProductTopCategoryName AS 'Product Top Category',
    ProductSubCategoryName AS 'Product Sub Category',
    ProductModelName AS 'Product Model',
    QuantitySold AS 'Quantity Sold'
FROM
    RankedCategories
WHERE
    CategoryRank <= 3
ORDER BY
    ProductTopCategoryName, QuantitySold DESC;