INSERT INTO BI_BikesDW_56.Dim_Customer (
    CustomerKey,
    AccountNumber,
    FullName,
    Gender,
    Age
)
SELECT
    c.CustomerID AS CustomerKey,
    c.AccountNumber,
    CONCAT(p.FirstName, ' ', p.MiddleName, ' ', p.LastName) AS FullName,
    p.Gender,
    TIMESTAMPDIFF(YEAR, p.BirthDate, '2021-09-30') AS Age
FROM
    BI_Bikes_56.TB_Customer c
JOIN
    BI_Bikes_56.TB_Person p ON c.PersonID = p.PersonID;

