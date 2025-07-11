CREATE TABLE  dbo.Orders (
custid CHAR(1),
orderid INT Primary Key,
qty INT
);
INSERT INTO dbo.Orders (custid, orderid, qty)
Values 
    ('A', 30001, 10),
    ('A', 40005, 10),
    ('A', 10001, 12),
    ('A', 40001, 40),
    ('B', 20001, 12),
    ('B', 30003, 15),
    ('B', 10005, 20),
    ('C', 10006, 14),
    ('C', 20002, 20),
    ('C', 30004, 22),
    ('D', 30007, 30);

Select *From Orders

SELECT 
    custid, 
    orderid, 
    RANK() OVER (ORDER BY orderid DESC) AS rank_value,
    DENSE_RANK() OVER (ORDER BY orderid DESC) AS dense_rank_value
FROM Orders;

SELECT 
    custid, 
    orderid,
	qty,
    RANK() OVER (ORDER BY qty DESC) AS rnk,
    DENSE_RANK() OVER (ORDER BY qty DESC) AS drnk
FROM Orders;

SELECT 
    custid, 
    orderid, 
    qty, 
    RANK() OVER(PARTITION BY custid ORDER BY qty) AS rnk, 
    DENSE_RANK() OVER(PARTITION BY custid ORDER BY qty) AS drnk
FROM dbo.Orders;

SELECT custid, orderid, qty,
LEAD(qty) OVER(PARTITION BY custid 
               ORDER BY orderid) AS diffprev,
LAG(qty) OVER(PARTITION BY custid
              ORDER BY orderid) AS diffnext
FROM Orders;

SELECT 
    custid, 
    orderid, 
    qty, 56
    LAG(qty) OVER(PARTITION BY custid ORDER BY orderid) AS diffprev, 
    LEAD(qty) OVER(PARTITION BY custid ORDER BY orderid) AS diffnext
FROM dbo.Orders;

SELECT 
    custid, 
    orderid, 
    qty, 
    LAG(qty) OVER(PARTITION BY custid ORDER BY orderid) AS prev_qty, 
    LEAD(qty) OVER(PARTITION BY custid ORDER BY orderid) AS next_qty,
    qty - LAG(qty) OVER(PARTITION BY custid ORDER BY orderid) AS diffprev,
    qty - LEAD(qty) OVER(PARTITION BY custid ORDER BY orderid) AS diffnext
FROM dbo.Orders;




