USE [Vaccinations]
GO
/****** Object:  StoredProcedure [dbo].[createVaccinator]    Script Date: 26/09/2021 3:41:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [dbo].[createVaccinator]

	@ird char(12) = '', 
	@preferredName nchar(20) = ''

	AS

BEGIN

	INSERT INTO Vaccinator(iRDNumber,preferredName) 

		VALUES (@ird, @preferredName)

END

