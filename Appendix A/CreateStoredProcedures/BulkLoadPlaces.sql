USE [Vaccinations]
GO
/****** Object:  StoredProcedure [dbo].[bulkLoadPlaces]    Script Date: 26/09/2021 2:54:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER PROCEDURE [dbo].[bulkLoadPlaces] 
	-- Loads a file of places into the Place table.  No error checking.
	@fileName varchar(100) = ''	-- The file naem where the data is being loaded from
AS
BEGIN
	DECLARE @sqlString varchar(512) = '' -- The string that is being executed to bulk load the data
	
	--  Create the temporary table to load teh data by copying the structure
	DROP TABLE IF EXISTS #newPlaces
	SELECT TOP 0 * INTO #newPlaces FROM Place

	-- Create and execute teh sql string.  The quotes are important
	SET @sqlString = '
	BULK INSERT #newPlaces
	FROM '''  + @fileName + '''
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = '','',
		ROWTERMINATOR=''\n''
	)'
	EXECUTE (@sqlString)

	-- Use a cursor to loop through teh temporary table, and load the data into the permanent table
	-- Variables data read from
	DECLARE @placeId char(10)
	DECLARE @longName nvarchar(50)
	DECLARE @maxSlots tinyint

	-- the cursor declared and opened
	DECLARE newPlacesCursor CURSOR FOR
		SELECT id FROM #newPlaces
	OPEN newPlacesCursor
	
	-- Loop through the cursor until there is no more data
	FETCH NEXT FROM newPlacesCursor INTO @placeId
	WHILE @@FETCH_STATUS = 0
		BEGIN
			-- Get teh data from teh temporary table
			SELECT @longName = longName, @maxSlots = maxSlots
				FROM #newPlaces
				WHERE id = @placeId
			-- Run teh procedure that enters the data
			EXEC createPlace @id=@placeId, @longName=@longname, @maxSlots=@maxSlots
			-- Get the next lot of data
			FETCH NEXT FROM newPlacesCursor INTO @placeId
		END

	-- Tidy up
	CLOSE newPlacesCursor
	DEALLOCATE newPlacesCursor
	DROP TABLE #newPlaces
END 
GO
-- Testing data
DELETE FROM Place
SELECT * FROM Place
EXEC bulkLoadPlaces @fileName = 'C:\Users\Temp\Vaccine2021\Sites.csv'
SELECT * FROM Place
