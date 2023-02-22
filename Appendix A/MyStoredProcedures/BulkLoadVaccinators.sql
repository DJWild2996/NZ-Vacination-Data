-- Write your code here
USE [Vaccinations]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE [dbo].[bulkLoadVaccinators]
	-- Loads a file of places into the Place table.  No error checking.
	@fileName varchar(100) = ''	-- The file naem where the data is being loaded from
AS
BEGIN
	DECLARE @sqlString varchar(512) = '' -- The string that is being executed to bulk load the data

		--  Create the temporary table to load teh data by copying the structure
	DROP TABLE IF EXISTS #newVaccinator
	SELECT TOP 0 * INTO #newVaccinator FROM Vaccinator

		-- Create and execute teh sql string.  The quotes are important
	SET @sqlString = '
	BULK INSERT #newVaccinator
	FROM '''  + @fileName + '''
	WITH (
		FIRSTROW = 1,
		FIELDTERMINATOR = '','',
		ROWTERMINATOR=''\n''
	)'
	EXECUTE (@sqlString)

		-- Use a cursor to loop through teh temporary table, and load the data into the permanent table
	-- Variables data read from
	DECLARE @ird char(12)
	DECLARE @preferredName nchar(20)

		-- the cursor declared and opened
	DECLARE newVaccinatorCursor CURSOR FOR
		SELECT iRDNumber FROM #newVaccinator
	OPEN newVaccinatorCursor

		-- Loop through the cursor until there is no more data
	FETCH NEXT FROM newVaccinatorCursor INTO @ird
	WHILE @@FETCH_STATUS = 0
		BEGIN
			-- Get teh data from teh temporary table
			SELECT @ird = iRDNumber, @preferredName = preferredName
				FROM #newVaccinator
				WHERE iRDNumber = @ird
			-- Run teh procedure that enters the data
			EXEC createVaccinator @ird=@ird, @preferredName=@preferredName
			-- Get the next lot of data
			FETCH NEXT FROM newVaccinatorCursor INTO @ird
		END

			-- Tidy up
	CLOSE newVaccinatorCursor
	DEALLOCATE newPlacesCursor
	DROP TABLE #newVaccinator
END 
GO


-- Testing data
DELETE FROM Vaccinator
SELECT * FROM Vaccinator
EXEC bulkLoadVaccinators @fileName = 'C:\Users\Temp\Vaccine2021\Vaccinators.csv'
SELECT * FROM Vaccinator


