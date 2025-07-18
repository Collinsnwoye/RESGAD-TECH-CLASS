Declare @start_time DATETIME = GETDATE()

WHILE DATEDIFF(SECOND, @start_time, GETDATE()) < 0.5
BEGIN
    PRINT 'Hi'
END