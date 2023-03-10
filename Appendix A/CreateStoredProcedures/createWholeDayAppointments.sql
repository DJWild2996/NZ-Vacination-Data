USE [Vaccinations]
GO
/****** Object:  StoredProcedure [dbo].[createWholeDayAppointments]    Script Date: 27/09/2021 1:08:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Create the procedure
CREATE OR ALTER PROCEDURE [dbo].[createWholeDayAppointments] 
	-- Creates a days worth of appointments at a site
	-- No error checking, or checkin gif max Slots is exceeded
	-- No breaks or variations between numbers of slots for each time
	-- Have used smalldatetime rather than datetime2 for intermediate variables for ease of addition

	@placeId char(10) = '',					-- The place
	@day date = NULL,						-- The day
	@startTime time = NULL,					-- First appointment time
	@endTime time = NULL,					-- Last appointment time
	@timeBetweenAppointments time = NULL,	-- The time between appointments
	@slots tinyint = 1						-- How many slots
AS
BEGIN
	DECLARE @appointmentTime smalldatetime
	DECLARE @lastAppointmentTime smalldatetime
	DECLARE @slotNumber tinyint = 1

	SET @appointmentTime = CAST(@day AS smalldatetime) + CAST(@startTime AS smalldatetime)
	SET @lastAppointmentTime = CAST(@day AS smalldatetime) + CAST(@endTime AS smalldatetime)
	WHILE @appointmentTime <= @lastAppointmentTime
	-- Loop thorugh each time
	BEGIN
		SET @slotNumber = 1
		-- Loop through each slot
		WHILE @slotNumber <= @slots
		BEGIN
			-- Create teh slot
			EXEC createAppointment @placeId=@placeId, @slot=@slotNumber, @apptTime=@appointmentTime
			SET @slotNumber = @slotNumber + 1
		END
		SET @appointmentTime = @appointmentTime + CAST(@timeBetweenAppointments AS smalldatetime)
	END
END

