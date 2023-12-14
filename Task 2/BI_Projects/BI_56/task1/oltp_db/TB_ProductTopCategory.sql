CREATE TABLE IF NOT EXISTS TB_ProductTopCategory (
    ProductTopCategoryID INT NOT NULL,
    Name VARCHAR(50) NOT NULL,
    ShipSurcharge DECIMAL(13,4),

    CONSTRAINT PK_ProductTopCategory 
    PRIMARY KEY (ProductTopCategoryID)
);