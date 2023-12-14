INSERT INTO BI_BikesDW_56.Fact_InternetSales (
    SalesOrderLineNumber,
    SalesOrderNumber,
    OrderDateKey,
    OrderDate,
    DueDateKey,
    DueDate,
    ShipDateKey,
    ShipDate,
    ProductKey,
    CustomerKey,
    ShipToLocationKey,
    OrderStatus,
    ShipMethod,
    OrderQty,
    UnitPrice,
    OrderLineTotal,
    OrderLineProfit,
    OrderLineTaxAmt,
    OrderLineShippingCost
)
SELECT
    CONCAT('SOL', sh.SalesOrderID, '-', sod.SalesOrderDetailID) AS SalesOrderLineNumber,
    sh.SalesOrderNumber,
    10000 * YEAR(sh.OrderDate) + 100 * MONTH(sh.OrderDate) + DAYOFMONTH(sh.OrderDate) AS OrderDateKey,
    sh.OrderDate,
    10000 * YEAR(sh.DueDate) + 100 * MONTH(sh.DueDate) + DAYOFMONTH(sh.DueDate) AS DueDateKey,
    sh.DueDate,
    10000 * YEAR(sh.ShipDate) + 100 * MONTH(sh.ShipDate) + DAYOFMONTH(sh.ShipDate) AS ShipDateKey,
    sh.ShipDate,
    sod.ProductID,
    sh.CustomerID,
    co.CountryID AS ShipToLocationKey,
    os.OrderStatusName AS OrderStatus,
    sm.ShipMethodName AS ShipMethod,
    sod.OrderQty,
    sod.UnitPrice,
    sod.OrderQty * sod.UnitPrice AS OrderLineTotal,
    (sod.OrderQty * sod.UnitPrice) - (sod.OrderQty * p.StandardCost) AS OrderLineProfit,
    (sod.OrderQty * sod.UnitPrice) * co.TaxRate AS OrderLineTaxAmt,
    ptc.ShipSurcharge + sm.ShipBase + (sod.OrderQty * sm.ShipRate * co.ShipCoeff) AS OrderLineShippingCost
FROM
    BI_Bikes_56.TB_SalesOrderHeader sh
JOIN
    BI_Bikes_56.TB_SalesOrderDetail sod ON sh.SalesOrderID = sod.SalesOrderID
JOIN
    BI_Bikes_56.TB_OrderStatus os ON sh.OrderStatusID = os.OrderStatusID
JOIN 
    BI_Bikes_56.TB_ShipMethod sm ON sh.ShipMethodID = sm.ShipMethodID
JOIN 
    BI_Bikes_56.TB_Product p ON sod.ProductID = p.ProductID
JOIN 
    BI_Bikes_56.TB_Address a ON sh.BillToAddressID = a.AddressID
JOIN
    BI_Bikes_56.TB_Country co ON a.CountryID = co.CountryID
JOIN 
    BI_Bikes_56.TB_ProductSubCategory psc ON p.ProductSubCategoryID = psc.ProductSubCategoryID 
JOIN 
    BI_Bikes_56.TB_ProductTopCategory ptc ON psc.ProductTopCategoryID = ptc.ProductTopCategoryID



    
