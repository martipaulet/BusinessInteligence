-- Populate Dim_Location Table
INSERT INTO BI_BikesDW_56.Dim_Location (
    LocationKey,
    Country,
    Region,
    TaxRate,
    ShipCoeff
)
SELECT
    CountryID AS LocationKey,
    Country,
    Region,
    TaxRate,
    ShipCoeff
FROM
    BI_Bikes_56.TB_Country;
