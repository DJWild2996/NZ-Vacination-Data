use Vaccinations
Go

CREATE OR ALTER PROCEDURE SelectVaccinationNumber @appointment datetime, @vacNumber tinyint, @vaccinator char(10)
AS
SELECT * FROM Appointment WHERE apptTime = @appointment AND vaccineNumber = @vacNumber AND vaccinator = @vaccinator
and @appointment < getdate() and @vacNumber < 2
GO

declare @appointment datetime, @vacNumber tinyint, @vaccinator char(10)
EXEC SelectVaccinationNumber @appointment = '2021-08-02 09:00:00', @vacNumber = '1', @vaccinator = '12321354'
IF @appointment > getdate() and @vacNumber = '1' and @vaccinator is not null
BEGIN
    PRINT 'Future booking on the same vaccination number future booking will be cancelled'
END;
ELSE
    PRINT 'Future booking has the correct vaccination number'