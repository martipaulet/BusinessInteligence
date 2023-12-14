INSERT INTO BI_BikesDW_56.Dim_Date (
    DateKey,
    FullDateAlternateKey,
    DayNumberOfWeek,
    EnglishDayNameOfWeek,
    DayNumberOfMonth,
    DayNumberOfYear,
    WeekNumberOfYear,
    EnglishMonthName,
    MonthNumberOfYear,
    CalendarQuarter,
    CalendarYear
)
SELECT
    YEAR(soh.OrderDate) * 10000 + MONTH(soh.OrderDate) * 100 + DAYOFMONTH(soh.OrderDate) AS DateKey,
    soh.OrderDate AS FullDateAlternateKey,
    DAYOFWEEK(soh.OrderDate) AS DayNumberOfWeek,
    CASE WHEN DAYOFWEEK(soh.OrderDate) = 1 THEN 'Sunday'
         WHEN DAYOFWEEK(soh.OrderDate) = 2 THEN 'Monday'
         WHEN DAYOFWEEK(soh.OrderDate) = 3 THEN 'Tuesday'
         WHEN DAYOFWEEK(soh.OrderDate) = 4 THEN 'Wednesday'
         WHEN DAYOFWEEK(soh.OrderDate) = 5 THEN 'Thursday'
         WHEN DAYOFWEEK(soh.OrderDate) = 6 THEN 'Friday'
         WHEN DAYOFWEEK(soh.OrderDate) = 7 THEN 'Saturday'
    END AS EnglishDayNameOfWeek,
    DAYOFMONTH(soh.OrderDate) AS DayNumberOfMonth,
    DAYOFYEAR(soh.OrderDate) AS DayNumberOfYear,
    WEEK(soh.OrderDate) AS WeekNumberOfYear,
    MONTHNAME(soh.OrderDate) AS EnglishMonthName,
    MONTH(soh.OrderDate) AS MonthNumberOfYear,
    QUARTER(soh.OrderDate) AS CalendarQuarter,
    YEAR(soh.OrderDate) AS CalendarYear
FROM 
    BI_Bikes_56.TB_SalesOrderHeader soh

UNION

SELECT
    YEAR(soh.ShipDate) * 10000 + MONTH(soh.ShipDate) * 100 + DAYOFMONTH(soh.ShipDate) AS DateKey,
    soh.ShipDate AS FullDateAlternateKey,
    DAYOFWEEK(soh.ShipDate) AS DayNumberOfWeek,
    CASE WHEN DAYOFWEEK(soh.ShipDate) = 1 THEN 'Sunday'
         WHEN DAYOFWEEK(soh.ShipDate) = 2 THEN 'Monday'
         WHEN DAYOFWEEK(soh.ShipDate) = 3 THEN 'Tuesday'
         WHEN DAYOFWEEK(soh.ShipDate) = 4 THEN 'Wednesday'
         WHEN DAYOFWEEK(soh.ShipDate) = 5 THEN 'Thursday'
         WHEN DAYOFWEEK(soh.ShipDate) = 6 THEN 'Friday'
         WHEN DAYOFWEEK(soh.ShipDate) = 7 THEN 'Saturday'
    END AS EnglishDayNameOfWeek,
    DAYOFMONTH(soh.ShipDate) AS DayNumberOfMonth,
    DAYOFYEAR(soh.ShipDate) AS DayNumberOfYear,
    WEEK(soh.ShipDate) AS WeekNumberOfYear,
    MONTHNAME(soh.ShipDate) AS EnglishMonthName,
    MONTH(soh.ShipDate) AS MonthNumberOfYear,
    QUARTER(soh.ShipDate) AS CalendarQuarter,
    YEAR(soh.ShipDate) AS CalendarYear
FROM 
    BI_Bikes_56.TB_SalesOrderHeader soh

UNION

SELECT
    YEAR(soh.DueDate) * 10000 + MONTH(soh.DueDate) * 100 + DAYOFMONTH(soh.DueDate) AS DateKey,
    soh.DueDate AS FullDateAlternateKey,
    DAYOFWEEK(soh.DueDate) AS DayNumberOfWeek,
    CASE WHEN DAYOFWEEK(soh.DueDate) = 1 THEN 'Sunday'
         WHEN DAYOFWEEK(soh.DueDate) = 2 THEN 'Monday'
         WHEN DAYOFWEEK(soh.DueDate) = 3 THEN 'Tuesday'
         WHEN DAYOFWEEK(soh.DueDate) = 4 THEN 'Wednesday'
         WHEN DAYOFWEEK(soh.DueDate) = 5 THEN 'Thursday'
         WHEN DAYOFWEEK(soh.DueDate) = 6 THEN 'Friday'
         WHEN DAYOFWEEK(soh.DueDate) = 7 THEN 'Saturday'
    END AS EnglishDayNameOfWeek,
    DAYOFMONTH(soh.DueDate) AS DayNumberOfMonth,
    DAYOFYEAR(soh.DueDate) AS DayNumberOfYear,
    WEEK(soh.DueDate) AS WeekNumberOfYear,
    MONTHNAME(soh.DueDate) AS EnglishMonthName,
    MONTH(soh.DueDate) AS MonthNumberOfYear,
    QUARTER(soh.DueDate) AS CalendarQuarter,
    YEAR(soh.DueDate) AS CalendarYear
FROM 
    BI_Bikes_56.TB_SalesOrderHeader soh;

