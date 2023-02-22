-- Description:	Create Procedure to Bulk Load Appointments
-- =============================================

-- Write your code here
USE Vaccinations

GO

DROP PROCEDURE IF EXISTS bulkLoadAppointments

GO



-- Create the procedure

CREATE PROCEDURE bulkLoadAppointments 

	-- Loads a file of appointments into the Appointment table.  No error checking.

	@fileName varchar(100) = ''	-- The file naem where the data is being loaded from

AS

BEGIN

	DECLARE @sqlString varchar(512) = '' -- The string that is being executed to bulk load the data

	

	--  Create the temporary table to load the data into to loop through

	DROP TABLE IF EXISTS #newAppointments

	CREATE TABLE #newAppointments (
	placeId char(10),
	apptday date,	
	startTime time,					
	endTime time,
	timeBetweenAppointments time,
	slots tinyint,
	)



	-- Create and execute the sql string.  The quotes are important
	SET @sqlString = '
	BULK INSERT #newAppointments
	FROM '''  + @fileName + '''
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = '','',
		ROWTERMINATOR=''\n''
	)'
	EXECUTE (@sqlString)
	

	-- Use a cursor to loop through the temporary table, and load the data into the permanent table

	-- Variables data read from
	DECLARE @placeId char(10)
	DECLARE @day date
	DECLARE @startTime time
	DECLARE @endTime time
	DECLARE @timeBetweenAppointments time
	DECLARE @slotNumber tinyint

	DECLARE newAppointmentsCursor CURSOR FOR
		SELECT placeId FROM #newAppointments
	OPEN newAppointmentsCursor

	FETCH NEXT FROM newAppointmentsCursor INTO @placeId
	WHILE @@FETCH_STATUS = 0
	BEGIN
	SELECT @placeId = placeId, @day = apptday, @startTime = startTime, @endTime = endTime, @timeBetweenAppointments = timeBetweenAppointments, @slotNumber = slots
	FROM #newAppointments
	WHERE placeId = @placeId
	EXEC CreateWholeDayAppointments @placeId=@placeId,@day=@day,@startTime=@startTime,@endTime=@endTime,@timeBetweenAppointments=@timeBetweenAppointments,@slots=@slotNumber
	FETCH NEXT FROM newAppointmentsCursor INTO @placeId
	END
			
			
	-- Tidy up
	CLOSE newAppointmentsCursor
	DEALLOCATE newAppointmentsCursor
	DROP TABLE #newAppointments
END 
GO


-- Testing data
--DELETE FROM Appointment
GO
--SELECT * FROM Appointment
GO
EXEC bulkLoadAppointments @fileName = 'C:\Users\Temp\Vaccine2021\SiteSessionsAugust.csv'
GO
SELECT count(*) AS AppointmentCount FROM Appointment


