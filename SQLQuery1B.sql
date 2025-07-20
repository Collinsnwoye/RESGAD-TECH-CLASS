DECLARE @start_time DATETIME = GETDATE()
DECLARE @counter INT = 1

WHILE DATEDIFF(SECOND, @start_time, GETDATE()) < 1
BEGIN
    PRINT CAST(@counter AS VARCHAR)
    SET @counter = @counter + 1
END
