use Vaccinations
Go

CREATE OR ALTER PROCEDURE addpersontoBooking @id int , @placeid char(10), @slot tinyint, @appointment datetime,@vacnumber tinyint, @personid char(12),@vial char(15),@vaccinator char(10)
AS
SELECT * FROM Appointment WHERE id = @id AND placeId = @placeid AND slot = @slot and apptTime = @appointment and vaccineNumber = @vacnumber and personId = @personid and vialNumber = @vial and vaccinator = @vaccinator
GO

declare @id int , @placeid char(10), @slot tinyint, @appointment datetime,@vacnumber tinyint, @personid char(12),@vial char(15),@vaccinator char(10)
EXEC addpersontoBooking @id = 1, @placeid = 'Tim_Wool', @slot = 1, @appointment = '2021-10-25 15:00:00', @vacNumber = '1',@personid = 'DJW2996',@vial = 'myvial', @vaccinator = '12321354'
IF @id is not null and @personid is not null and @appointment is not null
BEGIN
    PRINT 'New appointment booked'
END;
ELSE
    PRINT 'Person already has an appointment booked'

declare @appointment1 datetime,@appointment2 datetime
IF @appointment1 < @appointment2
BEGIN
    PRINT 'New appointment booked'
END;
ELSE
    PRINT 'Person already has an appointment booked'
