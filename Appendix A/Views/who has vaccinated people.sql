USE Vaccinations
GO

-- 1. Assist with searching for who has vaccinated people
-- Create index on Vaccinator table
create index VaccinatorIndex
on [dbo].[Vaccinator] ([preferredName]);

-- Does not do much to speed up quiery speed
select [iRDNumber], [preferredName]
from [dbo].[Vaccinator]

-- Creating Views as well as index is a better solution the will increase performance
create or alter view MyVaccinator as
select [iRDNumber], [preferredName]
from [dbo].[Vaccinator]
where [iRDNumber] = 12321354;

select * from MyVaccinator;