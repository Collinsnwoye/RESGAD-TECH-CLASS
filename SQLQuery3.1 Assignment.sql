CREATE TABLE Sales_OrderValues (
val Decimal(10,2)
);

INSERT INTO Sales_OrderValues (val)
VALUES 
    (12.50), (18.40), (23.80), (28.00), (30.00),
    (33.75), (36.00), (40.00), (45.00), (48.00);

SELECT val, ROW_NUMBER() OVER(ORDER BY val) AS rownum 
FROM Sales_OrderValues 
GROUP BY val; 

Select val, DENSE_RANK() OVER(ORDER BY val) AS rownum
FROM Sales_OrderValues
GROUP BY val;

Select val, DENSE_RANK() OVER(ORDER BY val) AS rownum
FROM Sales_OrderValues;

Select val, RANK() OVER(ORDER BY val) AS rownum
FROM Sales_OrderValues
GROUP BY val;

Select val, RANK() OVER(ORDER BY val) AS rownum
FROM Sales_OrderValues;

SELECT DISTINCT val, ROW_NUMBER() OVER(ORDER BY val) AS rownum 

FROM Sales_OrderValues;
