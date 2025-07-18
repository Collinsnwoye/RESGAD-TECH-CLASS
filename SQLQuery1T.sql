Declare @start_time DATETIME = GETDATE()
WHILE DATEDIFF(SECOND, @start_time, GETDATE()) < 1
BEGIN
    PRINT 'Hi'
END
